import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_app/features/cart/presentation/providers/cart_providers.dart';
import 'package:restaurant_app/features/orders/presentation/providers/orders_provider.dart';

import 'package:restaurant_app/features/tables/domain/domain.dart';

class TableCard extends ConsumerWidget {
  final TableEntity table;
  bool selected;
  final ValueChanged<TableEntity> onTap;
  final ValueSetter<TableEntity> changeTable;
  TableCard(
      {super.key,
      required this.table,
      required this.onTap,
      required this.changeTable,
      this.selected = false});
      

  void updateTable(WidgetRef ref) {
    final activeOrder = ref.watch(activeOrderProvider);
    if (activeOrder != null) {
      //
      ref
          .read(activeOrdersProvider.notifier)
          .emitUpdateOrder(activeOrder.toUpdateOrderDto(tableId: table.id));
      // ref.read(activeOrderProvider.notifier).setTable(table);
    } else {
      ref.read(tableOrderProvider.notifier).setTableOrder(table);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tableOrder = ref.watch(tableOrderProvider);
    final name = table.name;
    return Card(
      clipBehavior: Clip.hardEdge,
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: selected ? Colors.blue : Colors.transparent,
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: () {
          changeTable(table);
          // context.push(Routes.menu);
        },
        splashColor: Colors.blue.withAlpha(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.restaurant),
            Text(
              'Table $name',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Chip(
              label: Text(table.isAvailable ? 'Available' : 'Ocupada',
                  style: const TextStyle(color: Colors.white)),
              backgroundColor: table.isAvailable ? Colors.green : Colors.red,
              padding: const EdgeInsets.all(1),
              shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              side: BorderSide.none,
            ),
          ],
        ),
      ),
    );
  }
}
