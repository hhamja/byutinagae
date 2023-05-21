import 'package:byutinagae/src/features/home/domain/provider/product_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 페이지네이션 적용하여 제품 리스트 받기
final paginatedProductListProvider = Provider((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.queryPaginatedProductList();
});
