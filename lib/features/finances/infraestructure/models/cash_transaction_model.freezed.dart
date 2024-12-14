// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cash_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CashTransactionModel _$CashTransactionModelFromJson(Map<String, dynamic> json) {
  return _CashTransactionModel.fromJson(json);
}

/// @nodoc
mixin _$CashTransactionModel {
  int get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  UserModel get performedBy => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  UserModel get createdBy => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  TransactionCategoryModel get category => throw _privateConstructorUsedError;
  bool get isEditable => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this CashTransactionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CashTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CashTransactionModelCopyWith<CashTransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashTransactionModelCopyWith<$Res> {
  factory $CashTransactionModelCopyWith(CashTransactionModel value,
          $Res Function(CashTransactionModel) then) =
      _$CashTransactionModelCopyWithImpl<$Res, CashTransactionModel>;
  @useResult
  $Res call(
      {int id,
      String description,
      UserModel performedBy,
      String type,
      double amount,
      UserModel createdBy,
      DateTime createdAt,
      DateTime updatedAt,
      TransactionCategoryModel category,
      bool isEditable,
      bool isActive});

  $UserModelCopyWith<$Res> get performedBy;
  $UserModelCopyWith<$Res> get createdBy;
  $TransactionCategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class _$CashTransactionModelCopyWithImpl<$Res,
        $Val extends CashTransactionModel>
    implements $CashTransactionModelCopyWith<$Res> {
  _$CashTransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CashTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? performedBy = null,
    Object? type = null,
    Object? amount = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? category = null,
    Object? isEditable = null,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      performedBy: null == performedBy
          ? _value.performedBy
          : performedBy // ignore: cast_nullable_to_non_nullable
              as UserModel,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserModel,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TransactionCategoryModel,
      isEditable: null == isEditable
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of CashTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get performedBy {
    return $UserModelCopyWith<$Res>(_value.performedBy, (value) {
      return _then(_value.copyWith(performedBy: value) as $Val);
    });
  }

  /// Create a copy of CashTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get createdBy {
    return $UserModelCopyWith<$Res>(_value.createdBy, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }

  /// Create a copy of CashTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionCategoryModelCopyWith<$Res> get category {
    return $TransactionCategoryModelCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CashTransactionModelImplCopyWith<$Res>
    implements $CashTransactionModelCopyWith<$Res> {
  factory _$$CashTransactionModelImplCopyWith(_$CashTransactionModelImpl value,
          $Res Function(_$CashTransactionModelImpl) then) =
      __$$CashTransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String description,
      UserModel performedBy,
      String type,
      double amount,
      UserModel createdBy,
      DateTime createdAt,
      DateTime updatedAt,
      TransactionCategoryModel category,
      bool isEditable,
      bool isActive});

  @override
  $UserModelCopyWith<$Res> get performedBy;
  @override
  $UserModelCopyWith<$Res> get createdBy;
  @override
  $TransactionCategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class __$$CashTransactionModelImplCopyWithImpl<$Res>
    extends _$CashTransactionModelCopyWithImpl<$Res, _$CashTransactionModelImpl>
    implements _$$CashTransactionModelImplCopyWith<$Res> {
  __$$CashTransactionModelImplCopyWithImpl(_$CashTransactionModelImpl _value,
      $Res Function(_$CashTransactionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CashTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? performedBy = null,
    Object? type = null,
    Object? amount = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? category = null,
    Object? isEditable = null,
    Object? isActive = null,
  }) {
    return _then(_$CashTransactionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      performedBy: null == performedBy
          ? _value.performedBy
          : performedBy // ignore: cast_nullable_to_non_nullable
              as UserModel,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserModel,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TransactionCategoryModel,
      isEditable: null == isEditable
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CashTransactionModelImpl extends _CashTransactionModel {
  const _$CashTransactionModelImpl(
      {required this.id,
      required this.description,
      required this.performedBy,
      required this.type,
      required this.amount,
      required this.createdBy,
      required this.createdAt,
      required this.updatedAt,
      required this.category,
      required this.isEditable,
      required this.isActive})
      : super._();

  factory _$CashTransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CashTransactionModelImplFromJson(json);

  @override
  final int id;
  @override
  final String description;
  @override
  final UserModel performedBy;
  @override
  final String type;
  @override
  final double amount;
  @override
  final UserModel createdBy;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final TransactionCategoryModel category;
  @override
  final bool isEditable;
  @override
  final bool isActive;

  @override
  String toString() {
    return 'CashTransactionModel(id: $id, description: $description, performedBy: $performedBy, type: $type, amount: $amount, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, category: $category, isEditable: $isEditable, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashTransactionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.performedBy, performedBy) ||
                other.performedBy == performedBy) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isEditable, isEditable) ||
                other.isEditable == isEditable) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      description,
      performedBy,
      type,
      amount,
      createdBy,
      createdAt,
      updatedAt,
      category,
      isEditable,
      isActive);

  /// Create a copy of CashTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashTransactionModelImplCopyWith<_$CashTransactionModelImpl>
      get copyWith =>
          __$$CashTransactionModelImplCopyWithImpl<_$CashTransactionModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CashTransactionModelImplToJson(
      this,
    );
  }
}

abstract class _CashTransactionModel extends CashTransactionModel {
  const factory _CashTransactionModel(
      {required final int id,
      required final String description,
      required final UserModel performedBy,
      required final String type,
      required final double amount,
      required final UserModel createdBy,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final TransactionCategoryModel category,
      required final bool isEditable,
      required final bool isActive}) = _$CashTransactionModelImpl;
  const _CashTransactionModel._() : super._();

  factory _CashTransactionModel.fromJson(Map<String, dynamic> json) =
      _$CashTransactionModelImpl.fromJson;

  @override
  int get id;
  @override
  String get description;
  @override
  UserModel get performedBy;
  @override
  String get type;
  @override
  double get amount;
  @override
  UserModel get createdBy;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  TransactionCategoryModel get category;
  @override
  bool get isEditable;
  @override
  bool get isActive;

  /// Create a copy of CashTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashTransactionModelImplCopyWith<_$CashTransactionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
