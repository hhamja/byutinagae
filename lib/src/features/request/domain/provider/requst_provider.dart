import 'package:byutinagae/src/features/request/data/repository_impl/request_repository_impl.dart';
import 'package:byutinagae/src/features/request/domain/repository/request_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 요청 리파지토리 프로바이더
final requestRepositoryProvider = Provider<RequestRepository>((ref) {
  return RequestRepositoryImplement();
});
