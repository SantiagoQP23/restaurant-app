import 'package:restaurant_app/features/cart/domain/entities/product.dart';

class NewOrderDetail {
  final Product product;
  final int quantity;
  final String note;
  final double price;

  NewOrderDetail({
    required this.product,
    required this.quantity,
    required this.note,
    required this.price,
  });

  NewOrderDetail copyWith({
    Product? product,
    int? quantity,
    String? note,
    double? price,
  }) {
    return NewOrderDetail(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      note: note ?? this.note,
      price: price ?? this.price,
    );
  }

}