// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductListModel _$$_ProductListModelFromJson(Map<String, dynamic> json) =>
    _$_ProductListModel(
      id: json['id'] as String,
      topCategory: json['topCategory'] as String,
      middleCategory: json['middleCategory'] as String,
      thumbnailImage:
          const ImageUrlConverter().fromJson(json['thumbnailImage'] as List),
      brand: json['brand'] as String,
      productName: json['productName'] as String,
      volume: json['volume'] as String,
      price: const PriceConverter().fromJson(json['price'] as int),
      createdAt: const TimeStampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_ProductListModelToJson(_$_ProductListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topCategory': instance.topCategory,
      'middleCategory': instance.middleCategory,
      'thumbnailImage':
          const ImageUrlConverter().toJson(instance.thumbnailImage),
      'brand': instance.brand,
      'productName': instance.productName,
      'volume': instance.volume,
      'price': const PriceConverter().toJson(instance.price),
      'createdAt': const TimeStampConverter().toJson(instance.createdAt),
    };
