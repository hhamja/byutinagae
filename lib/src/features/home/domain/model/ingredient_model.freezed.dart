// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IngredientModel _$IngredientModelFromJson(Map<String, dynamic> json) {
  return _IngredientModel.fromJson(json);
}

/// @nodoc
mixin _$IngredientModel {
  int get id => throw _privateConstructorUsedError; // 한글 성분 명
  String get korName => throw _privateConstructorUsedError; // 배합 목적
  String get blendingPurpose => throw _privateConstructorUsedError; // EWG 등급
  String get ewg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientModelCopyWith<IngredientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientModelCopyWith<$Res> {
  factory $IngredientModelCopyWith(
          IngredientModel value, $Res Function(IngredientModel) then) =
      _$IngredientModelCopyWithImpl<$Res, IngredientModel>;
  @useResult
  $Res call({int id, String korName, String blendingPurpose, String ewg});
}

/// @nodoc
class _$IngredientModelCopyWithImpl<$Res, $Val extends IngredientModel>
    implements $IngredientModelCopyWith<$Res> {
  _$IngredientModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? korName = null,
    Object? blendingPurpose = null,
    Object? ewg = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      korName: null == korName
          ? _value.korName
          : korName // ignore: cast_nullable_to_non_nullable
              as String,
      blendingPurpose: null == blendingPurpose
          ? _value.blendingPurpose
          : blendingPurpose // ignore: cast_nullable_to_non_nullable
              as String,
      ewg: null == ewg
          ? _value.ewg
          : ewg // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IngredientModelCopyWith<$Res>
    implements $IngredientModelCopyWith<$Res> {
  factory _$$_IngredientModelCopyWith(
          _$_IngredientModel value, $Res Function(_$_IngredientModel) then) =
      __$$_IngredientModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String korName, String blendingPurpose, String ewg});
}

/// @nodoc
class __$$_IngredientModelCopyWithImpl<$Res>
    extends _$IngredientModelCopyWithImpl<$Res, _$_IngredientModel>
    implements _$$_IngredientModelCopyWith<$Res> {
  __$$_IngredientModelCopyWithImpl(
      _$_IngredientModel _value, $Res Function(_$_IngredientModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? korName = null,
    Object? blendingPurpose = null,
    Object? ewg = null,
  }) {
    return _then(_$_IngredientModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      korName: null == korName
          ? _value.korName
          : korName // ignore: cast_nullable_to_non_nullable
              as String,
      blendingPurpose: null == blendingPurpose
          ? _value.blendingPurpose
          : blendingPurpose // ignore: cast_nullable_to_non_nullable
              as String,
      ewg: null == ewg
          ? _value.ewg
          : ewg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IngredientModel implements _IngredientModel {
  const _$_IngredientModel(
      {required this.id,
      required this.korName,
      required this.blendingPurpose,
      required this.ewg});

  factory _$_IngredientModel.fromJson(Map<String, dynamic> json) =>
      _$$_IngredientModelFromJson(json);

  @override
  final int id;
// 한글 성분 명
  @override
  final String korName;
// 배합 목적
  @override
  final String blendingPurpose;
// EWG 등급
  @override
  final String ewg;

  @override
  String toString() {
    return 'IngredientModel(id: $id, korName: $korName, blendingPurpose: $blendingPurpose, ewg: $ewg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IngredientModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.korName, korName) || other.korName == korName) &&
            (identical(other.blendingPurpose, blendingPurpose) ||
                other.blendingPurpose == blendingPurpose) &&
            (identical(other.ewg, ewg) || other.ewg == ewg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, korName, blendingPurpose, ewg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IngredientModelCopyWith<_$_IngredientModel> get copyWith =>
      __$$_IngredientModelCopyWithImpl<_$_IngredientModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IngredientModelToJson(
      this,
    );
  }
}

abstract class _IngredientModel implements IngredientModel {
  const factory _IngredientModel(
      {required final int id,
      required final String korName,
      required final String blendingPurpose,
      required final String ewg}) = _$_IngredientModel;

  factory _IngredientModel.fromJson(Map<String, dynamic> json) =
      _$_IngredientModel.fromJson;

  @override
  int get id;
  @override // 한글 성분 명
  String get korName;
  @override // 배합 목적
  String get blendingPurpose;
  @override // EWG 등급
  String get ewg;
  @override
  @JsonKey(ignore: true)
  _$$_IngredientModelCopyWith<_$_IngredientModel> get copyWith =>
      throw _privateConstructorUsedError;
}
