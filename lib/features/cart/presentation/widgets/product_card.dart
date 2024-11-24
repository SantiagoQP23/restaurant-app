import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/config/routes/routes.dart';
import 'package:restaurant_app/features/cart/domain/entities/product.dart';
import 'package:restaurant_app/features/cart/presentation/providers/products_providers.dart';

class ProductCard extends ConsumerStatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  ProductCardState createState() => ProductCardState();
}

class ProductCardState extends ConsumerState<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {},
        splashColor: Colors.blue.withAlpha(30),
        child: SizedBox(
          height: 200,
          width: 200,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 200,
                width: 200,
                child: Image.network(
                  widget.product.images != ''
                      ? widget.product.images
                      : 'https://sabor.eluniverso.com/wp-content/uploads/2023/07/arroz_marinero_electrico.jpg',
                  loadingBuilder: (context, child, loadingProgress) =>
                      loadingProgress == null
                          ? child
                          : const CircularProgressIndicator(),
                ),
              ),
              Text(
                widget.product.name,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '10 disponibles',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Precio: \$${widget.product.price}',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      ref
                          .read(activeProductProvider.notifier)
                          .setActiveProduct(widget.product);
                      context.push(Routes.product);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
