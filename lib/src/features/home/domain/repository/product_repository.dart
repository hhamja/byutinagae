import 'package:byutinagae/src/features/home/domain/model/detail_product_model.dart';
import 'package:byutinagae/src/features/home/domain/model/ingredient_model.dart';
import 'package:byutinagae/src/features/home/domain/model/ingredient_modification_request_model.dart';
import 'package:byutinagae/src/features/home/domain/model/product_list_model.dart';

abstract class ProductRepository {
  // // 카테고리의 전체 제품 받는 페이지네이션 쿼리
  // queryAllCategoryProducts(TopProductCategory topCategory);

  // 특정 중분류 제품 리스트 받는 페이지네이션 쿼리
  queryCategoryProducts(String middleCategory);

  // 제품 세부정보 데이터 받기
  Future<DetailProductModel> fetchProductDetail(String id);

  // 특정 제품의 성분 정보 받기
  Future<List<IngredientModel>> fetchIngredientList(String id);

  // 클린뷰티 프리뷰 받기
  Future<List<ProductListModel>> fetchPreviewCleanBeautyProducts(
      String topCategory);
  // 인기제품 프리뷰 받기
  Future<List<ProductListModel>> fetchPreviewPopularProducts();

  // 특정 대분류 클린뷰티 제품 받기
  Future<List<ProductListModel>> fetchTopCategoryCleanBeautyProducts(
      String topCategory);

  // 특정 대분류 인기제품 받기
  Future<List<ProductListModel>> fetchTopCategoryPopularProducts(
      String category);

  // 성분 수정 요청
  Future requestIngredientModification(
      IngredientModificationRequestModel model);
}
