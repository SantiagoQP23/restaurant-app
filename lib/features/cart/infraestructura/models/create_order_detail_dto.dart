class CreateOrderDetailDto {
  final String productId;
  final int quantity;
  String description;
  double? price;
  num? productOptionId;

  CreateOrderDetailDto({
    required this.productId,
    required this.quantity,
    required this.description,
    required this.price,
    this.productOptionId,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'description': description,
      'price': price,
      'productOptionId': productOptionId,
    };
  }
}