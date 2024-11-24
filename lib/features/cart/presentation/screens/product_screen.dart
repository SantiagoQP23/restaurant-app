import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/config/routes/routes.dart';
import 'package:restaurant_app/features/cart/domain/entities/new_order_detail.dart';
import 'package:restaurant_app/features/cart/presentation/providers/cart_providers.dart';
import 'package:restaurant_app/features/cart/presentation/providers/products_providers.dart';
import 'package:restaurant_app/features/orders/presentation/providers/orders_provider.dart';

class ProductScreen extends ConsumerStatefulWidget {
  const ProductScreen({super.key});

  @override
  ProductScreenState createState() => ProductScreenState();
}

class ProductScreenState extends ConsumerState<ProductScreen> {
  int _counter = 1;
  String note = '';

  void _changeNote(String value) {
    setState(() {
      note = value;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = ref.watch(activeProductProvider);
    final activeOrder = ref.watch(activeOrderProvider);
    return Scaffold(
        appBar: AppBar(
          // title: Text('Product'),
        ),
        body: product == null
            ? Center(child: Text('No product selected'))
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.network(
                      'https://sabor.eluniverso.com/wp-content/uploads/2023/07/arroz_marinero_electrico.jpg',
                      loadingBuilder: (context, child, loadingProgress) =>
                          loadingProgress == null
                              ? child
                              : const CircularProgressIndicator(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            _decrementCounter();
                          },
                        ),
                        Text('$_counter'),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            _incrementCounter();
                          },
                        ),
                      ],
                    ),
                    const Text(
                      "Details",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(product.description),
                    TextField(
                      scrollPadding: EdgeInsets.all(90),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      onChanged: _changeNote,
                      decoration: InputDecoration(
                        hintText: 'Add a note',
                      ),
                    ),
                    SizedBox(height: 80),
                  ],
                )),
        bottomSheet: product == null
            ? null
            : Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price: \$${(product.price * _counter).toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton.icon(
                      label: Text('Add to cart'),
                      icon: Icon(Icons.add_shopping_cart),

                      onPressed: () {
                        if (activeOrder != null) {
                          // ref.read(ordersProvider.)
                        } else {
                          ref
                              .read(orderDetailsProvider.notifier)
                              .addOrderDetail(
                                NewOrderDetail(
                                    product: product,
                                    quantity: _counter,
                                    note: note,
                                    price: product.price),
                              );
                          context.pop(Routes.menu);
                        }
                      },
                      // child: Text('Add to cart'),
                    ),
                  ],
                ),
              ));
  }
}
