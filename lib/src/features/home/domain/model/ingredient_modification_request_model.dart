import 'package:byutinagae/src/common/json_converter/json_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_modification_request_model.freezed.dart';
part 'ingredient_modification_request_model.g.dart';

@freezed
class IngredientModificationRequestModel
    with _$IngredientModificationRequestModel {
  const factory IngredientModificationRequestModel({
    // 요청 보낸 uid
    required String uid,
    // 브랜드
    required String brand,
    // 제품 이름
    required String productName,
    // 유저가 입력한 성분정보
    required String ingredient,
    // 성분 수정 요청 시간
    @TimeStampConverter() required Timestamp createdAt,
  }) = _IngredientModificationRequestModel;

  factory IngredientModificationRequestModel.fromJson(
          Map<String, dynamic> json) =>
      _$IngredientModificationRequestModelFromJson(json);
}
