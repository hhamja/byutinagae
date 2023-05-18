import 'package:byutinagae/src/features/home/domain/model/ingredient_model.dart';
import 'package:byutinagae/src/features/home/domain/model/ingredient_modification_request_model.dart';

abstract class ProductRepository {
  // 페이지네이션 제품 리스트 받기
  queryPaginatedProductList();

  // 특정 제품의 성분 정보 받기
  Future<List<IngredientModel>> fetchIngredientList(String id);

  // 성분 수정 요청
  Future requestIngredientModification(
      IngredientModificationRequestModel model);
}
