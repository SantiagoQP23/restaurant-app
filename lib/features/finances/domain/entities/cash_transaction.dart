
import 'package:restaurant_app/features/auth/domain/entities/user.dart';
import 'package:restaurant_app/features/finances/domain/entities/transaction_category.dart';

class CashTransaction {
  final int id;
  final String description;
  final User performedBy;
  final TransactionType type;
  final double amount;
  final User createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final TransactionCategory category;
  final bool isEditable;
  final bool isActive;

  CashTransaction({
    required this.id,
    required this.description,
    required this.performedBy,
    required this.type,
    required this.amount,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
    required this.isEditable,
    required this.isActive,
  });
}

