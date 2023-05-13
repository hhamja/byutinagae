// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductListModel _$$_ProductListModelFromJson(Map<String, dynamic> json) =>
    _$_ProductListModel(
      id: json['id'] as String,
      category: json['category'] as String,
      thumbnailImage: json['thumbnailImage'] as String,
      brand: json['brand'] as String,
      productName: json['productName'] as String,
      volume: json['volume'] as String,
      price: const PriceConverter().fromJson(json['price'] as int),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_ProductListModelToJson(_$_ProductListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'thumbnailImage': instance.thumbnailImage,
      'brand': instance.brand,
      'productName': instance.productName,
      'volume': instance.volume,
      'price': const PriceConverter().toJson(instance.price),
      'createdAt': instance.createdAt.toIso8601String(),
    };
