import 'package:restaurant_app/features/auth/infraestructure/models/user_model.dart';
import 'package:restaurant_app/features/finances/domain/entities/cash_transaction.dart';
import 'package:restaurant_app/features/finances/domain/entities/transaction_category.dart';
import 'package:restaurant_app/features/finances/infraestructure/models/transaction_category_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cash_transaction_model.freezed.dart';
part 'cash_transaction_model.g.dart';

@freezed
class CashTransactionModel with _$CashTransactionModel {
  const CashTransactionModel._();
  const factory CashTransactionModel({
    required int id,
    required String description,
    required UserModel performedBy,
    required String type,
    required double amount,
    required UserModel createdBy,
    required DateTime createdAt,
    required DateTime updatedAt,
    required TransactionCategoryModel category,
    required bool isEditable,
    required bool isActive,
  }) = _CashTransactionModel;

  factory CashTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$CashTransactionModelFromJson(json);

  CashTransaction toEntity() => CashTransaction(
        id: id,
        description: description,
        performedBy: performedBy.toEntity(),
        type: type == 'INCOME'
            ? TransactionType.income
            : TransactionType.expense,
        amount: amount,
        createdBy: createdBy.toEntity(),
        createdAt: createdAt,
        updatedAt: updatedAt,
        category: category.toEntity(),
        isEditable: isEditable,
        isActive: isActive,
      );
}