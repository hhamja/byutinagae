import 'package:byutinagae/src/features/home/domain/enum/product_category.dart';
import 'package:byutinagae/src/features/home/domain/provider/product_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// // 대분류 카테고리의 전체 제품 받기
// final allCategoryProductsProvider =
//     Provider.family((ref, TopProductCategory productCategory) {
//   final repository = ref.watch(productRepositoryProvider);
//   return repository.queryAllCategoryProducts(productCategory);
// });

// 특정 카테고리의 제품 리스트 받기
final categoryProductsProvider = Provider.family((ref, String category) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.queryCategoryProducts(category);
});

final categoryListProvider =
    StateProvider.family<List<String>, TopProductCategory>((ref, topCategory) {
  // 카테고리 이름 반환 함수
  // 특정 카테고리의 제품 리스트를 받을 떄 쓰일 쿼리 텍스트
  final List<String> categoryNameList = [];
  if (topCategory == TopProductCategory.wash) {
    // 목욕, 워시
    for (var value in WashCategory.values) {
      final String valueName = value.name;
      categoryNameList.add(valueName);
    }
  } else if (topCategory == TopProductCategory.skincare) {
    // 스킨케어
    for (var value in SkinCareCategory.values) {
      final String valueName = value.name;
      categoryNameList.add(valueName);
    }
  } else if (topCategory == TopProductCategory.dentalcare) {
    // 덴탈케어
    for (var value in DentalCareCategory.values) {
      final String valueName = value.name;
      categoryNameList.add(valueName);
    }
  } else if (topCategory == TopProductCategory.deodorant) {
    // 탈취제
    for (var value in DeodorantCategory.values) {
      final String valueName = value.name;
      categoryNameList.add(valueName);
    }
  }

  return categoryNameList;
});
