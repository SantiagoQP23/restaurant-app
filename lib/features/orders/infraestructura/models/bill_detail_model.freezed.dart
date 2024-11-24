// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BillDetailModel _$BillDetailModelFromJson(Map<String, dynamic> json) {
  return _BillDetailModel.fromJson(json);
}

/// @nodoc
mixin _$BillDetailModel {
  int get id => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  OrderDetailModel get orderDetail => throw _privateConstructorUsedError;

  /// Serializes this BillDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BillDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BillDetailModelCopyWith<BillDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillDetailModelCopyWith<$Res> {
  factory $BillDetailModelCopyWith(
          BillDetailModel value, $Res Function(BillDetailModel) then) =
      _$BillDetailModelCopyWithImpl<$Res, BillDetailModel>;
  @useResult
  $Res call(
      {int id,
      int quantity,
      double price,
      double total,
      String createdAt,
      String updatedAt,
      OrderDetailModel orderDetail});

  $OrderDetailModelCopyWith<$Res> get orderDetail;
}

/// @nodoc
class _$BillDetailModelCopyWithImpl<$Res, $Val extends BillDetailModel>
    implements $BillDetailModelCopyWith<$Res> {
  _$BillDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BillDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? price = null,
    Object? total = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? orderDetail = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      orderDetail: null == orderDetail
          ? _value.orderDetail
          : orderDetail // ignore: cast_nullable_to_non_nullable
              as OrderDetailModel,
    ) as $Val);
  }

  /// Create a copy of BillDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderDetailModelCopyWith<$Res> get orderDetail {
    return $OrderDetailModelCopyWith<$Res>(_value.orderDetail, (value) {
      return _then(_value.copyWith(orderDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BillDetailModelImplCopyWith<$Res>
    implements $BillDetailModelCopyWith<$Res> {
  factory _$$BillDetailModelImplCopyWith(_$BillDetailModelImpl value,
          $Res Function(_$BillDetailModelImpl) then) =
      __$$BillDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int quantity,
      double price,
      double total,
      String createdAt,
      String updatedAt,
      OrderDetailModel orderDetail});

  @override
  $OrderDetailModelCopyWith<$Res> get orderDetail;
}

/// @nodoc
class __$$BillDetailModelImplCopyWithImpl<$Res>
    extends _$BillDetailModelCopyWithImpl<$Res, _$BillDetailModelImpl>
    implements _$$BillDetailModelImplCopyWith<$Res> {
  __$$BillDetailModelImplCopyWithImpl(
      _$BillDetailModelImpl _value, $Res Function(_$BillDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BillDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? price = null,
    Object? total = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? orderDetail = null,
  }) {
    return _then(_$BillDetailModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      orderDetail: null == orderDetail
          ? _value.orderDetail
          : orderDetail // ignore: cast_nullable_to_non_nullable
              as OrderDetailModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BillDetailModelImpl extends _BillDetailModel {
  const _$BillDetailModelImpl(
      {required this.id,
      required this.quantity,
      required this.price,
      required this.total,
      required this.createdAt,
      required this.updatedAt,
      required this.orderDetail})
      : super._();

  factory _$BillDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillDetailModelImplFromJson(json);

  @override
  final int id;
  @override
  final int quantity;
  @override
  final double price;
  @override
  final double total;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final OrderDetailModel orderDetail;

  @override
  String toString() {
    return 'BillDetailModel(id: $id, quantity: $quantity, price: $price, total: $total, createdAt: $createdAt, updatedAt: $updatedAt, orderDetail: $orderDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.orderDetail, orderDetail) ||
                other.orderDetail == orderDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, quantity, price, total,
      createdAt, updatedAt, orderDetail);

  /// Create a copy of BillDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BillDetailModelImplCopyWith<_$BillDetailModelImpl> get copyWith =>
      __$$BillDetailModelImplCopyWithImpl<_$BillDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BillDetailModelImplToJson(
      this,
    );
  }
}

abstract class _BillDetailModel extends BillDetailModel {
  const factory _BillDetailModel(
      {required final int id,
      required final int quantity,
      required final double price,
      required final double total,
      required final String createdAt,
      required final String updatedAt,
      required final OrderDetailModel orderDetail}) = _$BillDetailModelImpl;
  const _BillDetailModel._() : super._();

  factory _BillDetailModel.fromJson(Map<String, dynamic> json) =
      _$BillDetailModelImpl.fromJson;

  @override
  int get id;
  @override
  int get quantity;
  @override
  double get price;
  @override
  double get total;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  OrderDetailModel get orderDetail;

  /// Create a copy of BillDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BillDetailModelImplCopyWith<_$BillDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
