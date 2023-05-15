// 특정 제품의 성분정보 받는 FutureProvider
import 'package:byutinagae/src/features/home/domain/model/ingredient_model.dart';
import 'package:byutinagae/src/features/home/domain/provider/product_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ingredientProvider = FutureProvider.autoDispose
    .family<List<IngredientModel>, List<String>>((ref, idList) async {
  final repository = ref.watch(productRepositoryProvider);
  // 특정 제품의 성분 정보 받기
  final ingredientList = await repository.getProductIngredient(idList);
  return ingredientList;
});
