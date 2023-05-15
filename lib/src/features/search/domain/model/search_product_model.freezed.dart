// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchProductModel _$SearchProductModelFromJson(Map<String, dynamic> json) {
  return _SearchProductModel.fromJson(json);
}

/// @nodoc
mixin _$SearchProductModel {
  String get id => throw _privateConstructorUsedError; // 카테고리
  String get category => throw _privateConstructorUsedError; // 제품 사진
  @ImageUrlConverter()
  String get thumbnailImage => throw _privateConstructorUsedError; // 브랜드 명
  String get brand => throw _privateConstructorUsedError; // 제품 이름
  String get productName => throw _privateConstructorUsedError; // 제품 용량
  String get volume => throw _privateConstructorUsedError; // 가격
  @PriceConverter()
  String get price => throw _privateConstructorUsedError; // 제품 등록 시간
  @TimeStampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchProductModelCopyWith<SearchProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchProductModelCopyWith<$Res> {
  factory $SearchProductModelCopyWith(
          SearchProductModel value, $Res Function(SearchProductModel) then) =
      _$SearchProductModelCopyWithImpl<$Res, SearchProductModel>;
  @useResult
  $Res call(
      {String id,
      String category,
      @ImageUrlConverter() String thumbnailImage,
      String brand,
      String productName,
      String volume,
      @PriceConverter() String price,
      @TimeStampConverter() Timestamp createdAt});
}

/// @nodoc
class _$SearchProductModelCopyWithImpl<$Res, $Val extends SearchProductModel>
    implements $SearchProductModelCopyWith<$Res> {
  _$SearchProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? thumbnailImage = null,
    Object? brand = null,
    Object? productName = null,
    Object? volume = null,
    Object? price = null,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchProductModelCopyWith<$Res>
    implements $SearchProductModelCopyWith<$Res> {
  factory _$$_SearchProductModelCopyWith(_$_SearchProductModel value,
          $Res Function(_$_SearchProductModel) then) =
      __$$_SearchProductModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String category,
      @ImageUrlConverter() String thumbnailImage,
      String brand,
      String productName,
      String volume,
      @PriceConverter() String price,
      @TimeStampConverter() Timestamp createdAt});
}

/// @nodoc
class __$$_SearchProductModelCopyWithImpl<$Res>
    extends _$SearchProductModelCopyWithImpl<$Res, _$_SearchProductModel>
    implements _$$_SearchProductModelCopyWith<$Res> {
  __$$_SearchProductModelCopyWithImpl(
      _$_SearchProductModel _value, $Res Function(_$_SearchProductModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? thumbnailImage = null,
    Object? brand = null,
    Object? productName = null,
    Object? volume = null,
    Object? price = null,
    Object? createdAt = null,
  }) {
    return _then(_$_SearchProductModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchProductModel implements _SearchProductModel {
  const _$_SearchProductModel(
      {this.id = '',
      required this.category,
      @ImageUrlConverter() required this.thumbnailImage,
      required this.brand,
      required this.productName,
      required this.volume,
      @PriceConverter() required this.price,
      @TimeStampConverter() required this.createdAt});

  factory _$_SearchProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_SearchProductModelFromJson(json);

  @override
  @JsonKey()
  final String id;
// 카테고리
  @override
  final String category;
// 제품 사진
  @override
  @ImageUrlConverter()
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
// 제품 등록 시간
  @override
  @TimeStampConverter()
  final Timestamp createdAt;

  @override
  String toString() {
    return 'SearchProductModel(id: $id, category: $category, thumbnailImage: $thumbnailImage, brand: $brand, productName: $productName, volume: $volume, price: $price, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.thumbnailImage, thumbnailImage) ||
                other.thumbnailImage == thumbnailImage) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, category, thumbnailImage,
      brand, productName, volume, price, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchProductModelCopyWith<_$_SearchProductModel> get copyWith =>
      __$$_SearchProductModelCopyWithImpl<_$_SearchProductModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchProductModelToJson(
      this,
    );
  }
}

abstract class _SearchProductModel implements SearchProductModel {
  const factory _SearchProductModel(
          {final String id,
          required final String category,
          @ImageUrlConverter() required final String thumbnailImage,
          required final String brand,
          required final String productName,
          required final String volume,
          @PriceConverter() required final String price,
          @TimeStampConverter() required final Timestamp createdAt}) =
      _$_SearchProductModel;

  factory _SearchProductModel.fromJson(Map<String, dynamic> json) =
      _$_SearchProductModel.fromJson;

  @override
  String get id;
  @override // 카테고리
  String get category;
  @override // 제품 사진
  @ImageUrlConverter()
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
  @override // 제품 등록 시간
  @TimeStampConverter()
  Timestamp get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_SearchProductModelCopyWith<_$_SearchProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
