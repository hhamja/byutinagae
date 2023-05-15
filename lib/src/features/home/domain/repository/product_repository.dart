import 'package:byutinagae/src/features/home/domain/model/detail_product_model.dart';
import 'package:byutinagae/src/features/home/domain/model/ingredient_model.dart';
import 'package:byutinagae/src/features/home/domain/model/product_list_model.dart';

abstract class ProductRepository {
  // 제품 리스트 받기
  Future<List<ProductListModel>> getProductList();

  // 특정 제품 세부 정보 받
  Future<DetailProductModel> getDetailProduct(id);

  // 특정 제품의 성분 정보 받기
  Future<List<IngredientModel>> getProductIngredient(id);

  // 성분 수정 요청
  Future addIngredientEditRequest(brand, productname);
}
