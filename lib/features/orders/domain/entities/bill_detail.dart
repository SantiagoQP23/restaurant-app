import 'package:restaurant_app/features/cart/domain/entities/product.dart';

import 'order_detail.dart';
class BillDetail {
  final String id;
  final int quantity;
  final double price;
  final double total;
  final DateTime createdAt;
  final DateTime updatedAt;
  final OrderDetail orderDetail;

  BillDetail({
    required this.id,
    required this.quantity,
    required this.price,
    required this.total,
    required this.createdAt,
    required this.updatedAt,
    required this.orderDetail,
  });
}
