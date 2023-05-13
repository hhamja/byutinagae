import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:byutinagae/src/features/product/data/product_repository_impl.dart';
import 'package:byutinagae/src/features/product/domain/product_list_model.dart';

final productListProvider = FutureProvider<List<ProductListModel>>((ref) async {
  final repository = ref.watch(productRepositoryProvider);

  // 제품 리스트 GET
  final productList = await repository.getProductList();

  return productList;
});
