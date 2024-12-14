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
    String date = '${DateFormat.yMMMd().format(order.createdAt)} ${DateFormat.Hm().format(order.createdAt)}';
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
                      Row(
                        children: [
                          if (order.type == OrderType.inPlace)
                            const Icon(
                              Icons.restaurant_menu,
                              size: 18,
                            ),
                          if (order.type == OrderType.takeAway)
                            const Icon(
                              Icons.shopping_bag,
                              size: 18,
                            ),

                          const SizedBox(width: 5),
                          Text(order.type == OrderType.inPlace
                              ? 'Table ${order.table?.name ?? ''}'
                              : 'Para llevar'),
                        ],
                      ),
                      Text('#${order.number} '),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              '${order.waiter.person.name} ${order.waiter.person.lastName}'),
                          Text('${order.details.length} items'),
                        ],
                      ),
                      orderStatusChip(status: order.status),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(date),
                      Text(
                        '\$${order.total}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
