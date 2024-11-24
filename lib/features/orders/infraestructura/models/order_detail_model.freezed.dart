// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderDetailModel _$OrderDetailModelFromJson(Map<String, dynamic> json) {
  return _OrderDetailModel.fromJson(json);
}

/// @nodoc
mixin _$OrderDetailModel {
  String get id => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get qtyDelivered => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  ProductModel get product => throw _privateConstructorUsedError;

  /// Serializes this OrderDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderDetailModelCopyWith<OrderDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailModelCopyWith<$Res> {
  factory $OrderDetailModelCopyWith(
          OrderDetailModel value, $Res Function(OrderDetailModel) then) =
      _$OrderDetailModelCopyWithImpl<$Res, OrderDetailModel>;
  @useResult
  $Res call(
      {String id,
      double quantity,
      double price,
      double qtyDelivered,
      double amount,
      String description,
      String createdAt,
      String updatedAt,
      bool isActive,
      ProductModel product});

  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class _$OrderDetailModelCopyWithImpl<$Res, $Val extends OrderDetailModel>
    implements $OrderDetailModelCopyWith<$Res> {
  _$OrderDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? price = null,
    Object? qtyDelivered = null,
    Object? amount = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isActive = null,
    Object? product = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      qtyDelivered: null == qtyDelivered
          ? _value.qtyDelivered
          : qtyDelivered // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
    ) as $Val);
  }

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res> get product {
    return $ProductModelCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderDetailModelImplCopyWith<$Res>
    implements $OrderDetailModelCopyWith<$Res> {
  factory _$$OrderDetailModelImplCopyWith(_$OrderDetailModelImpl value,
          $Res Function(_$OrderDetailModelImpl) then) =
      __$$OrderDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double quantity,
      double price,
      double qtyDelivered,
      double amount,
      String description,
      String createdAt,
      String updatedAt,
      bool isActive,
      ProductModel product});

  @override
  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class __$$OrderDetailModelImplCopyWithImpl<$Res>
    extends _$OrderDetailModelCopyWithImpl<$Res, _$OrderDetailModelImpl>
    implements _$$OrderDetailModelImplCopyWith<$Res> {
  __$$OrderDetailModelImplCopyWithImpl(_$OrderDetailModelImpl _value,
      $Res Function(_$OrderDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? price = null,
    Object? qtyDelivered = null,
    Object? amount = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isActive = null,
    Object? product = null,
  }) {
    return _then(_$OrderDetailModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      qtyDelivered: null == qtyDelivered
          ? _value.qtyDelivered
          : qtyDelivered // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderDetailModelImpl extends _OrderDetailModel {
  _$OrderDetailModelImpl(
      {required this.id,
      required this.quantity,
      required this.price,
      required this.qtyDelivered,
      required this.amount,
      required this.description,
      required this.createdAt,
      required this.updatedAt,
      required this.isActive,
      required this.product})
      : super._();

  factory _$OrderDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDetailModelImplFromJson(json);

  @override
  final String id;
  @override
  final double quantity;
  @override
  final double price;
  @override
  final double qtyDelivered;
  @override
  final double amount;
  @override
  final String description;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final bool isActive;
  @override
  final ProductModel product;

  @override
  String toString() {
    return 'OrderDetailModel(id: $id, quantity: $quantity, price: $price, qtyDelivered: $qtyDelivered, amount: $amount, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.qtyDelivered, qtyDelivered) ||
                other.qtyDelivered == qtyDelivered) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      quantity,
      price,
      qtyDelivered,
      amount,
      description,
      createdAt,
      updatedAt,
      isActive,
      product);

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailModelImplCopyWith<_$OrderDetailModelImpl> get copyWith =>
      __$$OrderDetailModelImplCopyWithImpl<_$OrderDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDetailModelImplToJson(
      this,
    );
  }
}

abstract class _OrderDetailModel extends OrderDetailModel {
  factory _OrderDetailModel(
      {required final String id,
      required final double quantity,
      required final double price,
      required final double qtyDelivered,
      required final double amount,
      required final String description,
      required final String createdAt,
      required final String updatedAt,
      required final bool isActive,
      required final ProductModel product}) = _$OrderDetailModelImpl;
  _OrderDetailModel._() : super._();

  factory _OrderDetailModel.fromJson(Map<String, dynamic> json) =
      _$OrderDetailModelImpl.fromJson;

  @override
  String get id;
  @override
  double get quantity;
  @override
  double get price;
  @override
  double get qtyDelivered;
  @override
  double get amount;
  @override
  String get description;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  bool get isActive;
  @override
  ProductModel get product;

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderDetailModelImplCopyWith<_$OrderDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
