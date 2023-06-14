import 'package:byutinagae/src/features/home/domain/model/product_list_model.dart';

// 검색 리파지토리 인터페이스
abstract class SearchRepository {
  Future fetchMoreSearchList(String searchInput);

  // 페이지네이션 적용하여 검색결과 가져오기
  Future<List<ProductListModel>> fetchSearchProductList(
      String query, int currentPage);

  // 최근 검색어 로컬에 List로 저장
  Future<List<String>> addSearchQuery(String searchInput);

  // 최근 검색어 받기
  Future<List<String>> getSearchList();

  // 특정 최근 검색어 index 제거
  Future<List<String>> removeSearchIndex(int index);

  // 특정 최근 검색어 index 제거
  Future removeAllSearchIndex();
}
