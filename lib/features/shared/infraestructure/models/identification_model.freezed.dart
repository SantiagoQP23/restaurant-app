// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'identification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IdentificationModel _$IdentificationModelFromJson(Map<String, dynamic> json) {
  return _IdentificationModel.fromJson(json);
}

/// @nodoc
mixin _$IdentificationModel {
  @JsonKey(name: 'num')
  String get number => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  /// Serializes this IdentificationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IdentificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IdentificationModelCopyWith<IdentificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentificationModelCopyWith<$Res> {
  factory $IdentificationModelCopyWith(
          IdentificationModel value, $Res Function(IdentificationModel) then) =
      _$IdentificationModelCopyWithImpl<$Res, IdentificationModel>;
  @useResult
  $Res call({@JsonKey(name: 'num') String number, String type});
}

/// @nodoc
class _$IdentificationModelCopyWithImpl<$Res, $Val extends IdentificationModel>
    implements $IdentificationModelCopyWith<$Res> {
  _$IdentificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IdentificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdentificationModelImplCopyWith<$Res>
    implements $IdentificationModelCopyWith<$Res> {
  factory _$$IdentificationModelImplCopyWith(_$IdentificationModelImpl value,
          $Res Function(_$IdentificationModelImpl) then) =
      __$$IdentificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'num') String number, String type});
}

/// @nodoc
class __$$IdentificationModelImplCopyWithImpl<$Res>
    extends _$IdentificationModelCopyWithImpl<$Res, _$IdentificationModelImpl>
    implements _$$IdentificationModelImplCopyWith<$Res> {
  __$$IdentificationModelImplCopyWithImpl(_$IdentificationModelImpl _value,
      $Res Function(_$IdentificationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of IdentificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? type = null,
  }) {
    return _then(_$IdentificationModelImpl(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdentificationModelImpl extends _IdentificationModel {
  const _$IdentificationModelImpl(
      {@JsonKey(name: 'num') required this.number, required this.type})
      : super._();

  factory _$IdentificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdentificationModelImplFromJson(json);

  @override
  @JsonKey(name: 'num')
  final String number;
  @override
  final String type;

  @override
  String toString() {
    return 'IdentificationModel(number: $number, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdentificationModelImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, number, type);

  /// Create a copy of IdentificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IdentificationModelImplCopyWith<_$IdentificationModelImpl> get copyWith =>
      __$$IdentificationModelImplCopyWithImpl<_$IdentificationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdentificationModelImplToJson(
      this,
    );
  }
}

abstract class _IdentificationModel extends IdentificationModel {
  const factory _IdentificationModel(
      {@JsonKey(name: 'num') required final String number,
      required final String type}) = _$IdentificationModelImpl;
  const _IdentificationModel._() : super._();

  factory _IdentificationModel.fromJson(Map<String, dynamic> json) =
      _$IdentificationModelImpl.fromJson;

  @override
  @JsonKey(name: 'num')
  String get number;
  @override
  String get type;

  /// Create a copy of IdentificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IdentificationModelImplCopyWith<_$IdentificationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
