import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';

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
      label: const Text('Pagar'),
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
                      'Resumen del pedido',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total'),
                        Text('\$${order.total}'),
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
                                return ListTile(
                                  leading: CircularProgressIndicator(
                                    strokeWidth: 3,
                                    value: bill.total / order.total,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.blue),
                                  ),
                                  title: Text('${bill.paymentMethod.name}'),
                                  subtitle:
                                      Text(formatDate.format(bill.createdAt)),
                                  trailing: Text('\$${bill.total}'),
                                );
                              }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total por pagar'),
                        Text('\$$totalToPay'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: const Text('Crear cuenta'),
                          onPressed: () => totalToPay != 0
                              ? context.go('/order/new-bill')
                              : null,
                        ))
                  ],
                ));
          },
        );
      },
    );
  }
}
