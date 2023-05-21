// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchProductModel _$$_SearchProductModelFromJson(
        Map<String, dynamic> json) =>
    _$_SearchProductModel(
      id: json['id'] as String? ?? '',
      category: json['category'] as String,
      thumbnailImage:
          const ImageUrlConverter().fromJson(json['thumbnailImage'] as List),
      fullImage: const ImageUrlConverter().fromJson(json['fullImage'] as List),
      brand: json['brand'] as String,
      productName: json['productName'] as String,
      volume: json['volume'] as String,
      price: const PriceConverter().fromJson(json['price'] as int),
    );

Map<String, dynamic> _$$_SearchProductModelToJson(
        _$_SearchProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'thumbnailImage':
          const ImageUrlConverter().toJson(instance.thumbnailImage),
      'fullImage': const ImageUrlConverter().toJson(instance.fullImage),
      'brand': instance.brand,
      'productName': instance.productName,
      'volume': instance.volume,
      'price': const PriceConverter().toJson(instance.price),
    };
