// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BillDetailModelImpl _$$BillDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BillDetailModelImpl(
      id: (json['id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      orderDetail: OrderDetailModel.fromJson(
          json['orderDetail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BillDetailModelImplToJson(
        _$BillDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'price': instance.price,
      'total': instance.total,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'orderDetail': instance.orderDetail,
    };
