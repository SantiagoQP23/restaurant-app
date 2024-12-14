import 'package:restaurant_app/features/auth/domain/entities/user.dart';
import 'package:restaurant_app/features/customers/domain/entities/customer.dart';
import 'package:restaurant_app/features/finances/domain/entities/cash_register.dart';
import 'package:restaurant_app/features/orders/infraestructura/models/dto/update_bill_dto.dart';

import 'bill_detail.dart';

enum PaymentMethod { cash, card, transfer }

class Bill {
  final int id;
  final String number;
  final String comments;
  final PaymentMethod paymentMethod;
  final double receivedAmount;
  final double change;
  final double subtotal;
  final double total;
  final double discount;
  final bool isPaid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isActive;
  final List<BillDetail> details;
  final User? createdBy;
  final User? owner;

  Bill({
    required this.id,
    required this.number,
    required this.comments,
    required this.paymentMethod,
    required this.receivedAmount,
    required this.change,
    required this.subtotal,
    required this.total,
    required this.discount,
    required this.isPaid,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.details,
    required this.createdBy,
    this.owner,
  });

  UpdateBillDTO toUpdateDTO({
    required double receivedAmount,
    required PaymentMethod paymentMethod,
    Customer? customer,
    double? discount,
    CashRegister? cashRegister,
  }) {
    return UpdateBillDTO(
      id: id,
      // paymentMethod: paymentMethod.toString().split('.').last,
      discount: discount,
      receivedAmount: receivedAmount,
      customer: customer,
      paymentMethod: paymentMethod,
      cashRegister: cashRegister
    );
  }
}
