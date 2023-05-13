// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IngredientModel _$$_IngredientModelFromJson(Map<String, dynamic> json) =>
    _$_IngredientModel(
      id: json['id'] as int,
      korName: json['korName'] as String,
      blendingPurpose: json['blendingPurpose'] as String,
      ewg: json['ewg'] as String,
    );

Map<String, dynamic> _$$_IngredientModelToJson(_$_IngredientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'korName': instance.korName,
      'blendingPurpose': instance.blendingPurpose,
      'ewg': instance.ewg,
    };
