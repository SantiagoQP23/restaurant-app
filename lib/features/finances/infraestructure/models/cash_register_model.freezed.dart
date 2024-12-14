// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cash_register_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CashRegisterModel _$CashRegisterModelFromJson(Map<String, dynamic> json) {
  return _CashRegisterModel.fromJson(json);
}

/// @nodoc
mixin _$CashRegisterModel {
  int get id => throw _privateConstructorUsedError;
  double get initialAmount => throw _privateConstructorUsedError;
  double get totalIncome => throw _privateConstructorUsedError;
  double get totalExpense => throw _privateConstructorUsedError;
  double get finalAmount => throw _privateConstructorUsedError;
  bool get isClosed => throw _privateConstructorUsedError;
  DateTime? get closedAt => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  UserModel? get closedBy => throw _privateConstructorUsedError;
  UserModel get createdBy => throw _privateConstructorUsedError;
  double get discrepancy => throw _privateConstructorUsedError;
  List<CashTransactionModel> get cashTransactions =>
      throw _privateConstructorUsedError;

  /// Serializes this CashRegisterModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CashRegisterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CashRegisterModelCopyWith<CashRegisterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashRegisterModelCopyWith<$Res> {
  factory $CashRegisterModelCopyWith(
          CashRegisterModel value, $Res Function(CashRegisterModel) then) =
      _$CashRegisterModelCopyWithImpl<$Res, CashRegisterModel>;
  @useResult
  $Res call(
      {int id,
      double initialAmount,
      double totalIncome,
      double totalExpense,
      double finalAmount,
      bool isClosed,
      DateTime? closedAt,
      double balance,
      DateTime createdAt,
      DateTime updatedAt,
      UserModel? closedBy,
      UserModel createdBy,
      double discrepancy,
      List<CashTransactionModel> cashTransactions});

  $UserModelCopyWith<$Res>? get closedBy;
  $UserModelCopyWith<$Res> get createdBy;
}

/// @nodoc
class _$CashRegisterModelCopyWithImpl<$Res, $Val extends CashRegisterModel>
    implements $CashRegisterModelCopyWith<$Res> {
  _$CashRegisterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CashRegisterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? initialAmount = null,
    Object? totalIncome = null,
    Object? totalExpense = null,
    Object? finalAmount = null,
    Object? isClosed = null,
    Object? closedAt = freezed,
    Object? balance = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? closedBy = freezed,
    Object? createdBy = null,
    Object? discrepancy = null,
    Object? cashTransactions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      initialAmount: null == initialAmount
          ? _value.initialAmount
          : initialAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as double,
      finalAmount: null == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      isClosed: null == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
      closedAt: freezed == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      closedBy: freezed == closedBy
          ? _value.closedBy
          : closedBy // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserModel,
      discrepancy: null == discrepancy
          ? _value.discrepancy
          : discrepancy // ignore: cast_nullable_to_non_nullable
              as double,
      cashTransactions: null == cashTransactions
          ? _value.cashTransactions
          : cashTransactions // ignore: cast_nullable_to_non_nullable
              as List<CashTransactionModel>,
    ) as $Val);
  }

  /// Create a copy of CashRegisterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get closedBy {
    if (_value.closedBy == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.closedBy!, (value) {
      return _then(_value.copyWith(closedBy: value) as $Val);
    });
  }

  /// Create a copy of CashRegisterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get createdBy {
    return $UserModelCopyWith<$Res>(_value.createdBy, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CashRegisterModelImplCopyWith<$Res>
    implements $CashRegisterModelCopyWith<$Res> {
  factory _$$CashRegisterModelImplCopyWith(_$CashRegisterModelImpl value,
          $Res Function(_$CashRegisterModelImpl) then) =
      __$$CashRegisterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      double initialAmount,
      double totalIncome,
      double totalExpense,
      double finalAmount,
      bool isClosed,
      DateTime? closedAt,
      double balance,
      DateTime createdAt,
      DateTime updatedAt,
      UserModel? closedBy,
      UserModel createdBy,
      double discrepancy,
      List<CashTransactionModel> cashTransactions});

  @override
  $UserModelCopyWith<$Res>? get closedBy;
  @override
  $UserModelCopyWith<$Res> get createdBy;
}

