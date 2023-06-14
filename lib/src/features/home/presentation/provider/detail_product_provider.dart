import 'package:byutinagae/src/features/home/domain/provider/product_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 제품 세부정보 프로바이더
final productDetailProvider =
    FutureProvider.autoDispose.family((ref, String id) async {
  final repository = ref.watch(productRepositoryProvider);
  // 제품 세부정보 받기
  return repository.fetchProductDetail(id);
});
