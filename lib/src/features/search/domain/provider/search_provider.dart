import 'package:byutinagae/src/features/search/data/repository_impl/search_repository_impl.dart';
import 'package:byutinagae/src/features/search/domain/repository/search_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 검색 리파지토리 프로바이더
final searchRepositoryProvider = Provider<SearchRepository>(
  (ref) => SearchRepositoryImplement(),
);
