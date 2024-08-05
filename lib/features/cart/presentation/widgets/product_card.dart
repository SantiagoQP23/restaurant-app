import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {},
        splashColor: Colors.blue.withAlpha(30),
        child: SizedBox(
            width: 200,
            height: 400,
            child: Column(
              children: <Widget>[
                Image.network(
                  'https://sabor.eluniverso.com/wp-content/uploads/2023/07/arroz_marinero_electrico.jpg',
                  loadingBuilder: (context, child, loadingProgress) =>
                      loadingProgress == null
                          ? child
                          : const CircularProgressIndicator(),
                ),
                Text(
                  'Arroz marinero',
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
                      'Precio: \$10.00',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_shopping_cart),
                      onPressed: () {context.go('/cart/menu/product');},
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
