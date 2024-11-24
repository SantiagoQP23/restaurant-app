import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/features/auth/domain/entities/user.dart';
import 'package:restaurant_app/features/cart/presentation/widgets/table_card.dart';
import 'package:restaurant_app/features/orders/presentation/providers/orders_provider.dart';
import 'package:restaurant_app/features/tables/domain/domain.dart';
import 'package:restaurant_app/features/tables/domain/entities/table.dart';
import 'package:restaurant_app/features/tables/presentation/presentation.dart';

class SelectTableBottomSheet extends ConsumerWidget {
  final TableEntity? table;
  final ValueChanged<TableEntity> _onTap;
  const SelectTableBottomSheet(
      {super.key, required ValueChanged<TableEntity> onTap, this.table})
      : _onTap = onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tablesState = ref.watch(tablesProvider);
    return tablesState.when(
        data: (tables) => TablesBottomSheet(
              tables: tables,
              onTap: _onTap,
              table: table,
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')));
  }
}

class TablesBottomSheet extends ConsumerStatefulWidget {
  final List<TableEntity> tables;
  final TableEntity? table;
  final ValueChanged<TableEntity> _onTap;

  const TablesBottomSheet(
      {super.key,
      required this.tables,
      required ValueChanged<TableEntity> onTap,
      this.table})
      : _onTap = onTap;

  @override
  ConsumerState<TablesBottomSheet> createState() => _TablesBottomSheetState();
}

class _TablesBottomSheetState extends ConsumerState<TablesBottomSheet> {
  TableEntity? selectedTable;

  @override
  void initState() {
    super.initState();
    if (widget.table != null) {
      selectedTable = widget.table!;
    }
  }

  void onChanged(bool? value, TableEntity table) {
    if (value != null) {
      if (value == true) {
        setState(() {
          selectedTable = table;
        });
      } else {
        setState(() {
          selectedTable = null;
        });
      }
    }
  }

  void updateOrder() {
    final activeOrder = ref.watch(activeOrderProvider);
    if (activeOrder != null) {}
  }

  @override
  Widget build(BuildContext context) {
    final currentTable = widget.table;
    final tables = widget.tables;
    return Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        // height: 500,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Select table',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(currentTable != null
                ? 'Current user: ${currentTable.name}'
                : 'Select a user'),
            Expanded(
              child: GridView.builder(
                itemCount: tables.length,
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (1 / 0.8),
                ),
                // Generate 100 widgets that display their index in the List.
                itemBuilder: (context, index) {
                  return TableCard(
                    table: tables[index],
                    onTap: widget._onTap,
                    selected: selectedTable?.id == tables[index].id,
                    changeTable: (tableId) {
                      onChanged(true, tables[index]);
                    },
                  );
                },
              ),
            ),
            // Expanded(
            //   child: ,
            // ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedTable != null) {
                      widget._onTap(selectedTable!);
                      context.pop();
                    }
                  },
                  child: const Text('Save'),
                )),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.transparent)),
                  child: const Text('Cancel'),
                  onPressed: () => context.pop(),
                ))
          ],
        ));
  }
}
