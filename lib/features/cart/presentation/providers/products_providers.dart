import 'package:restaurant_app/features/cart/domain/entities/product.dart';
import 'package:restaurant_app/features/cart/presentation/providers/categories_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_providers.g.dart';

@Riverpod(keepAlive: true)
class ProductName extends _$ProductName {
  @override
  String build() {
    return '';
  }

  void changeProductName(String name) {
    state = name;
  }
}

@Riverpod(keepAlive: true)
class ActiveProduct extends _$ActiveProduct {
  @override
  Product? build() {
    return null;
  }

  void setActiveProduct(Product product) {
    state = product;
  }
}

@Riverpod(keepAlive: true)
List<Product> productsByName(ProductsByNameRef ref) {
  final categories = ref.watch(categoriesProvider).value;
  final productName = ref.watch(productNameProvider);
  List<Product> products = [];
  List<Product> filteredProducts = [];

  categories?.forEach((category) {
    products.addAll(category.products);
  });

  if (productName.isNotEmpty) {
    filteredProducts = products
        .where((product) =>
            product.name.toLowerCase().contains(productName.toLowerCase()))
        .toList();
  } else {
    filteredProducts = products;
  }

  return filteredProducts;
}
