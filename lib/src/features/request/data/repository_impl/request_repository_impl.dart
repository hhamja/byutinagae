import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:byutinagae/src/config/constant/firebase_constant.dart';
import 'package:byutinagae/src/features/request/domain/repository/request_repository.dart';

// 요청 로직 실제 구현 정의
class RequestRepositoryImplement implements RequestRepository {
  final requestRef =
      FirebaseFirestore.instance.collection(FirebaseConstant.requestRef);

  // 유저 제품 및 카테고리 추가 요청 서버에 저장
  @override
  Future requestAddProduct(content) async {}
}
