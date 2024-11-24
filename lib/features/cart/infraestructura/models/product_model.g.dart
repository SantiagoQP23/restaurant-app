// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      images: json['images'] as String,
      isActive: json['isActive'] as bool,
      isPublic: json['isPublic'] as bool,
      categoryId: json['categoryId'] as String,
      productionAreaId: (json['productionAreaId'] as num).toInt(),
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'images': instance.images,
      'isActive': instance.isActive,
      'isPublic': instance.isPublic,
      'categoryId': instance.categoryId,
      'productionAreaId': instance.productionAreaId,
    };
