import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    // 카테고리
    required String category,
    // 풀사이즈 사진
    required String fullImage,
    // 썸네일 사진
    required String thumbnailImage,
    // 브랜드 명
    required String brand,
    // 제품 이름
    required String productName,
    // 제품 용량
    required String volume,
    // 가격
    @PriceConverter() required String price,
    // 랭킹
    required int ranking,
    // 평점 점수의 총합
    // 나중에 총 수/ 리뷰 수 = 평균 평점 구현
    required int totalScore,
    required int reivewCount,
    // 제품 등록 시간
    required DateTime createdAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
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
