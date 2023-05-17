import 'package:byutinagae/src/features/request/domain/model/request_additional_product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:byutinagae/src/config/constant/firebase_constant.dart';
import 'package:byutinagae/src/features/request/domain/repository/request_product_repository.dart';

// 제품 요청 로직 실제 구현 정의
class RequestProductRepositoryImplement implements RequestRepository {
  final requestProductRef =
      FirebaseFirestore.instance.collection(FirebaseConstant.requestProductRef);

  // 유저 제품 및 카테고리 추가 요청 서버에 저장
  @override
  Future addRequestProduct(RequestAdditionalProductModel model) async {
    return requestProductRef.add(model.toJson());
  }
}
