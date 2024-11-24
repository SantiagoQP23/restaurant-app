// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BillModelImpl _$$BillModelImplFromJson(Map<String, dynamic> json) =>
    _$BillModelImpl(
      id: (json['id'] as num).toInt(),
      number: json['num'] as String,
      comments: json['comments'] as String,
      paymentMethod: json['paymentMethod'] as String,
      receivedAmount: (json['receivedAmount'] as num).toDouble(),
      change: (json['change'] as num).toDouble(),
      subtotal: (json['subtotal'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      isPaid: json['isPaid'] as bool,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      isActive: json['isActive'] as bool,
      details: (json['details'] as List<dynamic>)
          .map((e) => BillDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BillModelImplToJson(_$BillModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'num': instance.number,
      'comments': instance.comments,
      'paymentMethod': instance.paymentMethod,
      'receivedAmount': instance.receivedAmount,
      'change': instance.change,
      'subtotal': instance.subtotal,
      'total': instance.total,
      'discount': instance.discount,
      'isPaid': instance.isPaid,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isActive': instance.isActive,
      'details': instance.details,
    };
