import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _counter = 1;

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
    return Scaffold(
        appBar: AppBar(
          title: Text('Product'),
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Text(
              'Arroz marinero',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('lorem ipsum dolor sit amet'),
            TextField(
              scrollPadding: EdgeInsets.all(90),
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'Add a note',
              ),
            ),
            SizedBox(height: 80),
          ],
        )),
        bottomSheet: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Price: \$10.00',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {context.go('/cart/menu');},
                child: Text('Add to cart'),
              ),
            ],
          ),
        ));
  }
}
