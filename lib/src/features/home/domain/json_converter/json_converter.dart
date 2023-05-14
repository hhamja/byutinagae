// int타입 가격을 화폐 타입의 String으로 변환
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

// 역할 : 가격 단위에 맞춰서 변환
class PriceConverter implements JsonConverter<String, int> {
  const PriceConverter();

  @override
  String fromJson(int price) {
    try {
      // 23000 -> "23,000원"
      final formattedPrice = NumberFormat('#,###원').format(price).toString();
      debugPrint(formattedPrice);
      return formattedPrice;
    } catch (e) {
      throw const FormatException();
    }
  }

  @override
  int toJson(String object) {
    throw 'UnimplementedError()';
  }
}

// 역할 :  이미지 url 추출
class ImageUrlConverter implements JsonConverter<String, List> {
  const ImageUrlConverter();

  @override
  String fromJson(List imageList) {
    try {
      final String thumbnailUrl = imageList[0]['downloadURL'];
      debugPrint(thumbnailUrl);
      return thumbnailUrl;
    } catch (e) {
      throw const FormatException();
    }
  }

  @override
  List toJson(String object) {
    throw 'UnimplementedError()';
  }
}

// 역할 :  TimeStamp 타입 정의
class TimeStampConverter implements JsonConverter<Timestamp, dynamic> {
  const TimeStampConverter();

  @override
  Timestamp fromJson(dynamic json) => json as Timestamp;

  @override
  dynamic toJson(Timestamp timestamp) => timestamp;
}
