import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

// 가격 단위에 맞춰서 변환
class PriceConverter implements JsonConverter<String, int> {
  const PriceConverter();

  @override
  String fromJson(int price) {
    try {
      // 23000 -> "23,000원"
      final formattedPrice = NumberFormat('#,###원').format(price).toString();
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

// 이미지 url 추출
class ImageUrlConverter implements JsonConverter<String, List> {
  const ImageUrlConverter();

  @override
  String fromJson(List imageList) {
    try {
      final String thumbnailUrl = imageList[0]['downloadURL'];
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

// TimeStamp 타입 정의
class TimeStampConverter implements JsonConverter<Timestamp, dynamic> {
  const TimeStampConverter();

  @override
  Timestamp fromJson(dynamic json) {
    if (json is int) {
      // 검색해서 데이터를 넣을 때
      // 알골리에서는 타임스탬프 타입이 int로 저장되기 떄문
      return Timestamp.fromMillisecondsSinceEpoch(json);
    } else {
      // 파이어스토어에서 값을 받는 경우
      return json as Timestamp;
    }
  }

  @override
  dynamic toJson(Timestamp timestamp) => timestamp;
}

// 문서 id를 추출하여 id 속성 값에 넣기
class DocumentIdConverter
    implements JsonConverter<String, DocumentSnapshot<Object>> {
  const DocumentIdConverter();

  // 문서의 id 값을 추출
  @override
  String fromJson(DocumentSnapshot documentSnapshot) => documentSnapshot.id;

  @override
  DocumentSnapshot<Object> toJson(String id) {
    throw 'UnimplementedError()';
  }
}
