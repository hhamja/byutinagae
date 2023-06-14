import 'package:byutinagae/src/features/home/domain/model/product_list_model.dart';
import 'package:byutinagae/src/features/home/domain/provider/product_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 대분류 인기템 리스트 받기
final categoryPopularProductsProvider = FutureProvider.autoDispose
    .family<List<ProductListModel>, String>((ref, topCategory) async {
  final repository = ref.watch(productRepositoryProvider);

  final popularList =
      await repository.fetchTopCategoryPopularProducts(topCategory);
  return popularList;
});

// 홈 - 프리뷰 인기템 받기
final previewPopularProductsProvider =
    FutureProvider.autoDispose<List<ProductListModel>>((ref) async {
  final repository = ref.watch(productRepositoryProvider);

  final previewPopularList = repository.fetchPreviewPopularProducts();
  return previewPopularList;
});
