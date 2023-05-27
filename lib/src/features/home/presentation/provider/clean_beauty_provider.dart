import 'package:byutinagae/src/features/home/domain/enum/product_category.dart';
import 'package:byutinagae/src/features/home/domain/model/product_model.dart';
import 'package:byutinagae/src/features/home/domain/provider/product_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 특정 카테고리의 클린뷰티템 받기
final categoryCleanBeautyProductsProvider = FutureProvider.autoDispose
    .family<List<ProductModel>, AllProductLine>((ref, productLine) async {
  final repository = ref.watch(productRepositoryProvider);

  final categoryCleanBeautyList =
      await repository.fetchCategoryCleanBeautyProducts(productLine);
  return categoryCleanBeautyList;
});

// 홈 - 프리뷰 클린뷰티템 받기
final previewCleanBeautyProductsProvider =
    FutureProvider.autoDispose<List<ProductModel>>((ref) async {
  final repository = ref.watch(productRepositoryProvider);

  final previewCleanBeautyList =
      await repository.fetchPreviewCleanBeautyProducts();
  return previewCleanBeautyList;
});
