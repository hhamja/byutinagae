import 'package:byutinagae/src/features/home/domain/model/product_model.dart';
import 'package:byutinagae/src/features/search/domain/provider/search_repository_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// 검색 제품 상태관리 프로바이더
final paginatedSearchListProvider = StateNotifierProvider.autoDispose.family<
    PaginatedSearchListNotifier, AsyncValue<List<ProductModel>>, String>(
  (ref, query) => PaginatedSearchListNotifier(ref, query),
);

// 페이지네이션 적용 검색 결과 비동기 상태관리
class PaginatedSearchListNotifier
    extends StateNotifier<AsyncValue<List<ProductModel>>> {
  final Ref ref;
  final String query;

  PaginatedSearchListNotifier(this.ref, this.query)
      : super(const AsyncLoading()) {
    // init로 실행할 함수
    initFetchSearchList();
  }

  // 첫 페이지 데이터 받기
  Future initFetchSearchList() async {
    try {
      final repository = ref.watch(searchRepositoryProvider);
      final products = await repository.fetchSearchProductList(query, 0);
      state = AsyncValue.data(products);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  // 다음 페이지 데이터 추가로 받기
  Future fetchAdditionalProducts(int currentPage) async {
    try {
      final repository = ref.watch(searchRepositoryProvider);
      final currentProducts = state.value ?? [];
      // 추가 데이터 가져오기
      final additionalProducts =
          await repository.fetchSearchProductList(query, currentPage);
      // 현재 데이터와 추가 데이터를 합치기
      final updatedProducts = [...currentProducts, ...additionalProducts];
      state = AsyncValue.data(updatedProducts);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
