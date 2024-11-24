import 'product.dart';

class Category {
  final String id;
  final String name;
  // final String image;
  final int order;
  final List<Product> products;
  final bool isActive;
  final bool isPublic;
  final String sectionId;

  Category({
    required this.id,
    required this.name,
    // required this.image,
    required this.products,
    required this.isActive,
    required this.isPublic,
    required this.sectionId,
    required this.order,
  });
}
