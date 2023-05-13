import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'product_list_model.freezed.dart';
part 'product_list_model.g.dart';

@freezed
class ProductListModel with _$ProductListModel {
  const factory ProductListModel({
    required String id,
    // 카테고리
    required String category,
    // 제품 사진
    required String thumbnailImage,
    // 브랜드 명
    required String brand,
    // 제품 이름
    required String productName,
    // 제품 용량
    required String volume,
    // 가격
    @PriceConverter() required String price,
    // 제품 등록 시간
    required DateTime createdAt,

    // 평점 점수의 총합
    // 나중에 총 수/ 리뷰 수 = 평균 평점 구현
    // required int totalScore,
    // required int reivewCount,
  }) = _ProductListModel;

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      _$ProductListModelFromJson(json);
}

// int타입 가격을 화폐 타입의 String으로 변환
class PriceConverter implements JsonConverter<String, int> {
  const PriceConverter();

  @override
  String fromJson(int price) {
    try {
      // 23000 -> "23,000원"
      final formattedPrice = NumberFormat('#,###원').format(price).toString();
      debugPrint(formattedPrice);
      return formattedPrice;
    } catch (e) {
      throw const FormatException();
    }
  }

  @override
  int toJson(String object) {
    throw 'UnimplementedError()';
  }
}
