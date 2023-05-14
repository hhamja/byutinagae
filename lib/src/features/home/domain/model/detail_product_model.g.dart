// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DetailProductModel _$$_DetailProductModelFromJson(
        Map<String, dynamic> json) =>
    _$_DetailProductModel(
      productId: json['productId'] as String,
      fullImage: const ImageUrlConverter().fromJson(json['fullImage'] as List),
      brand: json['brand'] as String,
      productName: json['productName'] as String,
      volume: json['volume'] as String,
      price: const PriceConverter().fromJson(json['price'] as int),
      createdAt: const TimeStampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_DetailProductModelToJson(
        _$_DetailProductModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'fullImage': const ImageUrlConverter().toJson(instance.fullImage),
      'brand': instance.brand,
      'productName': instance.productName,
      'volume': instance.volume,
      'price': const PriceConverter().toJson(instance.price),
      'createdAt': const TimeStampConverter().toJson(instance.createdAt),
    };
