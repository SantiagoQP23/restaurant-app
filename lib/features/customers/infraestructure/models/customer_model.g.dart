// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerModelImpl _$$CustomerModelImplFromJson(Map<String, dynamic> json) =>
    _$CustomerModelImpl(
      id: json['id'] as String,
      person: PersonModel.fromJson(json['person'] as Map<String, dynamic>),
      address: json['address'] as String,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$$CustomerModelImplToJson(_$CustomerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'person': instance.person,
      'address': instance.address,
      'isActive': instance.isActive,
    };
