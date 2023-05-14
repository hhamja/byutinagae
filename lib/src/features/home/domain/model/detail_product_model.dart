import 'package:byutinagae/src/features/home/domain/json_converter/json_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_product_model.freezed.dart';
part 'detail_product_model.g.dart';

@freezed
class DetailProductModel with _$DetailProductModel {
  const factory DetailProductModel({
    required String productId,
    // 제품 사진
    @ImageUrlConverter() required String fullImage,
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
    // 평점 점수의 총합
    // 나중에 총 수/ 리뷰 수 = 평균 평점 구현
    // required int totalScore,
    // required int reivewCount,
  }) = _DetailProductModel;

  factory DetailProductModel.fromJson(Map<String, dynamic> json) =>
      _$DetailProductModelFromJson(json);
}
