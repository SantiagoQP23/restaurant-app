import 'package:restaurant_app/features/cart/domain/entities/product.dart';

class OrderDetail {
  final String id;
  final double quantity;
  final double price;
  final double qtyDelivered;
  final double amount;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isActive;
  final Product product;

  OrderDetail({
    required this.id,
    required this.quantity,
    required this.price,
    required this.qtyDelivered,
    required this.amount,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.product,
  });

  bool get isDelivered => qtyDelivered == quantity;
}
