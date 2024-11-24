import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_app/config/routes/routes.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';
import 'package:restaurant_app/features/orders/presentation/providers/orders_provider.dart';
import 'package:restaurant_app/features/orders/presentation/widgets/checkout_order.dart';
import 'package:restaurant_app/features/orders/presentation/widgets/edit_order_detail.dart';
import 'package:restaurant_app/features/orders/presentation/widgets/select_type_order.dart';
import 'package:restaurant_app/features/orders/presentation/widgets/select_user_bottom_sheet.dart';
import 'package:restaurant_app/features/tables/presentation/widgets/select_table_bottom_sheet.dart';

class OrderScreen extends ConsumerWidget {
  final String id;
  const OrderScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderState = ref.watch(orderByIdProvider(id));
    return orderState.when(
      error: (error, stackTrace) => ErrorScaffold(error, stackTrace),
      loading: () => const LoadingScaffold(),
      data: (order) => OrderScaffold(order: order),
    );
  }

  Scaffold ErrorScaffold(Object error, StackTrace stackTrace) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Error'),
          Text(error.toString()),
          Text(stackTrace.toString())
        ],
      ),
    );
  }
}

class LoadingScaffold extends StatelessWidget {
  const LoadingScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

class OrderScaffold extends ConsumerStatefulWidget {
  final Order order;
  const OrderScaffold({
    super.key,
    required this.order,
  });

  @override
  OrderScaffoldState createState() => OrderScaffoldState();
}

class OrderScaffoldState extends ConsumerState<OrderScaffold> {
  TimeOfDay selectedTime = TimeOfDay.now();
  int guests = 0;
  bool isUpdatingGuests = false;
  void _decrementGuests() {
    if (guests >= 2) {
      setState(() {
        guests--;
      });
      // ref.read(orderGuestsProvider.notifier).setOrderGuests(--currentQuantity);
    }
  }

  void _incrementGuests() {
    setState(() {
      guests++;
    });
    // ref.read(orderGuestsProvider.notifier).setOrderGuests(++currentQuantity);
  }

  @override
  void initState() {
    super.initState();
    guests = widget.order.people;
    // ref.read(activeOrderProvider.notifier).setActiveOrder(widget.order);
  }

  void updateTypeOrder(OrderType type) {
    ref
        .read(activeOrdersProvider.notifier)
        .emitUpdateOrder(widget.order.toUpdateOrderDto(type: type));
  }

  void updateOrderStatus(OrderStatus status) {
    ref
        .read(activeOrdersProvider.notifier)
        .emitUpdateOrder(widget.order.toUpdateOrderDto(status: status));
  }

  @override
  Widget build(BuildContext context) {
    final formatDate = DateFormat('dd/MM/yyyy HH:mm');
    final order = widget.order;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // title: const Text('Orders'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _dialogBuilder(context);
            },
          ),
          const SizedBox(width: 10),
          IconButton(onPressed: () {}, icon: const Icon(Icons.print, size: 30)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.order.status.name,
                    style: const TextStyle(fontSize: 13),
                  ),
                  Text(
                    'Order N: ${widget.order.number}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(formatDate.format(widget.order.createdAt)),
                ],
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Tipo de orden',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            SelectTypeOrder(orderType: order.type, onSelected: updateTypeOrder),

