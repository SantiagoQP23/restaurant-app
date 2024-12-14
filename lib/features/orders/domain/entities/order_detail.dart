import 'package:restaurant_app/features/cart/domain/entities/product.dart';
import 'package:restaurant_app/features/orders/infraestructura/models/update_order_detail_dto.dart';

class OrderDetail {
  final String id;
  final double quantity;
  final double price;
  final double qtyDelivered;
  final double qtyPaid;
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
    required this.qtyPaid,
    required this.amount,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.product,
  });

  bool get isDelivered => qtyDelivered == quantity;

  OrderDetail copyWith({
    double? quantity,
    double? price,
    double? qtyDelivered,
    double? qtyPaid,
    double? amount,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isActive,
    Product? product,
  }) {
    return OrderDetail(
      id: id,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      qtyDelivered: qtyDelivered ?? this.qtyDelivered,
      qtyPaid: qtyPaid ?? this.qtyPaid,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isActive: isActive ?? this.isActive,
      product: product ?? this.product,
    );
  }

  UpdateOrderDetailDto toUpdateOrderDto(
      {required String orderId,
      double? quantity,
      double? price,
      double? qtyDelivered,
      String? description}) {
    return UpdateOrderDetailDto(
      id: id,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      qtyDelivered: qtyDelivered ?? this.qtyDelivered,
      description: description ?? this.description,
      orderId: orderId,
    );
  }
}


