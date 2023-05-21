// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductListModel _$$_ProductListModelFromJson(Map<String, dynamic> json) =>
    _$_ProductListModel(
      id: json['id'] == null
          ? ''
          : const DocumentIdConverter()
              .fromJson(json['id'] as DocumentSnapshot<Object>),
      category: json['category'] as String,
      thumbnailImage:
          const ImageUrlConverter().fromJson(json['thumbnailImage'] as List),
      fullImage: const ImageUrlConverter().fromJson(json['fullImage'] as List),
      brand: json['brand'] as String,
      productName: json['productName'] as String,
      volume: json['volume'] as String,
      price: const PriceConverter().fromJson(json['price'] as int),
      createdAt: const TimeStampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_ProductListModelToJson(_$_ProductListModel instance) =>
    <String, dynamic>{
      'id': const DocumentIdConverter().toJson(instance.id),
      'category': instance.category,
      'thumbnailImage':
          const ImageUrlConverter().toJson(instance.thumbnailImage),
      'fullImage': const ImageUrlConverter().toJson(instance.fullImage),
      'brand': instance.brand,
      'productName': instance.productName,
      'volume': instance.volume,
      'price': const PriceConverter().toJson(instance.price),
      'createdAt': const TimeStampConverter().toJson(instance.createdAt),
    };
