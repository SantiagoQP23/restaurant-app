import 'package:restaurant_app/features/auth/domain/entities/user.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';
import 'package:restaurant_app/features/orders/infraestructura/models/update_order_dto.dart';
import 'package:restaurant_app/features/tables/domain/domain.dart';
import 'package:restaurant_app/features/tables/domain/entities/table.dart';

enum OrderStatus { pending, inProgress, delivered, cancelled }

enum OrderType { takeAway, inPlace }


class Order {
  final String id;
  final int number;
  final String notes;
  final DateTime deliveryTime;
  final OrderType type;
  final int people;
  final bool isPaid;
  final bool isClosed;
  final double total;
  final DateTime createdAt;
  final DateTime updatedAt;
  TableEntity? table;
  final User waiter;
  final OrderStatus status;
  final List<OrderDetail> details;
  List<Bill> bills;

  Order({
    required this.id,
    required this.number,
    required this.notes,
    required this.deliveryTime,
    required this.people,
    required this.type,
    required this.isPaid,
    required this.isClosed,
    required this.total,
    required this.createdAt,
    required this.updatedAt,
    this.table,
    required this.waiter,
    required this.status,
    required this.details,
    this.bills = const [],
  });

  Order copyWith({
    String? id,
    int? number,
    String? notes,
    DateTime? deliveryTime,
    OrderType? type,
    int? people,
    bool? isPaid,
    bool? isClosed,
    double? total,
    DateTime? createdAt,
    DateTime? updatedAt,
    TableEntity? table,
    User? waiter,
    OrderStatus? status,
    List<OrderDetail>? details,
    List<Bill>? bills,
  }) {
    return Order(
      id: id ?? this.id,
      number: number ?? this.number,
      notes: notes ?? this.notes,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      type: type ?? this.type,
      people: people ?? this.people,
      isPaid: isPaid ?? this.isPaid,
      isClosed: isClosed ?? this.isClosed,
      total: total ?? this.total,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      table: table ?? this.table,
      waiter: waiter ?? this.waiter,
      status: status ?? this.status,
      details: details ?? this.details,
      bills: bills ?? this.bills,
    );
  }

  UpdateOrderDto toUpdateOrderDto({
    String? tableId,
    String? userId,
    int? people,
    OrderStatus? status,
    OrderType? type,
    double? discount,
    String? notes,
    DateTime? deliveryTime,
    bool? isClosed,
  }) {
    return UpdateOrderDto(
      id: id,
      tableId: tableId ?? table?.id,
      userId: userId ?? waiter.id,
      people: people ?? this.people,
      status: status,
      typeOrder: type ?? this.type,
      notes: notes ?? this.notes,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      isClosed: isClosed ?? this.isClosed,
    );
  }
}
