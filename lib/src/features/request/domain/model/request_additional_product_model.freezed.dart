// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_additional_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestAdditionalProductModel _$RequestAdditionalProductModelFromJson(
    Map<String, dynamic> json) {
  return _RequestAdditionalProductModel.fromJson(json);
}

/// @nodoc
mixin _$RequestAdditionalProductModel {
// 요청 보낸 uid
  String get uid => throw _privateConstructorUsedError; // 입력 내용 ex) 닥터맘마 샴푸
  String get content => throw _privateConstructorUsedError; // 제품 추가 요청 시간
  @TimeStampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestAdditionalProductModelCopyWith<RequestAdditionalProductModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestAdditionalProductModelCopyWith<$Res> {
  factory $RequestAdditionalProductModelCopyWith(
          RequestAdditionalProductModel value,
          $Res Function(RequestAdditionalProductModel) then) =
      _$RequestAdditionalProductModelCopyWithImpl<$Res,
          RequestAdditionalProductModel>;
  @useResult
  $Res call(
      {String uid, String content, @TimeStampConverter() Timestamp createdAt});
}

/// @nodoc
class _$RequestAdditionalProductModelCopyWithImpl<$Res,
        $Val extends RequestAdditionalProductModel>
    implements $RequestAdditionalProductModelCopyWith<$Res> {
  _$RequestAdditionalProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? content = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RequestAdditionalProductModelCopyWith<$Res>
    implements $RequestAdditionalProductModelCopyWith<$Res> {
  factory _$$_RequestAdditionalProductModelCopyWith(
          _$_RequestAdditionalProductModel value,
          $Res Function(_$_RequestAdditionalProductModel) then) =
      __$$_RequestAdditionalProductModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid, String content, @TimeStampConverter() Timestamp createdAt});
}

/// @nodoc
class __$$_RequestAdditionalProductModelCopyWithImpl<$Res>
    extends _$RequestAdditionalProductModelCopyWithImpl<$Res,
        _$_RequestAdditionalProductModel>
    implements _$$_RequestAdditionalProductModelCopyWith<$Res> {
  __$$_RequestAdditionalProductModelCopyWithImpl(
      _$_RequestAdditionalProductModel _value,
      $Res Function(_$_RequestAdditionalProductModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? content = null,
    Object? createdAt = null,
  }) {
    return _then(_$_RequestAdditionalProductModel(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
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
class _$_RequestAdditionalProductModel
    implements _RequestAdditionalProductModel {
  const _$_RequestAdditionalProductModel(
      {required this.uid,
      required this.content,
      @TimeStampConverter() required this.createdAt});

  factory _$_RequestAdditionalProductModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_RequestAdditionalProductModelFromJson(json);

// 요청 보낸 uid
  @override
  final String uid;
// 입력 내용 ex) 닥터맘마 샴푸
  @override
  final String content;
// 제품 추가 요청 시간
  @override
  @TimeStampConverter()
  final Timestamp createdAt;

  @override
  String toString() {
    return 'RequestAdditionalProductModel(uid: $uid, content: $content, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequestAdditionalProductModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, content, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RequestAdditionalProductModelCopyWith<_$_RequestAdditionalProductModel>
      get copyWith => __$$_RequestAdditionalProductModelCopyWithImpl<
          _$_RequestAdditionalProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RequestAdditionalProductModelToJson(
      this,
    );
  }
}

abstract class _RequestAdditionalProductModel
    implements RequestAdditionalProductModel {
  const factory _RequestAdditionalProductModel(
          {required final String uid,
          required final String content,
          @TimeStampConverter() required final Timestamp createdAt}) =
      _$_RequestAdditionalProductModel;

  factory _RequestAdditionalProductModel.fromJson(Map<String, dynamic> json) =
      _$_RequestAdditionalProductModel.fromJson;

  @override // 요청 보낸 uid
  String get uid;
  @override // 입력 내용 ex) 닥터맘마 샴푸
  String get content;
  @override // 제품 추가 요청 시간
  @TimeStampConverter()
  Timestamp get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_RequestAdditionalProductModelCopyWith<_$_RequestAdditionalProductModel>
      get copyWith => throw _privateConstructorUsedError;
}
