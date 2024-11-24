// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BillModel _$BillModelFromJson(Map<String, dynamic> json) {
  return _BillModel.fromJson(json);
}

/// @nodoc
mixin _$BillModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'num')
  String get number => throw _privateConstructorUsedError;
  String get comments => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  double get receivedAmount => throw _privateConstructorUsedError;
  double get change => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  bool get isPaid => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  List<BillDetailModel> get details => throw _privateConstructorUsedError;

  /// Serializes this BillModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BillModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BillModelCopyWith<BillModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillModelCopyWith<$Res> {
  factory $BillModelCopyWith(BillModel value, $Res Function(BillModel) then) =
      _$BillModelCopyWithImpl<$Res, BillModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'num') String number,
      String comments,
      String paymentMethod,
      double receivedAmount,
      double change,
      double subtotal,
      double total,
      double discount,
      bool isPaid,
      String createdAt,
      String updatedAt,
      bool isActive,
      List<BillDetailModel> details});
}

/// @nodoc
class _$BillModelCopyWithImpl<$Res, $Val extends BillModel>
    implements $BillModelCopyWith<$Res> {
  _$BillModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BillModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? comments = null,
    Object? paymentMethod = null,
    Object? receivedAmount = null,
    Object? change = null,
    Object? subtotal = null,
    Object? total = null,
    Object? discount = null,
    Object? isPaid = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isActive = null,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      receivedAmount: null == receivedAmount
          ? _value.receivedAmount
          : receivedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      change: null == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as double,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      isPaid: null == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<BillDetailModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BillModelImplCopyWith<$Res>
    implements $BillModelCopyWith<$Res> {
  factory _$$BillModelImplCopyWith(
          _$BillModelImpl value, $Res Function(_$BillModelImpl) then) =
      __$$BillModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'num') String number,
      String comments,
      String paymentMethod,
      double receivedAmount,
      double change,
      double subtotal,
      double total,
      double discount,
      bool isPaid,
      String createdAt,
      String updatedAt,
      bool isActive,
      List<BillDetailModel> details});
}

/// @nodoc
class __$$BillModelImplCopyWithImpl<$Res>
    extends _$BillModelCopyWithImpl<$Res, _$BillModelImpl>
    implements _$$BillModelImplCopyWith<$Res> {
  __$$BillModelImplCopyWithImpl(
      _$BillModelImpl _value, $Res Function(_$BillModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BillModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? comments = null,
    Object? paymentMethod = null,
    Object? receivedAmount = null,
    Object? change = null,
    Object? subtotal = null,
    Object? total = null,
    Object? discount = null,
    Object? isPaid = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isActive = null,
    Object? details = null,
  }) {
    return _then(_$BillModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      receivedAmount: null == receivedAmount
          ? _value.receivedAmount
          : receivedAmount // ignore: cast_nullable_to_non_nullable
              as double,
      change: null == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as double,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      isPaid: null == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<BillDetailModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BillModelImpl extends _BillModel {
  const _$BillModelImpl(
      {required this.id,
      @JsonKey(name: 'num') required this.number,
      required this.comments,
      required this.paymentMethod,
      required this.receivedAmount,
      required this.change,
      required this.subtotal,
      required this.total,
      required this.discount,
      required this.isPaid,
      required this.createdAt,
      required this.updatedAt,
      required this.isActive,
      required final List<BillDetailModel> details})
      : _details = details,
        super._();

  factory _$BillModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'num')
  final String number;
  @override
  final String comments;
  @override
  final String paymentMethod;
  @override
  final double receivedAmount;
  @override
  final double change;
  @override
  final double subtotal;
  @override
  final double total;
  @override
  final double discount;
  @override
  final bool isPaid;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final bool isActive;
  final List<BillDetailModel> _details;
  @override
  List<BillDetailModel> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  String toString() {
    return 'BillModel(id: $id, number: $number, comments: $comments, paymentMethod: $paymentMethod, receivedAmount: $receivedAmount, change: $change, subtotal: $subtotal, total: $total, discount: $discount, isPaid: $isPaid, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.receivedAmount, receivedAmount) ||
                other.receivedAmount == receivedAmount) &&
            (identical(other.change, change) || other.change == change) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      number,
      comments,
      paymentMethod,
      receivedAmount,
      change,
      subtotal,
      total,
      discount,
      isPaid,
      createdAt,
      updatedAt,
      isActive,
      const DeepCollectionEquality().hash(_details));

  /// Create a copy of BillModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BillModelImplCopyWith<_$BillModelImpl> get copyWith =>
      __$$BillModelImplCopyWithImpl<_$BillModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BillModelImplToJson(
      this,
    );
  }
}

abstract class _BillModel extends BillModel {
  const factory _BillModel(
      {required final int id,
      @JsonKey(name: 'num') required final String number,
      required final String comments,
      required final String paymentMethod,
      required final double receivedAmount,
      required final double change,
      required final double subtotal,
      required final double total,
      required final double discount,
      required final bool isPaid,
      required final String createdAt,
      required final String updatedAt,
      required final bool isActive,
      required final List<BillDetailModel> details}) = _$BillModelImpl;
  const _BillModel._() : super._();

  factory _BillModel.fromJson(Map<String, dynamic> json) =
      _$BillModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'num')
  String get number;
  @override
  String get comments;
  @override
  String get paymentMethod;
  @override
  double get receivedAmount;
  @override
  double get change;
  @override
  double get subtotal;
  @override
  double get total;
  @override
  double get discount;
  @override
  bool get isPaid;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  bool get isActive;
  @override
  List<BillDetailModel> get details;

  /// Create a copy of BillModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BillModelImplCopyWith<_$BillModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
