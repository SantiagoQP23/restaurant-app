import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_app/features/home/presentation/widgets/order_card.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';
import 'package:restaurant_app/features/orders/presentation/providers/orders_provider.dart';

class OrderList extends ConsumerWidget {
  final OrderStatus? status;
  const OrderList({super.key, this.status});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeOrdersState = ref.watch(ordersProvider);
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: activeOrdersState.when(
          data: (data) {
            final orders = status != null
                ? data.where((element) => element.status == status).toList()
                : data;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return OrderCard(
                  order: orders[index],
                );
              },
            );
          },
          error: (error, stackTrace) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: $error'),
                ElevatedButton(
                  onPressed: () {
                    ref.refresh(ordersProvider);
                  },
                  child: const Text('Try again'),
                ),
              ],
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        ));
  }
}
