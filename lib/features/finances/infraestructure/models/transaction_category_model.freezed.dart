// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionCategoryModel _$TransactionCategoryModelFromJson(
    Map<String, dynamic> json) {
  return _TransactionCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionCategoryModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get transactionType => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this TransactionCategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionCategoryModelCopyWith<TransactionCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCategoryModelCopyWith<$Res> {
  factory $TransactionCategoryModelCopyWith(TransactionCategoryModel value,
          $Res Function(TransactionCategoryModel) then) =
      _$TransactionCategoryModelCopyWithImpl<$Res, TransactionCategoryModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String transactionType,
      DateTime createdAt,
      DateTime updatedAt,
      String color,
      bool isActive});
}

/// @nodoc
class _$TransactionCategoryModelCopyWithImpl<$Res,
        $Val extends TransactionCategoryModel>
    implements $TransactionCategoryModelCopyWith<$Res> {
  _$TransactionCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? transactionType = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? color = null,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionCategoryModelImplCopyWith<$Res>
    implements $TransactionCategoryModelCopyWith<$Res> {
  factory _$$TransactionCategoryModelImplCopyWith(
          _$TransactionCategoryModelImpl value,
          $Res Function(_$TransactionCategoryModelImpl) then) =
      __$$TransactionCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String transactionType,
      DateTime createdAt,
      DateTime updatedAt,
      String color,
      bool isActive});
}

/// @nodoc
class __$$TransactionCategoryModelImplCopyWithImpl<$Res>
    extends _$TransactionCategoryModelCopyWithImpl<$Res,
        _$TransactionCategoryModelImpl>
    implements _$$TransactionCategoryModelImplCopyWith<$Res> {
  __$$TransactionCategoryModelImplCopyWithImpl(
      _$TransactionCategoryModelImpl _value,
      $Res Function(_$TransactionCategoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? transactionType = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? color = null,
    Object? isActive = null,
  }) {
    return _then(_$TransactionCategoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionCategoryModelImpl extends _TransactionCategoryModel {
  const _$TransactionCategoryModelImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.transactionType,
      required this.createdAt,
      required this.updatedAt,
      required this.color,
      required this.isActive})
      : super._();

  factory _$TransactionCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionCategoryModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String transactionType;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String color;
  @override
  final bool isActive;

  @override
  String toString() {
    return 'TransactionCategoryModel(id: $id, name: $name, description: $description, transactionType: $transactionType, createdAt: $createdAt, updatedAt: $updatedAt, color: $color, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionCategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      transactionType, createdAt, updatedAt, color, isActive);

  /// Create a copy of TransactionCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionCategoryModelImplCopyWith<_$TransactionCategoryModelImpl>
      get copyWith => __$$TransactionCategoryModelImplCopyWithImpl<
          _$TransactionCategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionCategoryModel extends TransactionCategoryModel {
  const factory _TransactionCategoryModel(
      {required final int id,
      required final String name,
      required final String description,
      required final String transactionType,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final String color,
      required final bool isActive}) = _$TransactionCategoryModelImpl;
  const _TransactionCategoryModel._() : super._();

  factory _TransactionCategoryModel.fromJson(Map<String, dynamic> json) =
      _$TransactionCategoryModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get transactionType;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String get color;
  @override
  bool get isActive;

  /// Create a copy of TransactionCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionCategoryModelImplCopyWith<_$TransactionCategoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
