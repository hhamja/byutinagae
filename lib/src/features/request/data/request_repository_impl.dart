import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:byutinagae/src/config/constant/firebase_constant.dart';
import 'package:byutinagae/src/features/request/domain/repository/request_repository.dart';

final requestRepositoryProvider = Provider<RequestRepository>((ref) {
  return RequestRepositoryImplement();
});

// 역할 :
class RequestRepositoryImplement implements RequestRepository {
  final requestRef =
      FirebaseFirestore.instance.collection(FirebaseConstant.requestRef);

  // 유저 제품 및 카테고리 추가 요청 서버에 저장
  @override
  Future addUserFeedback(content) async {}
}
