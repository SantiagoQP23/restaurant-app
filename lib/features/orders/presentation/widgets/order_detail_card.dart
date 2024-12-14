import 'package:flutter/material.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';
import 'package:restaurant_app/features/orders/presentation/widgets/edit_order_detail.dart';

class OrderDetailCard extends StatefulWidget {
  final OrderDetail orderDetail;
  final String orderId;
  const OrderDetailCard({super.key, required this.orderDetail, required this.orderId});

  @override
  State<OrderDetailCard> createState() => _OrderDetailCardState();
}

class _OrderDetailCardState extends State<OrderDetailCard> {
  @override
  Widget build(BuildContext context) {
    OrderDetail orderDetail = widget.orderDetail;
    return Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
            onTap: () {
              // context.push('${AppRoutes.orders}/${order.id}');
              showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return EditOrderDetail(orderDetail: orderDetail, orderId: widget.orderId);
                  });
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
                      Text(
                        orderDetail.product.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          value:
                              orderDetail.qtyDelivered / orderDetail.quantity,
                          backgroundColor: Colors.grey[300],
                          valueColor:
                              const AlwaysStoppedAnimation<Color>(Colors.green),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (orderDetail.description != '')
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          orderDetail.description,
                          textAlign: TextAlign.start,
                          // style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  if (orderDetail.description != '') const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('x${orderDetail.quantity}'),
                      Text('\$${orderDetail.product.price}'),
                    ],
                  ),
                ],
              ),
            )));
  }
}
