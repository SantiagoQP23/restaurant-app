import 'product_option.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final String description;
  final String images;
  final bool isActive;
  final bool isPublic;
  final String categoryId;
  final int productionAreaId;
  // final List<ProductOption> options;

  Product({
    required this.name,
    required this.id,
    required this.images,
    required this.isActive,
    // required this.options,
    required this.price,
    required this.description,
    required this.isPublic,
    required this.categoryId,
    required this.productionAreaId,
  });
}
