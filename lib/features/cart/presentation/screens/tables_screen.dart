import 'package:flutter/material.dart';
import 'package:restaurant_app/features/cart/presentation/widgets/table_card.dart';

class TablesScreen extends StatelessWidget {
  const TablesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tables'),
      ),
      body: Column(
        children: [
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed('/cart/checkout');
                  // context.go('/cart/checkout');
                },
                child: const Text('Crear pedido para llevar'),
              )),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 2,
              childAspectRatio: (1 / 0.5),
              // Generate 100 widgets that display their index in the List.
              children: List.generate(20, (index) {
                return TableCard();
              }),
            ),
          )
        ],
      ),
    );
  }
}
