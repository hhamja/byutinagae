// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DetailProductModel _$DetailProductModelFromJson(Map<String, dynamic> json) {
  return _DetailProductModel.fromJson(json);
}

/// @nodoc
mixin _$DetailProductModel {
  String get id => throw _privateConstructorUsedError; // 제품 사진
  @ImageUrlConverter()
  String get fullImage => throw _privateConstructorUsedError; // 브랜드 명
  String get brand => throw _privateConstructorUsedError; // 제품 이름
  String get productName => throw _privateConstructorUsedError; // 제품 용량
  String get volume => throw _privateConstructorUsedError; // 성분 리스트
  List<String> get ingredient => throw _privateConstructorUsedError; // 가격
  @PriceConverter()
  String get price => throw _privateConstructorUsedError; // 제품 등록 시간
  @TimeStampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailProductModelCopyWith<DetailProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailProductModelCopyWith<$Res> {
  factory $DetailProductModelCopyWith(
          DetailProductModel value, $Res Function(DetailProductModel) then) =
      _$DetailProductModelCopyWithImpl<$Res, DetailProductModel>;
  @useResult
  $Res call(
      {String id,
      @ImageUrlConverter() String fullImage,
      String brand,
      String productName,
      String volume,
      List<String> ingredient,
      @PriceConverter() String price,
      @TimeStampConverter() Timestamp createdAt});
}

/// @nodoc
class _$DetailProductModelCopyWithImpl<$Res, $Val extends DetailProductModel>
    implements $DetailProductModelCopyWith<$Res> {
  _$DetailProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullImage = null,
    Object? brand = null,
    Object? productName = null,
    Object? volume = null,
    Object? ingredient = null,
    Object? price = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      ingredient: null == ingredient
          ? _value.ingredient
          : ingredient // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
abstract class _$$_DetailProductModelCopyWith<$Res>
    implements $DetailProductModelCopyWith<$Res> {
  factory _$$_DetailProductModelCopyWith(_$_DetailProductModel value,
          $Res Function(_$_DetailProductModel) then) =
      __$$_DetailProductModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @ImageUrlConverter() String fullImage,
      String brand,
      String productName,
      String volume,
      List<String> ingredient,
      @PriceConverter() String price,
      @TimeStampConverter() Timestamp createdAt});
}

/// @nodoc
class __$$_DetailProductModelCopyWithImpl<$Res>
    extends _$DetailProductModelCopyWithImpl<$Res, _$_DetailProductModel>
    implements _$$_DetailProductModelCopyWith<$Res> {
  __$$_DetailProductModelCopyWithImpl(
      _$_DetailProductModel _value, $Res Function(_$_DetailProductModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullImage = null,
    Object? brand = null,
    Object? productName = null,
    Object? volume = null,
    Object? ingredient = null,
    Object? price = null,
    Object? createdAt = null,
  }) {
    return _then(_$_DetailProductModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      ingredient: null == ingredient
          ? _value._ingredient
          : ingredient // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
class _$_DetailProductModel implements _DetailProductModel {
  const _$_DetailProductModel(
      {this.id = '',
      @ImageUrlConverter() required this.fullImage,
      required this.brand,
      required this.productName,
      required this.volume,
      required final List<String> ingredient,
      @PriceConverter() required this.price,
      @TimeStampConverter() required this.createdAt})
      : _ingredient = ingredient;

  factory _$_DetailProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_DetailProductModelFromJson(json);

  @override
  @JsonKey()
  final String id;
// 제품 사진
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
// 성분 리스트
  final List<String> _ingredient;
// 성분 리스트
  @override
  List<String> get ingredient {
    if (_ingredient is EqualUnmodifiableListView) return _ingredient;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredient);
  }

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
    return 'DetailProductModel(id: $id, fullImage: $fullImage, brand: $brand, productName: $productName, volume: $volume, ingredient: $ingredient, price: $price, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullImage, fullImage) ||
                other.fullImage == fullImage) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            const DeepCollectionEquality()
                .equals(other._ingredient, _ingredient) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fullImage,
      brand,
      productName,
      volume,
      const DeepCollectionEquality().hash(_ingredient),
      price,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailProductModelCopyWith<_$_DetailProductModel> get copyWith =>
      __$$_DetailProductModelCopyWithImpl<_$_DetailProductModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetailProductModelToJson(
      this,
    );
  }
}

abstract class _DetailProductModel implements DetailProductModel {
  const factory _DetailProductModel(
          {final String id,
          @ImageUrlConverter() required final String fullImage,
          required final String brand,
          required final String productName,
          required final String volume,
          required final List<String> ingredient,
          @PriceConverter() required final String price,
          @TimeStampConverter() required final Timestamp createdAt}) =
      _$_DetailProductModel;

  factory _DetailProductModel.fromJson(Map<String, dynamic> json) =
      _$_DetailProductModel.fromJson;

  @override
  String get id;
  @override // 제품 사진
  @ImageUrlConverter()
  String get fullImage;
  @override // 브랜드 명
  String get brand;
  @override // 제품 이름
  String get productName;
  @override // 제품 용량
  String get volume;
  @override // 성분 리스트
  List<String> get ingredient;
  @override // 가격
  @PriceConverter()
  String get price;
  @override // 제품 등록 시간
  @TimeStampConverter()
  Timestamp get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_DetailProductModelCopyWith<_$_DetailProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
