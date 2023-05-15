import 'package:byutinagae/src/features/search/domain/model/search_product_model.dart';
import 'package:byutinagae/src/features/search/domain/repository/search_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final searchRepositoryProvider = Provider<SearchRepository>(
  (ref) => SearchRepositoryImplement(),
);

class SearchRepositoryImplement implements SearchRepository {
  // 제품 검색하기
  @override
  Future<List<SearchProductModel>> searchProduct(String query) async {
    final List<SearchProductModel> searchProductList = [];

    return searchProductList;
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
