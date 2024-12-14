import 'package:restaurant_app/features/orders/domain/entities/entities.dart';

class CreateBillDetail {
  final OrderDetail detail;
  final double quantity;

  CreateBillDetail({required this.detail, required this.quantity});

  double get total => detail.price * quantity.toDouble();

  CreateBillDetail copyWith({
    OrderDetail? detail,
    double? quantity,
  }) {
    return CreateBillDetail(
      detail: detail ?? this.detail,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderDetailId': detail.id,
      'quantity': quantity,
    };
  }
}
