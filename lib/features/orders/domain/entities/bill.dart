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
  });
}
