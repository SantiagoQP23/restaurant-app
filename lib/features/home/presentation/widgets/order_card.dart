import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({super.key});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  String date = (DateFormat.yMMMd().format(DateTime.now()));

  @override
  Widget build(BuildContext context) {
    return 
    
    Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: (){context.go( '/order');},
          splashColor: Colors.blue.withAlpha(30),
          child:
           Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(date), const Text('Order ID: 123456')],
                ),
                const Divider(
                  height: 30,
                  thickness: 3,
                  color: Colors.grey,
                ),
                Row(children: [Text('Mesa 2')],),
                Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Arroz marinero'),
                      Text('Cazuela de mariscos'),
                    ],
                  ),
                ]),
                const Divider(
                  height: 30,
                  thickness: 3,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('7 productos'),
                    Text('Total: \$ 100.00'),
                  ],
                )
              ],
            ))));
  }
}