/// @nodoc
class __$$CashRegisterModelImplCopyWithImpl<$Res>
    extends _$CashRegisterModelCopyWithImpl<$Res, _$CashRegisterModelImpl>
    implements _$$CashRegisterModelImplCopyWith<$Res> {
  __$$CashRegisterModelImplCopyWithImpl(_$CashRegisterModelImpl _value,
      $Res Function(_$CashRegisterModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CashRegisterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? initialAmount = null,
    Object? totalIncome = null,
    Object? totalExpense = null,
    Object? finalAmount = null,
    Object? isClosed = null,
    Object? closedAt = freezed,
    Object? balance = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? closedBy = freezed,
    Object? createdBy = null,
    Object? discrepancy = null,
    Object? cashTransactions = null,
  }) {
    return _then(_$CashRegisterModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      initialAmount: null == initialAmount
          ? _value.initialAmount
          : initialAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as double,
      finalAmount: null == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      isClosed: null == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
      closedAt: freezed == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      closedBy: freezed == closedBy
          ? _value.closedBy
          : closedBy // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserModel,
      discrepancy: null == discrepancy
          ? _value.discrepancy
          : discrepancy // ignore: cast_nullable_to_non_nullable
              as double,
      cashTransactions: null == cashTransactions
          ? _value._cashTransactions
          : cashTransactions // ignore: cast_nullable_to_non_nullable
              as List<CashTransactionModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CashRegisterModelImpl extends _CashRegisterModel {
  const _$CashRegisterModelImpl(
      {required this.id,
      required this.initialAmount,
      required this.totalIncome,
      required this.totalExpense,
      required this.finalAmount,
      required this.isClosed,
      this.closedAt,
      required this.balance,
      required this.createdAt,
      required this.updatedAt,
      required this.closedBy,
      required this.createdBy,
      required this.discrepancy,
      required final List<CashTransactionModel> cashTransactions})
      : _cashTransactions = cashTransactions,
        super._();

  factory _$CashRegisterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CashRegisterModelImplFromJson(json);

  @override
  final int id;
  @override
  final double initialAmount;
  @override
  final double totalIncome;
  @override
  final double totalExpense;
  @override
  final double finalAmount;
  @override
  final bool isClosed;
  @override
  final DateTime? closedAt;
  @override
  final double balance;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final UserModel? closedBy;
  @override
  final UserModel createdBy;
  @override
  final double discrepancy;
  final List<CashTransactionModel> _cashTransactions;
  @override
  List<CashTransactionModel> get cashTransactions {
    if (_cashTransactions is EqualUnmodifiableListView)
      return _cashTransactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cashTransactions);
  }

  @override
  String toString() {
    return 'CashRegisterModel(id: $id, initialAmount: $initialAmount, totalIncome: $totalIncome, totalExpense: $totalExpense, finalAmount: $finalAmount, isClosed: $isClosed, closedAt: $closedAt, balance: $balance, createdAt: $createdAt, updatedAt: $updatedAt, closedBy: $closedBy, createdBy: $createdBy, discrepancy: $discrepancy, cashTransactions: $cashTransactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashRegisterModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.initialAmount, initialAmount) ||
                other.initialAmount == initialAmount) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            (identical(other.finalAmount, finalAmount) ||
                other.finalAmount == finalAmount) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed) &&
            (identical(other.closedAt, closedAt) ||
                other.closedAt == closedAt) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.closedBy, closedBy) ||
                other.closedBy == closedBy) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.discrepancy, discrepancy) ||
                other.discrepancy == discrepancy) &&
            const DeepCollectionEquality()
                .equals(other._cashTransactions, _cashTransactions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      initialAmount,
      totalIncome,
      totalExpense,
      finalAmount,
      isClosed,
      closedAt,
      balance,
      createdAt,
      updatedAt,
      closedBy,
      createdBy,
      discrepancy,
      const DeepCollectionEquality().hash(_cashTransactions));

  /// Create a copy of CashRegisterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashRegisterModelImplCopyWith<_$CashRegisterModelImpl> get copyWith =>
      __$$CashRegisterModelImplCopyWithImpl<_$CashRegisterModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CashRegisterModelImplToJson(
      this,
    );
  }
}

abstract class _CashRegisterModel extends CashRegisterModel {
  const factory _CashRegisterModel(
          {required final int id,
          required final double initialAmount,
          required final double totalIncome,
          required final double totalExpense,
          required final double finalAmount,
          required final bool isClosed,
          final DateTime? closedAt,
          required final double balance,
          required final DateTime createdAt,
          required final DateTime updatedAt,
          required final UserModel? closedBy,
          required final UserModel createdBy,
          required final double discrepancy,
          required final List<CashTransactionModel> cashTransactions}) =
      _$CashRegisterModelImpl;
  const _CashRegisterModel._() : super._();

  factory _CashRegisterModel.fromJson(Map<String, dynamic> json) =
      _$CashRegisterModelImpl.fromJson;

  @override
  int get id;
  @override
  double get initialAmount;
  @override
  double get totalIncome;
  @override
  double get totalExpense;
  @override
  double get finalAmount;
  @override
  bool get isClosed;
  @override
  DateTime? get closedAt;
  @override
  double get balance;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  UserModel? get closedBy;
  @override
  UserModel get createdBy;
  @override
  double get discrepancy;
  @override
  List<CashTransactionModel> get cashTransactions;

  /// Create a copy of CashRegisterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashRegisterModelImplCopyWith<_$CashRegisterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
