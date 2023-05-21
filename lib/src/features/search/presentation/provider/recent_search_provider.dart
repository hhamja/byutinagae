import 'package:byutinagae/src/features/search/domain/provider/search_repository_provider.dart';
import 'package:byutinagae/src/features/search/domain/repository/search_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 최근 검색어
final recentSearchListProvider =
    StateNotifierProvider<RecentSearchListNotifier, List<String>>(
  (ref) => RecentSearchListNotifier(ref.watch(searchRepositoryProvider)),
);

// 최근 검색어 StateNotifier
class RecentSearchListNotifier extends StateNotifier<List<String>> {
  final SearchRepository repository;
  RecentSearchListNotifier(this.repository) : super([]);

  // 검색 내용 로컬에 추가
  Future addSearchQuery(query) async {
    state = await repository.addSearchQuery(query);
  }

  // 최근검색 리스트 받기
  Future getSearchList() async {
    state = await repository.getSearchList();
  }

  // 특정 최근 검색 항목 삭제
  Future removeSearchIndex(index) async {
    state = await repository.removeSearchIndex(index);
  }

  // 최근검색기록 전부 삭제
  Future removeAllSearchIndex() async {
    state = await repository.removeAllSearchIndex() ?? [];
  }
}
