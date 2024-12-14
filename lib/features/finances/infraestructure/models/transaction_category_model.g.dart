// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionCategoryModelImpl _$$TransactionCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionCategoryModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      transactionType: json['transactionType'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      color: json['color'] as String,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$$TransactionCategoryModelImplToJson(
        _$TransactionCategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'transactionType': instance.transactionType,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'color': instance.color,
      'isActive': instance.isActive,
    };
