import 'package:byutinagae/src/features/request/domain/model/request_additional_product_model.dart';

abstract class RequestRepository {
  // 유저 제품 및 카테고리 추가 요청 서버에 저장
  Future addRequestProduct(RequestAdditionalProductModel model);
}
