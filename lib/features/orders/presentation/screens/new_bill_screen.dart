import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewBillScreen extends StatelessWidget {
  const NewBillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New bill'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: new Placeholder(),
        ),
        bottomSheet: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$10.00',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.go('/order/new-bill/bill');
                },
                child: Text('Crear cuenta'),
              ),
            ],
          ),
        ));
  }
}
