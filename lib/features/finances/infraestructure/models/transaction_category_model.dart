import 'package:restaurant_app/features/finances/domain/entities/transaction_category.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_category_model.freezed.dart';
part 'transaction_category_model.g.dart';

@freezed
class TransactionCategoryModel with _$TransactionCategoryModel {
  const TransactionCategoryModel._();
  const factory TransactionCategoryModel({
    required int id,
    required String name,
    required String description,
    required String transactionType,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String color,
    required bool isActive,
  }) = _TransactionCategoryModel;

  factory TransactionCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionCategoryModelFromJson(json);

  TransactionCategory toEntity() => TransactionCategory(
        id: id,
        name: name,
        description: description,
        transactionType: transactionType == 'INCOME'
            ? TransactionType.income
            : TransactionType.expense,
        createdAt: createdAt,
        updatedAt: updatedAt,
        color: color,
        isActive: isActive,
      );
}
