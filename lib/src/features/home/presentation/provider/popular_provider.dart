import 'package:byutinagae/src/features/home/domain/enum/product_category.dart';
import 'package:byutinagae/src/features/home/domain/model/product_model.dart';
import 'package:byutinagae/src/features/home/domain/provider/product_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 특정 카테고리의 인기제품 받기
final categoryPopularProductsProvider = FutureProvider.autoDispose
    .family<List<ProductModel>, AllProductLine>((ref, productLine) async {
  final repository = ref.watch(productRepositoryProvider);

  final popularList =
      await repository.fetchCategoryPopularProducts(productLine);
  return popularList;
});

// 홈 - 프리뷰 인기템 받기
final previewPopularProductsProvider =
    FutureProvider.autoDispose<List<ProductModel>>((ref) async {
  final repository = ref.watch(productRepositoryProvider);

  final previewPopularList = await repository.fetchPreviewPopularProducts();
  return previewPopularList;
});
