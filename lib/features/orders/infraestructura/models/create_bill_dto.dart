import 'package:restaurant_app/features/orders/domain/entities/create_bill_detail.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';

Map<PaymentMethod, String> paymentMethodToString = {
  PaymentMethod.cash: "CASH",
  PaymentMethod.card: "CREDIT_CARD",
};

class CreateBillDTO{
  final String orderId;
  PaymentMethod? paymentMethod;
  double? receivedAmount;
  double? discount;
  final List<CreateBillDetail> details;

  CreateBillDTO({
    required this.orderId,
    this.paymentMethod,
    this.receivedAmount,
    this.discount,
    required this.details,
  });

  CreateBillDTO copyWith({
    String? orderId,
    PaymentMethod? paymentMethod,
    double? receivedAmount,
    double? discount,
    List<CreateBillDetail>? details,
  }) {
    return CreateBillDTO(
      orderId: orderId ?? this.orderId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      receivedAmount: receivedAmount ?? this.receivedAmount,
      discount: discount ?? this.discount,
      details: details ?? this.details,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'paymentMethod': paymentMethodToString[paymentMethod],
      'receivedAmount': receivedAmount,
      'discount': discount,
      'details': details.map((e) => e.toJson()).toList(),
    };
  }



}