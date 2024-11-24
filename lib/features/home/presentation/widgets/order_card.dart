import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/config/routes/app_router.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_app/features/shared/widgets/order_status_chip.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({super.key, required this.order});
  final Order order;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    Order order = widget.order;
    String date = (DateFormat.yMMMd().format(order.createdAt));
    return Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
            onTap: () {
              context.push('${AppRoutes.orders}/${order.id}');
            },
            splashColor: Colors.blue.withAlpha(30),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text(date),
                      orderStatusChip(status: order.status),
                      Text(order.type == OrderType.inPlace
                          ? 'Table ${order.table?.name ?? ''}'
                          : 'Para llevar'),
                      Text('#${order.number} '),
                    ],
                  ),
                  Row(
                    children: [],
                  ),
                  // Row(children: [
                  //   Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text('Arroz marinero'),
                  //       Text('Cazuela de mariscos'),
                  //     ],
                  //   ),
                  // ]),
                  const Divider(
                    height: 30,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(order.details.length.toString() + ' items'),
                      Text(date),
                      Text('Total: \$${order.total}'),
                    ],
                  )
                ],
              ),
            )));
  }
}
