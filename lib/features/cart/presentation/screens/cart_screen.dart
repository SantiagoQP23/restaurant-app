import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/config/routes/routes.dart';
import 'package:restaurant_app/features/cart/presentation/providers/cart_providers.dart';
import 'package:restaurant_app/features/cart/presentation/widgets/bottom_sheet_checkout.dart';
import 'package:restaurant_app/features/cart/presentation/widgets/product_item.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';
import 'package:restaurant_app/features/orders/presentation/providers/orders_provider.dart';
import 'package:restaurant_app/features/orders/presentation/widgets/select_type_order.dart';
import 'package:restaurant_app/features/tables/presentation/widgets/select_table_bottom_sheet.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends ConsumerState<CartScreen> {
  void _decrementGuests(int currentQuantity) {
    if (currentQuantity >= 2) {
      ref.read(orderGuestsProvider.notifier).setOrderGuests(--currentQuantity);
    }
  }

  void _incrementGuests(int currentQuantity) {
    ref.read(orderGuestsProvider.notifier).setOrderGuests(++currentQuantity);
  }

  @override
  Widget build(BuildContext context) {
    final ordersDetails = ref.watch(orderDetailsProvider);
    final table = ref.watch(tableOrderProvider);
    final totalCart = ref.watch(totalCartProvider);
    final orderType = ref.watch(orderTypeCartProvider);
    final guests = ref.watch(orderGuestsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SelectTypeOrder(
                  orderType: orderType,
                  onSelected: (newOrderType) {
                    ref
                        .read(orderTypeCartProvider.notifier)
                        .setOrderType(newOrderType);
                  }),
              if (orderType == OrderType.inPlace)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Table',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        Text(table?.name ?? 'No asignada'),
                        Container(
                            child: table != null
                                ? null
                                : const Text(
                                    'Please, select a table',
                                    style: TextStyle(color: Colors.red),
                                  ))
                      ],
                    ),
                    TextButton.icon(
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          isScrollControlled: true,
                          useSafeArea: true,
                          builder: (BuildContext context) {
                            return SelectTableBottomSheet(
                                table: table,
                                onTap: (newTable) {
                                  ref
                                      .read(tableOrderProvider.notifier)
                                      .setTableOrder(newTable);
                                });
                          },
                        );
                      },
                      label: const Text('Select'),
                      // icon: Icon(Icons.edit)
                    )
                  ],
                ),
              // const Text('Select a table'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Guests',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      // Text(table?.name ?? 'No asignada'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          _decrementGuests(guests);
                        },
                      ),
                      Text(guests.toString()),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          _incrementGuests(guests);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Cart',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      Text('${ordersDetails.length} items '),
                    ],
                  ),
                  TextButton.icon(
                      onPressed: () {
                        ref
                            .read(activeOrderProvider.notifier)
                            .clearActiveOrder();
                        context.push(Routes.menu);
                      },
                      label: Text('Add'),
                      icon: Icon(Icons.shopping_cart))
                ],
              ),
              for (var orderDetail in ordersDetails)
                ProductItem(orderDetail: orderDetail),
              const SizedBox(
                height: 110,
                width: 0,
              ),
            ],
          )),
      bottomSheet: IntrinsicHeight(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total: '),
                    Text('\$$totalCart'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: double.infinity,
                    // height: 200,
                    child: ElevatedButton(
                      child: const Text('Checkout'),
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          isScrollControlled: true,
                          // useSafeArea: true,
                          builder: (BuildContext context) {
                            return const BottomSheetCheckout();
                          },
                        );
                      },
                    ))
              ],
            )),
      ),
    );
  }
}
