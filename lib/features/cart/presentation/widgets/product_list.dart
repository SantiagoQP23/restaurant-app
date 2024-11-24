import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_app/features/cart/presentation/providers/categories_providers.dart';
import 'package:restaurant_app/features/cart/presentation/widgets/product_card.dart';

class ProductList extends ConsumerWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesByActiveSectionProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          for (var category in categories)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        category.name,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        // height: MediaQuery.of(context).size.height,
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: category.products.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              product: category.products[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // GridView.count(
                //   crossAxisCount: 2,
                //   childAspectRatio: (1 / 1.1),
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   children: List.generate(category.products.length, (index) {
                //     return ProductCard();
                //   }),
                // ),
              ],
            )
        ],
      ),
    );
  }
}
