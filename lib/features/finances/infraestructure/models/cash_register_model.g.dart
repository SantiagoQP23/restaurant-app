// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CashRegisterModelImpl _$$CashRegisterModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CashRegisterModelImpl(
      id: (json['id'] as num).toInt(),
      initialAmount: (json['initialAmount'] as num).toDouble(),
      totalIncome: (json['totalIncome'] as num).toDouble(),
      totalExpense: (json['totalExpense'] as num).toDouble(),
      finalAmount: (json['finalAmount'] as num).toDouble(),
      isClosed: json['isClosed'] as bool,
      closedAt: json['closedAt'] == null
          ? null
          : DateTime.parse(json['closedAt'] as String),
      balance: (json['balance'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      closedBy: json['closedBy'] == null
          ? null
          : UserModel.fromJson(json['closedBy'] as Map<String, dynamic>),
      createdBy: UserModel.fromJson(json['createdBy'] as Map<String, dynamic>),
      discrepancy: (json['discrepancy'] as num).toDouble(),
      cashTransactions: (json['cashTransactions'] as List<dynamic>)
          .map((e) => CashTransactionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CashRegisterModelImplToJson(
        _$CashRegisterModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'initialAmount': instance.initialAmount,
      'totalIncome': instance.totalIncome,
      'totalExpense': instance.totalExpense,
      'finalAmount': instance.finalAmount,
      'isClosed': instance.isClosed,
      'closedAt': instance.closedAt?.toIso8601String(),
      'balance': instance.balance,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'closedBy': instance.closedBy,
      'createdBy': instance.createdBy,
      'discrepancy': instance.discrepancy,
      'cashTransactions': instance.cashTransactions,
    };
