import 'package:byutinagae/src/features/home/domain/model/ingredient_model.dart';
import 'package:byutinagae/src/features/home/domain/provider/product_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 성분 리스트 프로바이더
final ingredientListProvider = FutureProvider.autoDispose
    .family<List<IngredientModel>, String>((ref, id) async {
  final repository = ref.watch(productRepositoryProvider);
  // 특정 제품의 성분 정보 받기
  final ingredientList = repository.fetchIngredientList(id);
  return ingredientList;
});
