import 'package:byutinagae/src/features/home/data/repository_impl/product_repository_impl.dart';
import 'package:byutinagae/src/features/home/domain/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 제품 리파지토리 프로바이더
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImplement();
});
