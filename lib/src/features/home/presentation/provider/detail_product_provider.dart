import 'package:byutinagae/src/features/home/domain/model/detail_product_model.dart';
import 'package:byutinagae/src/features/home/domain/provider/product_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 특정 제품 세부정보 받는 FutureProvider
final productDetailProvider = FutureProvider.autoDispose
    .family<DetailProductModel, String>((ref, id) async {
  final repository = ref.watch(productRepositoryProvider);

  final detailProduct = await repository.getDetailProduct(id);
  return detailProduct;
});
