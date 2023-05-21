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
  return _ProductListModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
// Default 이유 : DB에 id가 없어서 파이어스토어 document ID를 넣기 위함
// 따라서 데이터를 받을 떄 copyWith로 받은 문서 id를 업데이트
  @DocumentIdConverter()
  String get id => throw _privateConstructorUsedError; // 카테고리
  String get category => throw _privateConstructorUsedError; // 썸네일 이미지 url
  @ImageUrlConverter()
  String get thumbnailImage =>
      throw _privateConstructorUsedError; // 풀 사이즈 이미지 url
  @ImageUrlConverter()
  String get fullImage => throw _privateConstructorUsedError; // 브랜드 명
  String get brand => throw _privateConstructorUsedError; // 제품 이름
  String get productName => throw _privateConstructorUsedError; // 제품 용량
  String get volume => throw _privateConstructorUsedError; // 가격
  @PriceConverter()
  String get price => throw _privateConstructorUsedError; // 제품 등록 시간
  @TimeStampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;

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
      {@DocumentIdConverter() String id,
      String category,
      @ImageUrlConverter() String thumbnailImage,
      @ImageUrlConverter() String fullImage,
      String brand,
      String productName,
      String volume,
      @PriceConverter() String price,
      @TimeStampConverter() Timestamp createdAt});
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
    Object? thumbnailImage = null,
    Object? fullImage = null,
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
      fullImage: null == fullImage
          ? _value.fullImage
          : fullImage // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_ProductListModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$_ProductListModelCopyWith(
          _$_ProductListModel value, $Res Function(_$_ProductListModel) then) =
      __$$_ProductListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@DocumentIdConverter() String id,
      String category,
      @ImageUrlConverter() String thumbnailImage,
      @ImageUrlConverter() String fullImage,
      String brand,
      String productName,
      String volume,
      @PriceConverter() String price,
      @TimeStampConverter() Timestamp createdAt});
}

/// @nodoc
class __$$_ProductListModelCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$_ProductListModel>
    implements _$$_ProductListModelCopyWith<$Res> {
  __$$_ProductListModelCopyWithImpl(
      _$_ProductListModel _value, $Res Function(_$_ProductListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? thumbnailImage = null,
    Object? fullImage = null,
    Object? brand = null,
    Object? productName = null,
    Object? volume = null,
    Object? price = null,
    Object? createdAt = null,
  }) {
    return _then(_$_ProductListModel(
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
      fullImage: null == fullImage
          ? _value.fullImage
          : fullImage // ignore: cast_nullable_to_non_nullable
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
class _$_ProductListModel implements _ProductListModel {
  const _$_ProductListModel(
      {@DocumentIdConverter() this.id = '',
      required this.category,
      @ImageUrlConverter() required this.thumbnailImage,
      @ImageUrlConverter() required this.fullImage,
      required this.brand,
      required this.productName,
      required this.volume,
      @PriceConverter() required this.price,
      @TimeStampConverter() required this.createdAt});

  factory _$_ProductListModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductListModelFromJson(json);

// Default 이유 : DB에 id가 없어서 파이어스토어 document ID를 넣기 위함
// 따라서 데이터를 받을 떄 copyWith로 받은 문서 id를 업데이트
  @override
  @JsonKey()
  @DocumentIdConverter()
  final String id;
// 카테고리
  @override
  final String category;
// 썸네일 이미지 url
  @override
  @ImageUrlConverter()
  final String thumbnailImage;
// 풀 사이즈 이미지 url
  @override
  @ImageUrlConverter()
  final String fullImage;
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
    return 'ProductModel(id: $id, category: $category, thumbnailImage: $thumbnailImage, fullImage: $fullImage, brand: $brand, productName: $productName, volume: $volume, price: $price, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductListModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.thumbnailImage, thumbnailImage) ||
                other.thumbnailImage == thumbnailImage) &&
            (identical(other.fullImage, fullImage) ||
                other.fullImage == fullImage) &&
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
      fullImage, brand, productName, volume, price, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductListModelCopyWith<_$_ProductListModel> get copyWith =>
      __$$_ProductListModelCopyWithImpl<_$_ProductListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductListModelToJson(
      this,
    );
  }
}

abstract class _ProductListModel implements ProductModel {
  const factory _ProductListModel(
          {@DocumentIdConverter() final String id,
          required final String category,
          @ImageUrlConverter() required final String thumbnailImage,
          @ImageUrlConverter() required final String fullImage,
          required final String brand,
          required final String productName,
          required final String volume,
          @PriceConverter() required final String price,
          @TimeStampConverter() required final Timestamp createdAt}) =
      _$_ProductListModel;

  factory _ProductListModel.fromJson(Map<String, dynamic> json) =
      _$_ProductListModel.fromJson;

  @override // Default 이유 : DB에 id가 없어서 파이어스토어 document ID를 넣기 위함
// 따라서 데이터를 받을 떄 copyWith로 받은 문서 id를 업데이트
  @DocumentIdConverter()
  String get id;
  @override // 카테고리
  String get category;
  @override // 썸네일 이미지 url
  @ImageUrlConverter()
  String get thumbnailImage;
  @override // 풀 사이즈 이미지 url
  @ImageUrlConverter()
  String get fullImage;
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
  _$$_ProductListModelCopyWith<_$_ProductListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
