import 'package:byutinagae/src/common/json_converter/json_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_list_model.freezed.dart';
part 'product_list_model.g.dart';

@freezed
class ProductListModel with _$ProductListModel {
  const factory ProductListModel({
    required String id,
    // 대분류  ex. "스킨케어"
    required String topCategory,
    // 중분류  ex. "미스트", "보습제"
    required String middleCategory,
    // 소분류  ex. "해충방지", "보습", "엉킴방지" 등등
    // required String subCategory,
    // 썸네일 이미지 url
    @ImageUrlConverter() required String thumbnailImage,
    // 브랜드 명
    required String brand,
    // 제품 이름
    required String productName,
    // 제품 용량
    required String volume,
    // 가격
    @PriceConverter() required String price,
    // 제품 등록 시간
    @TimeStampConverter() required Timestamp createdAt,
  }) = _ProductListModel;

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      _$ProductListModelFromJson(json);
}
