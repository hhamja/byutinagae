// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchProductModel _$$_SearchProductModelFromJson(
        Map<String, dynamic> json) =>
    _$_SearchProductModel(
      productId: json['productId'] as String,
      category: json['category'] as String,
      thumbnailImage:
          const ImageUrlConverter().fromJson(json['thumbnailImage'] as List),
      brand: json['brand'] as String,
      productName: json['productName'] as String,
      volume: json['volume'] as String,
      price: const PriceConverter().fromJson(json['price'] as int),
      createdAt: const TimeStampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_SearchProductModelToJson(
        _$_SearchProductModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'category': instance.category,
      'thumbnailImage':
          const ImageUrlConverter().toJson(instance.thumbnailImage),
      'brand': instance.brand,
      'productName': instance.productName,
      'volume': instance.volume,
      'price': const PriceConverter().toJson(instance.price),
      'createdAt': const TimeStampConverter().toJson(instance.createdAt),
    };
