// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_modification_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IngredientModificationRequestModel _$IngredientModificationRequestModelFromJson(
    Map<String, dynamic> json) {
  return _IngredientModificationRequestModel.fromJson(json);
}

/// @nodoc
mixin _$IngredientModificationRequestModel {
// 요청 보낸 uid
  String get uid => throw _privateConstructorUsedError; // 브랜드
  String get brand => throw _privateConstructorUsedError; // 제품 이름
  String get productName => throw _privateConstructorUsedError; // 유저가 입력한 성분정보
  String get ingredient => throw _privateConstructorUsedError; // 성분 수정 요청 시간
  @TimeStampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientModificationRequestModelCopyWith<
          IngredientModificationRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientModificationRequestModelCopyWith<$Res> {
  factory $IngredientModificationRequestModelCopyWith(
          IngredientModificationRequestModel value,
          $Res Function(IngredientModificationRequestModel) then) =
      _$IngredientModificationRequestModelCopyWithImpl<$Res,
          IngredientModificationRequestModel>;
  @useResult
  $Res call(
      {String uid,
      String brand,
      String productName,
      String ingredient,
      @TimeStampConverter() Timestamp createdAt});
}

/// @nodoc
class _$IngredientModificationRequestModelCopyWithImpl<$Res,
        $Val extends IngredientModificationRequestModel>
    implements $IngredientModificationRequestModelCopyWith<$Res> {
  _$IngredientModificationRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? brand = null,
    Object? productName = null,
    Object? ingredient = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      ingredient: null == ingredient
          ? _value.ingredient
          : ingredient // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IngredientModificationRequestModelCopyWith<$Res>
    implements $IngredientModificationRequestModelCopyWith<$Res> {
  factory _$$_IngredientModificationRequestModelCopyWith(
          _$_IngredientModificationRequestModel value,
          $Res Function(_$_IngredientModificationRequestModel) then) =
      __$$_IngredientModificationRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String brand,
      String productName,
      String ingredient,
      @TimeStampConverter() Timestamp createdAt});
}

/// @nodoc
class __$$_IngredientModificationRequestModelCopyWithImpl<$Res>
    extends _$IngredientModificationRequestModelCopyWithImpl<$Res,
        _$_IngredientModificationRequestModel>
    implements _$$_IngredientModificationRequestModelCopyWith<$Res> {
  __$$_IngredientModificationRequestModelCopyWithImpl(
      _$_IngredientModificationRequestModel _value,
      $Res Function(_$_IngredientModificationRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? brand = null,
    Object? productName = null,
    Object? ingredient = null,
    Object? createdAt = null,
  }) {
    return _then(_$_IngredientModificationRequestModel(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      ingredient: null == ingredient
          ? _value.ingredient
          : ingredient // ignore: cast_nullable_to_non_nullable
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
class _$_IngredientModificationRequestModel
    implements _IngredientModificationRequestModel {
  const _$_IngredientModificationRequestModel(
      {required this.uid,
      required this.brand,
      required this.productName,
      required this.ingredient,
      @TimeStampConverter() required this.createdAt});

  factory _$_IngredientModificationRequestModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_IngredientModificationRequestModelFromJson(json);

// 요청 보낸 uid
  @override
  final String uid;
// 브랜드
  @override
  final String brand;
// 제품 이름
  @override
  final String productName;
// 유저가 입력한 성분정보
  @override
  final String ingredient;
// 성분 수정 요청 시간
  @override
  @TimeStampConverter()
  final Timestamp createdAt;

  @override
  String toString() {
    return 'IngredientModificationRequestModel(uid: $uid, brand: $brand, productName: $productName, ingredient: $ingredient, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IngredientModificationRequestModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.ingredient, ingredient) ||
                other.ingredient == ingredient) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, brand, productName, ingredient, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IngredientModificationRequestModelCopyWith<
          _$_IngredientModificationRequestModel>
      get copyWith => __$$_IngredientModificationRequestModelCopyWithImpl<
          _$_IngredientModificationRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IngredientModificationRequestModelToJson(
      this,
    );
  }
}

abstract class _IngredientModificationRequestModel
    implements IngredientModificationRequestModel {
  const factory _IngredientModificationRequestModel(
          {required final String uid,
          required final String brand,
          required final String productName,
          required final String ingredient,
          @TimeStampConverter() required final Timestamp createdAt}) =
      _$_IngredientModificationRequestModel;

  factory _IngredientModificationRequestModel.fromJson(
          Map<String, dynamic> json) =
      _$_IngredientModificationRequestModel.fromJson;

  @override // 요청 보낸 uid
  String get uid;
  @override // 브랜드
  String get brand;
  @override // 제품 이름
  String get productName;
  @override // 유저가 입력한 성분정보
  String get ingredient;
  @override // 성분 수정 요청 시간
  @TimeStampConverter()
  Timestamp get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_IngredientModificationRequestModelCopyWith<
          _$_IngredientModificationRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}