            const SizedBox(
              height: 10,
            ),
            Card(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Delivery Time',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      Text(formatDate.format(order.deliveryTime)),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        showTimePicker(
                                context: context,
                                initialTime: selectedTime,
                                initialEntryMode: TimePickerEntryMode.dial)
                            .then((value) {
                          if (value != null) {
                            ref
                                .read(activeOrdersProvider.notifier)
                                .emitUpdateOrder(order.toUpdateOrderDto(
                                    deliveryTime: DateTime(
                                        order.deliveryTime.year,
                                        order.deliveryTime.month,
                                        order.deliveryTime.day,
                                        value.hour,
                                        value.minute)));
                          }
                        });
                      },
                      child: const Text('Change'))
                ],
              ),
            )), // Waiter Order
            Card(
                child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Guests',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  Container(
                    child: !isUpdatingGuests
                        ? TextButton(
                            onPressed: () {
                              setState(() {
                                isUpdatingGuests = true;
                              });
                            },
                            child: Text('$guests'))
                        : Row(
                            children: [
                              IconButton(
                                  icon: const Icon(Icons.cancel),
                                  onPressed: () {
                                    setState(() {
                                      isUpdatingGuests = false;
                                    });
                                  }),
                              if (guests != order.people)
                                TextButton(
                                    onPressed: () {
                                      ref
                                          .read(activeOrdersProvider.notifier)
                                          .emitUpdateOrder(
                                              order.toUpdateOrderDto(
                                                  people: guests));
                                      setState(() {
                                        isUpdatingGuests = false;
                                      });
                                    },
                                    child: const Text('Save')),
                              IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    _decrementGuests();
                                  }),
                              Text('$guests'),
                              IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    _incrementGuests();
                                  }),
                            ],
                          ),
                  ),
                ],
              ),
            )),
            // Table Order
            Container(
              child: order.type != OrderType.inPlace
                  ? null
                  : Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Table',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                                Text(widget.order.table?.name ?? 'No asignada'),
                                Container(
                                    child: order.table != null
                                        ? null
                                        : const Text(
                                            'Please, select a table',
                                            style: TextStyle(color: Colors.red),
                                          ))
                              ],
                            ),
                            TextButton(
                                onPressed: () {
                                  showModalBottomSheet<void>(
                                    context: context,
                                    isScrollControlled: true,
                                    useSafeArea: true,
                                    builder: (BuildContext context) {
                                      return SelectTableBottomSheet(
                                          table: order.table,
                                          onTap: (newTable) {
                                            ref
                                                .read(activeOrdersProvider
                                                    .notifier)
                                                .emitUpdateOrder(
                                                    order.toUpdateOrderDto(
                                                        tableId: newTable.id));
                                          });
                                    },
                                  );
                                },
                                child: const Text('Change'))
                          ],
                        ),
                      ),
                    ),
            ),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Waiter',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        Text(
                            '${order.waiter.person.name} ${order.waiter.person.lastName}'),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          showModalBottomSheet<void>(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              // ref.read(activeOrderProvider.notifier).setActiveOrder(order);
                              return SelectUserBottomSheet(
                                  user: order.waiter,
                                  onTap: (selectedUser) {
                                    ref
                                        .read(activeOrdersProvider.notifier)
                                        .emitUpdateOrder(order.toUpdateOrderDto(
                                            userId: selectedUser));
                                  });
                            },
                          );
                        },
                        child: const Text('Change'))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Cart',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    Text('${order.details.length} items '),
                  ],
                ),
                TextButton.icon(
                    onPressed: () {
                      ref
                          .read(activeOrderProvider.notifier)
                          .setActiveOrder(widget.order);
                      context.push(Routes.menu);
                    },
                    label: const Text('Add'),
                    icon: const Icon(Icons.shopping_cart))
              ],
            ),

            Column(
              children: widget.order.details
                  .map((detail) => ListTile(
                        title:
                            Text('${detail.product.name} x${detail.quantity}'),
                        subtitle: Text(detail.description),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                          ),
                          onPressed: () {
                            showModalBottomSheet<void>(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return EditOrderDetail(orderDetail: detail);
                                });
                          },
                        ),
                      ))
                  .toList(),
            ),

            const SizedBox(
              height: 110,
              width: 0,
            ),
          ],
        ),
      ),
      bottomSheet: IntrinsicHeight(
        child: Container(
            padding: const EdgeInsets.all(20),
            // height: 105,
            child: Column(
              children: [
                if (order.status == OrderStatus.pending)
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                            icon: const Icon(Icons.arrow_forward),
                            iconAlignment: IconAlignment.end,
                            label: const Text('Start'),
                            onPressed: () {
                              updateOrderStatus(OrderStatus.inProgress);
                            }),
                      ),
                    ],
                  ),
                if (order.status == OrderStatus.delivered && order.isPaid)
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                            icon: const Icon(Icons.arrow_forward),
                            iconAlignment: IconAlignment.end,
                            label: const Text('Close order'),
                            onPressed: () {
                              ref
                                  .read(activeOrdersProvider.notifier)
                                  .emitUpdateOrder(
                                      order.toUpdateOrderDto(isClosed: true));
                            }),
                      ),
                    ],
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (order.status == OrderStatus.inProgress)
                      ElevatedButton.icon(
                          icon: const Icon(Icons.arrow_back),
                          label: const Text('Pending'),
                          onPressed: () {
                            updateOrderStatus(OrderStatus.pending);
                          }),
                    if (order.status == OrderStatus.inProgress)
                      ElevatedButton.icon(
                          icon: const Icon(Icons.done),
                          label: const Text('Delivered'),
                          iconAlignment: IconAlignment.end,
                          onPressed: () {
                            updateOrderStatus(OrderStatus.delivered);
                          }),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // const Text('Total'),
                    Text('\$${widget.order.total}'),
                    CheckoutOrder(order: widget.order),
                  ],
                ),
              ],
            )),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Order'),
          content: const Text('Are you sure you want to delete this order?'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                // textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                // textStyle: const TextStyle(color: Colors.white),
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                updateOrderStatus(OrderStatus.cancelled);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
