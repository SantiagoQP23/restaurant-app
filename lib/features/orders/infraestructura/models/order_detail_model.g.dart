// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderDetailModelImpl _$$OrderDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderDetailModelImpl(
      id: json['id'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      qtyDelivered: (json['qtyDelivered'] as num).toDouble(),
      qtyPaid: (json['qtyPaid'] as num).toDouble(),
      amount: (json['amount'] as num).toDouble(),
      description: json['description'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      isActive: json['isActive'] as bool,
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderDetailModelImplToJson(
        _$OrderDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'price': instance.price,
      'qtyDelivered': instance.qtyDelivered,
      'qtyPaid': instance.qtyPaid,
      'amount': instance.amount,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isActive': instance.isActive,
      'product': instance.product,
    };
