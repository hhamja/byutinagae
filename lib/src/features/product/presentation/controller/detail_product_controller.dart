import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:byutinagae/src/features/product/data/product_repository_impl.dart';
import 'package:byutinagae/src/features/product/domain/detail_product_model.dart';
import 'package:byutinagae/src/features/product/domain/ingredient_model.dart';

// 특정 제품 세부정보 받는 FutureProvider
final productDetailProvider =
    FutureProvider.family<DetailProductModel, String>((ref, productId) async {
  final repository = ref.watch(productRepositoryProvider);

  final detailProduct = await repository.getDetailProduct(productId);
  return detailProduct;
});

// 특정 제품의 성분정보 받는 FutureProvider
final ingredientProvider = FutureProvider.family<List<IngredientModel>, String>(
    (ref, productId) async {
  final repository = ref.watch(productRepositoryProvider);
  // 특정 제품의 성분 정보 받기
  final ingredientList = await repository.getProductIngredient(productId);
  return ingredientList;
});
