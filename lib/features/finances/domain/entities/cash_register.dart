import 'package:restaurant_app/features/auth/domain/entities/user.dart';
import 'package:restaurant_app/features/finances/domain/entities/cash_transaction.dart';

class CashRegister {
  final int id;
  final double initialAmount;
  final double totalIncome;
  final double totalExpense;
  final double finalAmount;
  final bool isClosed;
  final DateTime? closedAt;
  final double balance;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User? closedBy;
  final User createdBy;
  final double discrepancy;
  final List<CashTransaction> cashTransactions;

  CashRegister({
    required this.id,
    required this.initialAmount,
    required this.totalIncome,
    required this.totalExpense,
    required this.finalAmount,
    required this.isClosed,
    required this.closedAt,
    required this.balance,
    required this.createdAt,
    required this.updatedAt,
    required this.closedBy,
    required this.createdBy,
    required this.discrepancy,
    required this.cashTransactions,
  });
}
