import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_app/features/cart/domain/entities/product.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const ProductModel._();
  const factory ProductModel({
    required String id,
    required String name,
    required String description,
    required double price,
    required String images,
    required bool isActive,
    required bool isPublic,
    required String categoryId,
    required int productionAreaId,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Product toEntity() => Product(
        id: id,
        name: name,
        description: description,
        price: price,
        images: images,
        isActive: isActive,
        isPublic: isPublic,
        categoryId: categoryId,
        productionAreaId: productionAreaId,
      );
}
