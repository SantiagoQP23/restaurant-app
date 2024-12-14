// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CashTransactionModelImpl _$$CashTransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CashTransactionModelImpl(
      id: (json['id'] as num).toInt(),
      description: json['description'] as String,
      performedBy:
          UserModel.fromJson(json['performedBy'] as Map<String, dynamic>),
      type: json['type'] as String,
      amount: (json['amount'] as num).toDouble(),
      createdBy: UserModel.fromJson(json['createdBy'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      category: TransactionCategoryModel.fromJson(
          json['category'] as Map<String, dynamic>),
      isEditable: json['isEditable'] as bool,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$$CashTransactionModelImplToJson(
        _$CashTransactionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'performedBy': instance.performedBy,
      'type': instance.type,
      'amount': instance.amount,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'category': instance.category,
      'isEditable': instance.isEditable,
      'isActive': instance.isActive,
    };
