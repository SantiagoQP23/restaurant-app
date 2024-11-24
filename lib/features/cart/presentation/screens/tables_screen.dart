import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_app/features/cart/presentation/widgets/table_card.dart';
import 'package:restaurant_app/features/tables/presentation/presentation.dart';

class TablesScreen extends ConsumerWidget {
  const TablesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tablesState = ref.watch(tablesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tables'),
      ),
      body: Column(
        children: [
         
          const SizedBox(height: 10),
          Expanded(
            child: tablesState.when(
              error: (error, stacktrace) =>
                  Center(child: Text(error.toString())),
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (tables) => GridView.builder(
                itemCount: tables.length,
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (1 / 0.8),
                ),
                // Generate 100 widgets that display their index in the List.
                itemBuilder: (context, index) {
                  return TableCard(table: tables[index], onTap: (s){}, changeTable: (s){});
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
