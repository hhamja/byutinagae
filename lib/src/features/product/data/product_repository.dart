import 'package:byutinagae/src/features/product/domain/detail_product_model.dart';
import 'package:byutinagae/src/features/product/domain/ingredient_model.dart';
import 'package:byutinagae/src/features/product/domain/product_list_model.dart';

abstract class ProductRepository {
  // 제품 리스트 받기
  Future<List<ProductListModel>> getProductList();

  // 특정 제품 세부 정보 받기
  Future<DetailProductModel> getDetailProduct(id);

  // 특정 제품의 성분 정보 받기
  Future<List<IngredientModel>> getProductIngredient(id);

  // 최근 검색어 로컬에 List로 저장
  Future<List<String>> addSearchQuery(String query);

  // 최근 검색어 받기
  Future<List<String>> getSearchList();

  // 특정 최근 검색어 index 제거
  Future<List<String>> removeSearchIndex(int index);

  // 특정 최근 검색어 index 제거
  Future removeAllSearchIndex();

  // 제품 데이터 검색하기
  Future<List<ProductListModel>> searchProduct(String query);

  // 성분 수정 요청
  Future addIngredientEditRequest(brand, productname);
}
