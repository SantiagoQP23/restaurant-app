// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['id'] as String,
      number: (json['num'] as num).toInt(),
      notes: json['notes'] as String,
      deliveryTime: json['deliveryTime'] as String,
      type: json['type'] as String,
      isPaid: json['isPaid'] as bool,
      isClosed: json['isClosed'] as bool,
      people: (json['people'] as num).toInt(),
      total: (json['total'] as num).toDouble(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      table: json['table'] == null
          ? null
          : TableModel.fromJson(json['table'] as Map<String, dynamic>),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      status: json['status'] as String,
      details: (json['details'] as List<dynamic>)
          .map((e) => OrderDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bills: (json['bills'] as List<dynamic>?)
              ?.map((e) => BillModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'num': instance.number,
      'notes': instance.notes,
      'deliveryTime': instance.deliveryTime,
      'type': instance.type,
      'isPaid': instance.isPaid,
      'isClosed': instance.isClosed,
      'people': instance.people,
      'total': instance.total,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'table': instance.table,
      'user': instance.user,
      'status': instance.status,
      'details': instance.details,
      'bills': instance.bills,
    };
