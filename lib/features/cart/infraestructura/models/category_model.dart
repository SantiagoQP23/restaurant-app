import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_app/features/cart/domain/entities/category.dart';
import 'package:restaurant_app/features/cart/infraestructura/models/product_model.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const CategoryModel._();
  const factory CategoryModel({
    required String id,
    required String name,
    required bool isActive,
    required bool isPublic,
    required String sectionId,
    required int order,
    required List<ProductModel> products,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Category toEntity() => Category(
        id: id,
        name: name,
        order: order,
        products: products.map((product) => product.toEntity()).toList(),
        isActive: isActive,
        isPublic: isPublic,
        sectionId: sectionId,
      );
}
