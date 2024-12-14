class UpdateOrderDetailDto {
  String id;
  double quantity;
  double price;
  double qtyDelivered;
  String description;
  String orderId;

  UpdateOrderDetailDto({
    required this.id,
    required this.quantity,
    required this.price,
    required this.qtyDelivered,
    required this.description,
    required this.orderId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
      'price': price,
      'qtyDelivered': qtyDelivered,
      'description': description,
      'orderId': orderId,
    };
  }

}