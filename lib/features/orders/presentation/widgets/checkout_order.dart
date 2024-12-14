import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_app/config/routes/app_router.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';
import 'package:restaurant_app/features/orders/presentation/widgets/bill_creation_sheet.dart';

class CheckoutOrder extends StatelessWidget {
  final Order order;
  const CheckoutOrder({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final formatDate = DateFormat('dd/MM/yyyy HH:mm');
    final totalPaid = order.bills.fold<double>(
        0, (previousValue, element) => previousValue + element.total);
    final totalToPay = order.total - totalPaid;
    return FilledButton.icon(
      icon: const Icon(Icons.payment),
      label: const Text('Payments'),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
                padding: const EdgeInsets.all(10),
                height: 350,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      "Order's payments",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total'),
                        Text(
                          '\$${order.total}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Expanded(
                      child: order.bills.isEmpty
                          ? const Center(child: Text('No hay cuentas'))
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: order.bills.length,
                              itemBuilder: (context, index) {
                                final bill = order.bills[index];
                                final percentage =
                                    bill.total / order.total * 100;
                                final name =
                                    '${bill.createdBy?.person.name} ${bill.createdBy?.person.lastName}';
                                return Card(
                                    clipBehavior: Clip.hardEdge,
                                    child: InkWell(
                                      splashColor: Colors.blue.withAlpha(30),
                                      onTap: () {
                                        context.push(
                                            '${AppRoutes.bills}/${bill.id}');
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                // SizedBox(
                                                //   width: 25,
                                                //   height: 25,
                                                //   child:
                                                //       CircularProgressIndicator(
                                                //     strokeWidth: 3,
                                                //     value: bill.total /
                                                //         order.total,
                                                //     valueColor:
                                                //         AlwaysStoppedAnimation<
                                                //             Color>(Colors.blue),
                                                //   ),
                                                // ),
                                                // const SizedBox(
                                                //   width: 10,
                                                // ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '$name ',
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                            '${percentage.toStringAsFixed(2)} %'),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(bill.paymentMethod
                                                            .name),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(formatDate.format(
                                                            bill.createdAt)),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Text('\$${bill.total}'),
                                          ],
                                        ),
                                      ),
                                    ));
                              }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (order.isPaid)
                          Chip(label: Text(order.isPaid ? 'Paid' : 'Pending')),
                        if (!order.isPaid) const Text('Total por pagar'),
                        Text(
                          '\$$totalToPay',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (totalToPay != 0)
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: const Text('Add bill'),
                            onPressed: () => totalToPay != 0
                                ? _showBillCreationSheet(context)
                                : null,
                          ))
                  ],
                ));
          },
        );
      },
    );
  }

  void _showBillCreationSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BillCreationSheet(order: order);
      },
    );
  }
}
