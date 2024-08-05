import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/features/cart/presentation/widgets/product_list.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                context.go('/cart/menu/cart');
              },
            ),
          ],
        ),
        body: DefaultTabController(
          length: 5,
          child: Column(
            children: const <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search product',
                ),
              ),
              TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  tabs: [
                    Tab(text: 'Food'),
                    Tab(text: 'Drink'),
                    Tab(text: 'Snack'),
                    Tab(text: 'Dessert'),
                    Tab(text: 'Others'),
                  ]),
              Expanded(
                  child: TabBarView(
                children: [
                  ProductList(),
                  ProductList(),
                  ProductList(),
                  ProductList(),
                  ProductList(),
                ],
              )),
            ],
          ),
        ));
  }
}
