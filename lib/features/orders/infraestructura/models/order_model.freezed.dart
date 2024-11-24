// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'num')
  int get number => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  String get deliveryTime => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get isPaid => throw _privateConstructorUsedError;
  bool get isClosed => throw _privateConstructorUsedError;
  int get people => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  TableModel? get table => throw _privateConstructorUsedError;
  UserModel get user => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<OrderDetailModel> get details => throw _privateConstructorUsedError;
  List<BillModel>? get bills => throw _privateConstructorUsedError;

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'num') int number,
      String notes,
      String deliveryTime,
      String type,
      bool isPaid,
      bool isClosed,
      int people,
      double total,
      String createdAt,
      String updatedAt,
      TableModel? table,
      UserModel user,
      String status,
      List<OrderDetailModel> details,
      List<BillModel>? bills});

  $TableModelCopyWith<$Res>? get table;
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? notes = null,
    Object? deliveryTime = null,
    Object? type = null,
    Object? isPaid = null,
    Object? isClosed = null,
    Object? people = null,
    Object? total = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? table = freezed,
    Object? user = null,
    Object? status = null,
    Object? details = null,
    Object? bills = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryTime: null == deliveryTime
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isPaid: null == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      isClosed: null == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
      people: null == people
          ? _value.people
          : people // ignore: cast_nullable_to_non_nullable
              as int,
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
      table: freezed == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as TableModel?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<OrderDetailModel>,
      bills: freezed == bills
          ? _value.bills
          : bills // ignore: cast_nullable_to_non_nullable
              as List<BillModel>?,
    ) as $Val);
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TableModelCopyWith<$Res>? get table {
    if (_value.table == null) {
      return null;
    }

    return $TableModelCopyWith<$Res>(_value.table!, (value) {
      return _then(_value.copyWith(table: value) as $Val);
    });
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
          _$OrderModelImpl value, $Res Function(_$OrderModelImpl) then) =
      __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'num') int number,
      String notes,
      String deliveryTime,
      String type,
      bool isPaid,
      bool isClosed,
      int people,
      double total,
      String createdAt,
      String updatedAt,
      TableModel? table,
      UserModel user,
      String status,
      List<OrderDetailModel> details,
      List<BillModel>? bills});

  @override
  $TableModelCopyWith<$Res>? get table;
  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? notes = null,
    Object? deliveryTime = null,
    Object? type = null,
    Object? isPaid = null,
    Object? isClosed = null,
    Object? people = null,
    Object? total = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? table = freezed,
    Object? user = null,
    Object? status = null,
    Object? details = null,
    Object? bills = freezed,
  }) {
    return _then(_$OrderModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryTime: null == deliveryTime
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isPaid: null == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      isClosed: null == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
      people: null == people
          ? _value.people
          : people // ignore: cast_nullable_to_non_nullable
              as int,
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
      table: freezed == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as TableModel?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<OrderDetailModel>,
      bills: freezed == bills
          ? _value._bills
          : bills // ignore: cast_nullable_to_non_nullable
              as List<BillModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl extends _OrderModel {
  const _$OrderModelImpl(
      {required this.id,
      @JsonKey(name: 'num') required this.number,
      required this.notes,
      required this.deliveryTime,
      required this.type,
      required this.isPaid,
      required this.isClosed,
      required this.people,
      required this.total,
      required this.createdAt,
      required this.updatedAt,
      this.table = null,
      required this.user,
      required this.status,
      required final List<OrderDetailModel> details,
      final List<BillModel>? bills = const []})
      : _details = details,
        _bills = bills,
        super._();

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'num')
  final int number;
  @override
  final String notes;
  @override
  final String deliveryTime;
  @override
  final String type;
  @override
  final bool isPaid;
  @override
  final bool isClosed;
  @override
  final int people;
  @override
  final double total;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  @JsonKey()
  final TableModel? table;
  @override
  final UserModel user;
  @override
  final String status;
  final List<OrderDetailModel> _details;
  @override
  List<OrderDetailModel> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  final List<BillModel>? _bills;
  @override
  @JsonKey()
  List<BillModel>? get bills {
    final value = _bills;
    if (value == null) return null;
    if (_bills is EqualUnmodifiableListView) return _bills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OrderModel(id: $id, number: $number, notes: $notes, deliveryTime: $deliveryTime, type: $type, isPaid: $isPaid, isClosed: $isClosed, people: $people, total: $total, createdAt: $createdAt, updatedAt: $updatedAt, table: $table, user: $user, status: $status, details: $details, bills: $bills)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.deliveryTime, deliveryTime) ||
                other.deliveryTime == deliveryTime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed) &&
            (identical(other.people, people) || other.people == people) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            const DeepCollectionEquality().equals(other._bills, _bills));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      number,
      notes,
      deliveryTime,
      type,
      isPaid,
      isClosed,
      people,
      total,
      createdAt,
      updatedAt,
      table,
      user,
      status,
      const DeepCollectionEquality().hash(_details),
      const DeepCollectionEquality().hash(_bills));

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(
      this,
    );
  }
}

abstract class _OrderModel extends OrderModel {
  const factory _OrderModel(
      {required final String id,
      @JsonKey(name: 'num') required final int number,
      required final String notes,
      required final String deliveryTime,
      required final String type,
      required final bool isPaid,
      required final bool isClosed,
      required final int people,
      required final double total,
      required final String createdAt,
      required final String updatedAt,
      final TableModel? table,
      required final UserModel user,
      required final String status,
      required final List<OrderDetailModel> details,
      final List<BillModel>? bills}) = _$OrderModelImpl;
  const _OrderModel._() : super._();

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'num')
  int get number;
  @override
  String get notes;
  @override
  String get deliveryTime;
  @override
  String get type;
  @override
  bool get isPaid;
  @override
  bool get isClosed;
  @override
  int get people;
  @override
  double get total;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  TableModel? get table;
  @override
  UserModel get user;
  @override
  String get status;
  @override
  List<OrderDetailModel> get details;
  @override
  List<BillModel>? get bills;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
