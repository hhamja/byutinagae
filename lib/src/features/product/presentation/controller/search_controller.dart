import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:byutinagae/src/features/product/data/product_repository_impl.dart';
import 'package:byutinagae/src/features/product/domain/product_list_model.dart';

final searchListProvider =
    StateNotifierProvider<SearchListController, List<String>>(
        (ref) => SearchListController(ref.watch(productRepositoryProvider)));

// 최근 검색어 StateNotifier
class SearchListController extends StateNotifier<List<String>> {
  final repository;
  SearchListController(this.repository) : super([]);

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

final searchProductListProvider =
    FutureProvider.family<List<ProductListModel>, String>((ref, query) async {
  final repository = ref.watch(productRepositoryProvider);

  // 검색 제품 리스트 받기
  final searchProductList = await repository.searchProduct(query);
  return searchProductList;
});
