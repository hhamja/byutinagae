import 'package:byutinagae/src/features/home/domain/model/product_list_model.dart';
import 'package:byutinagae/src/features/home/domain/provider/product_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 특정 카테고리의 클린뷰티템 받기
final categoryCleanBeautyProductsProvider = FutureProvider.autoDispose
    .family<List<ProductListModel>, String>((ref, topCategory) async {
  final repository = ref.watch(productRepositoryProvider);

  final categoryCleanBeautyList =
      await repository.fetchTopCategoryCleanBeautyProducts(topCategory);
  return categoryCleanBeautyList;
});

// 홈 - 프리뷰 클린뷰티템 받기
final previewCleanBeautyProductsProvider = FutureProvider.autoDispose
    .family<List<ProductListModel>, String>((ref, topCategory) async {
  final repository = ref.watch(productRepositoryProvider);

  final previewCleanBeautyList =
      await repository.fetchPreviewCleanBeautyProducts(topCategory);
  return previewCleanBeautyList;
});
