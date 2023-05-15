import 'package:byutinagae/src/features/home/domain/model/product_list_model.dart';
import 'package:byutinagae/src/features/home/domain/provider/product_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productListProvider = FutureProvider<List<ProductListModel>>((ref) async {
  final repository = ref.watch(productRepositoryProvider);

  // 제품 리스트 GET
  final productList = await repository.getProductList();

  return productList;
});
