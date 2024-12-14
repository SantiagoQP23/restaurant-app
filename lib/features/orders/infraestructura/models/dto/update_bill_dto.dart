import 'package:restaurant_app/features/customers/domain/entities/customer.dart';
import 'package:restaurant_app/features/finances/domain/entities/cash_register.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';

class UpdateBillDTO {
  final int id;
  final String? orderId;
  final PaymentMethod paymentMethod;
  final double? discount;
  final CashRegister? cashRegister;
  final Customer? customer;
  final double receivedAmount;

  UpdateBillDTO({
    required this.id,
    this.orderId,
    required this.paymentMethod,
    this.discount,
    this.cashRegister,
    this.customer,
    required this.receivedAmount,
  });

  UpdateBillDTO copyWith({
    int? id,
    String? orderId,
    PaymentMethod? paymentMethod,
    double? discount,
  }) {
    return UpdateBillDTO(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      discount: discount ?? this.discount,
      receivedAmount: receivedAmount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderId': orderId,
      'paymentMethod': paymentMethod == PaymentMethod.cash
          ? 'CASH'
          : paymentMethod == PaymentMethod.transfer
              ? 'TRANSFER'
              : 'transfer',
      'discount': discount,
      'change': 0,
      'cashRegisterId': cashRegister?.id,
      'clientId': customer?.id ?? '0999999999',
      'receivedAmount': receivedAmount,
      'isPaid': true,
    };
  }
}
