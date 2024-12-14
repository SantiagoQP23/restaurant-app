
enum TransactionType { income, expense }

class TransactionCategory {
  final int id;
  final String name;
  final String description;
  final TransactionType transactionType;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String color;
  final bool isActive;

  TransactionCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.transactionType,
    required this.createdAt,
    required this.updatedAt,
    required this.color,
    required this.isActive,
  });
}

