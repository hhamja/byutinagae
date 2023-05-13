// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DetailProductModel _$$_DetailProductModelFromJson(
        Map<String, dynamic> json) =>
    _$_DetailProductModel(
      id: json['id'] as String,
      fullImage: json['fullImage'] as String,
      brand: json['brand'] as String,
      productName: json['productName'] as String,
      volume: json['volume'] as String,
      price: const PriceConverter().fromJson(json['price'] as int),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_DetailProductModelToJson(
        _$_DetailProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullImage': instance.fullImage,
      'brand': instance.brand,
      'productName': instance.productName,
      'volume': instance.volume,
      'price': const PriceConverter().toJson(instance.price),
      'createdAt': instance.createdAt.toIso8601String(),
    };
