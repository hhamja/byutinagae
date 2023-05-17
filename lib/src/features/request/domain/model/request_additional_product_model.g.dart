// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_additional_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestAdditionalProductModel _$$_RequestAdditionalProductModelFromJson(
        Map<String, dynamic> json) =>
    _$_RequestAdditionalProductModel(
      uid: json['uid'] as String,
      content: json['content'] as String,
      createdAt: const TimeStampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_RequestAdditionalProductModelToJson(
        _$_RequestAdditionalProductModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'content': instance.content,
      'createdAt': const TimeStampConverter().toJson(instance.createdAt),
    };
