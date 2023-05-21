import 'package:byutinagae/src/common/json_converter/json_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_product_model.freezed.dart';
part 'search_product_model.g.dart';

@freezed
class SearchProductModel with _$SearchProductModel {
  const factory SearchProductModel({
    // Default 이유 : DB에 id가 없어서 파이어스토어 document ID를 넣기 위함
    // 따라서 데이터를 받을 떄 copyWith로 받은 문서 id를 업데이트
    @Default('') String id,
    // 카테고리
    required String category,
    // 썸네일 이미지 url
    @ImageUrlConverter() required String thumbnailImage,
    // 풀 사이즈 이미지 url
    @ImageUrlConverter() required String fullImage,
    // 브랜드 명
    required String brand,
    // 제품 이름
    required String productName,
    // 제품 용량
    required String volume,
    // 가격
    @PriceConverter() required String price,
    // 제품 등록 시간
    // @TimeStampConverter() required Timestamp createdAt,

    // 평점 점수의 총합
    // 나중에 총 수/ 리뷰 수 = 평균 평점 구현
    // required int totalScore,
    // required int reivewCount,
  }) = _SearchProductModel;

  factory SearchProductModel.fromJson(Map<String, dynamic> json) =>
      _$SearchProductModelFromJson(json);
}
