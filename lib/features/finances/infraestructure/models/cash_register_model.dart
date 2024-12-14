import 'package:restaurant_app/features/auth/infraestructure/models/user_model.dart';
import 'package:restaurant_app/features/finances/domain/entities/cash_register.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_app/features/finances/infraestructure/models/cash_transaction_model.dart';


part 'cash_register_model.freezed.dart';
part 'cash_register_model.g.dart';

@freezed
class CashRegisterModel with _$CashRegisterModel {
  const CashRegisterModel._();
  const factory CashRegisterModel({
    required int id,
    required double initialAmount,
    required double totalIncome,
    required double totalExpense,
    required double finalAmount,
    required bool isClosed,
    DateTime? closedAt,
    required double balance,
    required DateTime createdAt,
    required DateTime updatedAt,
    required UserModel? closedBy,
    required UserModel createdBy,
    required double discrepancy,
    required List<CashTransactionModel> cashTransactions,
  }) = _CashRegisterModel;

  factory CashRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$CashRegisterModelFromJson(json);

  CashRegister toEntity() => CashRegister(
        id: id,
        initialAmount: initialAmount,
        totalIncome: totalIncome,
        totalExpense: totalExpense,
        finalAmount: finalAmount,
        isClosed: isClosed,
        closedAt: closedAt,
        balance: balance,
        createdAt: createdAt,
        updatedAt: updatedAt,
        closedBy: closedBy?.toEntity(),
        createdBy: createdBy.toEntity(),
        discrepancy: discrepancy,
        cashTransactions: cashTransactions.map((e) => e.toEntity()).toList(),
      );

      
}
