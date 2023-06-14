import 'package:algolia/algolia.dart';
import 'package:byutinagae/src/config/constant/firebase_constant.dart';
import 'package:byutinagae/src/features/home/domain/model/product_list_model.dart';

import 'package:byutinagae/src/features/search/domain/repository/search_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SearchRepositoryImplement implements SearchRepository {
  final productRef =
      FirebaseFirestore.instance.collection(FirebaseConstant.productRef);

  // 페이지네이션 다음 데이터 가져오기
  @override
  Future fetchMoreSearchList(String searchInput) async {}

  // 페이지네이션 적용, 검색 결과 가져오기
  @override
  Future<List<ProductListModel>> fetchSearchProductList(
      String searchInput, int currentPage) async {
    final List<ProductListModel> productList = [];
    // 한번에 받을 데이터 최대 개수
    const int limit = 10;
    final Algolia algolia = Algolia.init(
        applicationId: dotenv.env['ALGOLIA_APP_ID']!,
        apiKey: dotenv.env['ALGOLIA_API_KEY']!);
    // 페이지네이션 쿼리
    final AlgoliaQuery query = algolia.instance
        .index('product')
        .search(searchInput)
        .setHitsPerPage(limit)
        .setPage(currentPage);

    final AlgoliaQuerySnapshot querySnapshot = await query.getObjects();
    // 데이터 추가 반복문
    for (var snapshot in querySnapshot.hits) {
      final ProductListModel model = ProductListModel.fromJson(snapshot.data);
      productList.add(model);
    }

    return productList;
  }

  // 최근 검색어 로컬에 List로 저장
  @override
  Future<List<String>> addSearchQuery(String query) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? searchList = prefs.getStringList('searchList');
    if (searchList == null) {
      searchList = [query];
    } else {
      searchList.insert(0, query);
    }
    await prefs.setStringList('searchList', searchList);

    return searchList;
  }

  // 최근 검색어 받기
  @override
  Future<List<String>> getSearchList() async {
    final prefs = await SharedPreferences.getInstance();
    // 없다면 null반환, 있다면 리스트 반환
    List<String>? searchList = prefs.getStringList('searchList');
    // null이면 ? 빈 리스트 반환
    searchList ??= [];
    return searchList;
  }

  // 특정 최근 검색어 index 제거
  @override
  Future<List<String>> removeSearchIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> searchList = prefs.getStringList('searchList') ?? [];
    searchList.removeAt(index);
    await prefs.setStringList('searchList', searchList);
    return searchList;
  }

  // 모든 최근 검색어 제거
  @override
  Future removeAllSearchIndex() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('searchList');
  }
}
