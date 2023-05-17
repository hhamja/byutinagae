// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_modification_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IngredientModificationRequestModel
    _$$_IngredientModificationRequestModelFromJson(Map<String, dynamic> json) =>
        _$_IngredientModificationRequestModel(
          uid: json['uid'] as String,
          brand: json['brand'] as String,
          productName: json['productName'] as String,
          ingredient: json['ingredient'] as String,
          createdAt: const TimeStampConverter().fromJson(json['createdAt']),
        );

Map<String, dynamic> _$$_IngredientModificationRequestModelToJson(
        _$_IngredientModificationRequestModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'brand': instance.brand,
      'productName': instance.productName,
      'ingredient': instance.ingredient,
      'createdAt': const TimeStampConverter().toJson(instance.createdAt),
    };
