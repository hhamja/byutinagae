import 'package:byutinagae/src/common/json_converter/json_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_additional_product_model.freezed.dart';
part 'request_additional_product_model.g.dart';

@freezed
class RequestAdditionalProductModel with _$RequestAdditionalProductModel {
  const factory RequestAdditionalProductModel({
    // 요청 보낸 uid
    required String uid,
    // 입력 내용 ex) 닥터맘마 샴푸
    required String content,
    // 제품 추가 요청 시간
    @TimeStampConverter() required Timestamp createdAt,
  }) = _RequestAdditionalProductModel;

  factory RequestAdditionalProductModel.fromJson(Map<String, dynamic> json) =>
      _$RequestAdditionalProductModelFromJson(json);
}
