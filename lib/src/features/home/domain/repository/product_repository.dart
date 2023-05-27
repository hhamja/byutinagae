import 'package:byutinagae/src/features/home/domain/enum/product_category.dart';
import 'package:byutinagae/src/features/home/domain/model/ingredient_model.dart';
import 'package:byutinagae/src/features/home/domain/model/ingredient_modification_request_model.dart';
import 'package:byutinagae/src/features/home/domain/model/product_model.dart';

abstract class ProductRepository {
  // 카테고리의 전체 제품 받는 페이지네이션 쿼리
  queryAllCategoryProducts(TopProductCategory topCategory);

  // 특정 제품의 리스트만 받는 페이지네이션 쿼리
  queryCategoryProducts(String category);

  // 특정 제품의 성분 정보 받기
  Future<List<IngredientModel>> fetchIngredientList(String id);

  // 성분 수정 요청
  Future requestIngredientModification(
      IngredientModificationRequestModel model);

  // 클린뷰티 프리뷰 받기
  Future<List<ProductModel>> fetchPreviewCleanBeautyProducts();

  // 특정 카테고리 클린뷰티 제품 받기
  Future<List<ProductModel>> fetchCategoryCleanBeautyProducts(
      AllProductLine productLine);

  // 인기제품 프리뷰 받기
  Future<List<ProductModel>> fetchPreviewPopularProducts();

  // 특정 카테고리 인기제품 받기
  Future<List<ProductModel>> fetchCategoryPopularProducts(
      AllProductLine productLine);
}
