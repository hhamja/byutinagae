import 'package:byutinagae/src/common/json_converter/json_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_product_model.freezed.dart';
part 'detail_product_model.g.dart';

@freezed
class DetailProductModel with _$DetailProductModel {
  const factory DetailProductModel({
    required String id,
    // 풀 사이즈 이미지 url
    @ImageUrlConverter() required String fullImage,
    // 브랜드 명
    required String brand,
    // 제품 이름
    required String productName,
    // 제품 용량
    required String volume,
    // 가격
    @PriceConverter() required String price,
  }) = _DetailProductModel;

  factory DetailProductModel.fromJson(Map<String, dynamic> json) =>
      _$DetailProductModelFromJson(json);
}
