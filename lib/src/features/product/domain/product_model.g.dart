// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as String,
      category: json['category'] as String,
      fullImage: json['fullImage'] as String,
      thumbnailImage: json['thumbnailImage'] as String,
      brand: json['brand'] as String,
      productName: json['productName'] as String,
      volume: json['volume'] as String,
      price: const PriceConverter().fromJson(json['price'] as int),
      ranking: json['ranking'] as int,
      totalScore: json['totalScore'] as int,
      reivewCount: json['reivewCount'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'fullImage': instance.fullImage,
      'thumbnailImage': instance.thumbnailImage,
      'brand': instance.brand,
      'productName': instance.productName,
      'volume': instance.volume,
      'price': const PriceConverter().toJson(instance.price),
      'ranking': instance.ranking,
      'totalScore': instance.totalScore,
      'reivewCount': instance.reivewCount,
      'createdAt': instance.createdAt.toIso8601String(),
    };
