import 'package:byutinagae/src/features/home/domain/enum/product_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 상황별 탭바 라벨 리스트 프로바이더 정의
final tabLabelProvider = Provider.family((ref, category) {
  if (category == TopProductCategory.wash) {
    // 목욕/워시 제품 리스트 페이지 탭바
    return const ['샴푸', '린스/컨디셔너'];
  } else if (category == TopProductCategory.skincare) {
    // 스킨케어 제품 리스트 페이지 탭바
    return const ['미스트', '보습제'];
  } else if (category == TopProductCategory.dentalcare) {
    // 덴탈케어 제품 리스트 페이지 탭바
    return const ['치약'];
  } else if (category == TopProductCategory.deodorant) {
    // 탈취제 제품 리스트 페이지 탭바
    return const ['향수/탈취'];
  } else {
    // 클린뷰티템 탭바
    return const ['샴푸', '린스/컨디셔너', '미스트', '보습제', '탈취제', '치약'];
  }
});
