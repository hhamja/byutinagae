import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:byutinagae/src/config/constant/firebase_constant.dart';
import 'package:byutinagae/src/features/feedback/data/feedback_repository_interface.dart';

final feedbackRepositoryProvider = Provider<FeedbackRepository>((ref) {
  return FeedbackRepository();
});

class FeedbackRepository implements FeedbackRepositoryInterface {
  final _feedbackRef =
      FirebaseFirestore.instance.collection(FirebaseConstant.feedbackRef);

  // 유저 제품 및 카테고리 추가 요청 서버에 저장
  @override
  Future addUserFeedback(content) async {
    _feedbackRef;
  }
}
