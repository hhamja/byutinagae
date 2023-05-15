import 'package:byutinagae/src/features/search/data/repository_impl/search_repository_impl.dart';
import 'package:byutinagae/src/features/search/domain/model/search_product_model.dart';
import 'package:byutinagae/src/features/search/domain/repository/search_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 제품 검색 결과
final searchProductListProvider =
    FutureProvider.family<List<SearchProductModel>, String>(
  (ref, query) async {
    final repository = ref.watch(searchRepositoryProvider);

    // 검색 제품 리스트 받기
    final searchProductList = await repository.searchProduct(query);
    return searchProductList;
  },
);

// 최근 검색어
final recentSearchListProvider =
    StateNotifierProvider<SearchListNotifier, List<String>>(
  (ref) => SearchListNotifier(ref.watch(searchRepositoryProvider)),
);

// 최근 검색어 StateNotifier
class SearchListNotifier extends StateNotifier<List<String>> {
  final SearchRepository repository;
  SearchListNotifier(this.repository) : super([]);

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
