import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_app/features/cart/domain/entities/product.dart';
import 'package:restaurant_app/features/cart/presentation/widgets/product_card.dart';

class GridProducts extends ConsumerWidget {
  final List<Product> products;
  const GridProducts({super.key, required this.products});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: 
         GridView.builder(
          itemCount: products.length,
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          shrinkWrap: true,
          primary: false,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (1 / 1.2),
            
          ),
          // Generate 100 widgets that display their index in the List.
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        ),
      );
  }
}
