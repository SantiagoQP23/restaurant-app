import 'package:flutter/material.dart';
import 'package:restaurant_app/features/home/presentation/widgets/order_card.dart';

class OrderList extends StatelessWidget {
  final String status;
  List<String> items = List<String>.generate(5, (i) => 'Item $i');
  OrderList({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      prototypeItem: OrderCard(),
      itemBuilder: (context, index) {
        return OrderCard();
      },
    );
  }
}
