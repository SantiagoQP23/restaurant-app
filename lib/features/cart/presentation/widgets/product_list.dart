import 'package:flutter/material.dart';
import 'package:restaurant_app/features/cart/presentation/widgets/product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      childAspectRatio: (1 / 1.1),
      // Generate 100 widgets that display their index in the List.
      children: List.generate(10, (index) {
        return ProductCard();
      }),
    );
  }
}
