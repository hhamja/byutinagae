import 'package:byutinagae/src/features/search/domain/model/search_product_model.dart';

// 검색 리파지토리 인터페이스
abstract class SearchRepository {
  // 제품 검색하기
  Future<List<SearchProductModel>> searchProduct(String query);

  // 최근 검색어 로컬에 List로 저장
  Future<List<String>> addSearchQuery(String query);

  // 최근 검색어 받기
  Future<List<String>> getSearchList();

  // 특정 최근 검색어 index 제거
  Future<List<String>> removeSearchIndex(int index);

  // 특정 최근 검색어 index 제거
  Future removeAllSearchIndex();
}
