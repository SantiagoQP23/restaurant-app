import 'package:restaurant_app/features/orders/domain/entities/entities.dart';

Map<OrderStatus, String> orderStatusMap = {
  OrderStatus.pending: 'PENDING',
  OrderStatus.inProgress: 'IN_PROGRESS',
  OrderStatus.delivered: 'DELIVERED',
  OrderStatus.cancelled: 'CANCELLED',
};

class UpdateOrderDto {
  final String id;
  final String? tableId;
  final String? userId;
  final int? people;
  final OrderStatus? status;
  final OrderType? typeOrder;
  final String? notes;
  final DateTime? deliveryTime;
  final bool? isClosed;

  UpdateOrderDto({
    required this.id,
    this.tableId,
    this.userId,
    this.people,
    this.status,
    this.typeOrder,
    this.notes,
    this.deliveryTime,
    this.isClosed,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tableId': tableId,
      'userId': userId,
      'people': people,
      'status': orderStatusMap[status],
      'typeOrder':  typeOrder == OrderType.inPlace ? "IN_PLACE" : "TAKE_AWAY",
      'notes': notes,
      'deliveryTime': deliveryTime?.toIso8601String(),
      'isClosed': isClosed,
    };
  }

}
