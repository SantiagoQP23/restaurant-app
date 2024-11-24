// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TableModelImpl _$$TableModelImplFromJson(Map<String, dynamic> json) =>
    _$TableModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      capacity: (json['chairs'] as num).toInt(),
      isAvailable: json['isAvailable'] as bool? ?? false,
      order: (json['order'] as num).toInt(),
      description: json['description'] as String,
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$TableModelImplToJson(_$TableModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'chairs': instance.capacity,
      'isAvailable': instance.isAvailable,
      'order': instance.order,
      'description': instance.description,
      'isActive': instance.isActive,
    };
