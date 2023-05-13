// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  String get id => throw _privateConstructorUsedError; // 카테고리
  String get category => throw _privateConstructorUsedError; // 풀사이즈 사진
  String get fullImage => throw _privateConstructorUsedError; // 썸네일 사진
  String get thumbnailImage => throw _privateConstructorUsedError; // 브랜드 명
  String get brand => throw _privateConstructorUsedError; // 제품 이름
  String get productName => throw _privateConstructorUsedError; // 제품 용량
  String get volume => throw _privateConstructorUsedError; // 가격
  @PriceConverter()
  String get price => throw _privateConstructorUsedError; // 랭킹
  int get ranking => throw _privateConstructorUsedError; // 평점 점수의 총합
// 나중에 총 수/ 리뷰 수 = 평균 평점 구현
  int get totalScore => throw _privateConstructorUsedError;
  int get reivewCount => throw _privateConstructorUsedError; // 제품 등록 시간
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {String id,
      String category,
      String fullImage,
      String thumbnailImage,
      String brand,
      String productName,
      String volume,
      @PriceConverter() String price,
      int ranking,
      int totalScore,
      int reivewCount,
      DateTime createdAt});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? fullImage = null,
    Object? thumbnailImage = null,
    Object? brand = null,
    Object? productName = null,
    Object? volume = null,
    Object? price = null,
    Object? ranking = null,
    Object? totalScore = null,
    Object? reivewCount = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      fullImage: null == fullImage
          ? _value.fullImage
          : fullImage // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImage: null == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      ranking: null == ranking
          ? _value.ranking
          : ranking // ignore: cast_nullable_to_non_nullable
              as int,
      totalScore: null == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int,
      reivewCount: null == reivewCount
          ? _value.reivewCount
          : reivewCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$_ProductModelCopyWith(
          _$_ProductModel value, $Res Function(_$_ProductModel) then) =
      __$$_ProductModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String category,
      String fullImage,
      String thumbnailImage,
      String brand,
      String productName,
      String volume,
      @PriceConverter() String price,
      int ranking,
      int totalScore,
      int reivewCount,
      DateTime createdAt});
}

/// @nodoc
class __$$_ProductModelCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$_ProductModel>
    implements _$$_ProductModelCopyWith<$Res> {
  __$$_ProductModelCopyWithImpl(
      _$_ProductModel _value, $Res Function(_$_ProductModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? fullImage = null,
    Object? thumbnailImage = null,
    Object? brand = null,
    Object? productName = null,
    Object? volume = null,
    Object? price = null,
    Object? ranking = null,
    Object? totalScore = null,
    Object? reivewCount = null,
    Object? createdAt = null,
  }) {
    return _then(_$_ProductModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      fullImage: null == fullImage
          ? _value.fullImage
          : fullImage // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImage: null == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      ranking: null == ranking
          ? _value.ranking
          : ranking // ignore: cast_nullable_to_non_nullable
              as int,
      totalScore: null == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int,
      reivewCount: null == reivewCount
          ? _value.reivewCount
          : reivewCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductModel implements _ProductModel {
  const _$_ProductModel(
      {required this.id,
      required this.category,
      required this.fullImage,
      required this.thumbnailImage,
      required this.brand,
      required this.productName,
      required this.volume,
      @PriceConverter() required this.price,
      required this.ranking,
      required this.totalScore,
      required this.reivewCount,
      required this.createdAt});

  factory _$_ProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductModelFromJson(json);

  @override
  final String id;
// 카테고리
  @override
  final String category;
// 풀사이즈 사진
  @override
  final String fullImage;
// 썸네일 사진
  @override
  final String thumbnailImage;
// 브랜드 명
  @override
  final String brand;
// 제품 이름
  @override
  final String productName;
// 제품 용량
  @override
  final String volume;
// 가격
  @override
  @PriceConverter()
  final String price;
// 랭킹
  @override
  final int ranking;
// 평점 점수의 총합
// 나중에 총 수/ 리뷰 수 = 평균 평점 구현
  @override
  final int totalScore;
  @override
  final int reivewCount;
// 제품 등록 시간
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'ProductModel(id: $id, category: $category, fullImage: $fullImage, thumbnailImage: $thumbnailImage, brand: $brand, productName: $productName, volume: $volume, price: $price, ranking: $ranking, totalScore: $totalScore, reivewCount: $reivewCount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.fullImage, fullImage) ||
                other.fullImage == fullImage) &&
            (identical(other.thumbnailImage, thumbnailImage) ||
                other.thumbnailImage == thumbnailImage) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.ranking, ranking) || other.ranking == ranking) &&
            (identical(other.totalScore, totalScore) ||
                other.totalScore == totalScore) &&
            (identical(other.reivewCount, reivewCount) ||
                other.reivewCount == reivewCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      fullImage,
      thumbnailImage,
      brand,
      productName,
      volume,
      price,
      ranking,
      totalScore,
      reivewCount,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      __$$_ProductModelCopyWithImpl<_$_ProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductModelToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel(
      {required final String id,
      required final String category,
      required final String fullImage,
      required final String thumbnailImage,
      required final String brand,
      required final String productName,
      required final String volume,
      @PriceConverter() required final String price,
      required final int ranking,
      required final int totalScore,
      required final int reivewCount,
      required final DateTime createdAt}) = _$_ProductModel;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$_ProductModel.fromJson;

  @override
  String get id;
  @override // 카테고리
  String get category;
  @override // 풀사이즈 사진
  String get fullImage;
  @override // 썸네일 사진
  String get thumbnailImage;
  @override // 브랜드 명
  String get brand;
  @override // 제품 이름
  String get productName;
  @override // 제품 용량
  String get volume;
  @override // 가격
  @PriceConverter()
  String get price;
  @override // 랭킹
  int get ranking;
  @override // 평점 점수의 총합
// 나중에 총 수/ 리뷰 수 = 평균 평점 구현
  int get totalScore;
  @override
  int get reivewCount;
  @override // 제품 등록 시간
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
