import 'package:byutinagae/src/features/home/domain/model/product_list_model.dart';
import 'package:byutinagae/src/features/home/domain/provider/product_repository_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 카테고리 제품 리스트 페이지 - 페이지네이션 쿼리
final categoryProductsProvider =
    Provider.family<Query<ProductListModel>, String>((ref, String category) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.queryCategoryProducts(category);
});
