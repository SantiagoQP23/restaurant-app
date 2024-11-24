import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/config/routes/app_router.dart';
import 'package:restaurant_app/features/home/presentation/widgets/order_list.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';

class OrdersScreen extends ConsumerWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('My orders'),
              actions: const [Text('Online')],
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Pending'),
                  Tab(text: 'In progress'),
                  Tab(text: 'Delivered'),
                  Tab(text: 'Canceled'),
                ],
                isScrollable: true,
                tabAlignment: TabAlignment.center,
              ),
            ),

            // drawer: const DrawerWidget(),
            body: TabBarView(
              children: [
                OrderList(),
                OrderList(status: OrderStatus.pending,),
                OrderList(status: OrderStatus.inProgress,),
                OrderList(status: OrderStatus.delivered,),
                OrderList(status: OrderStatus.cancelled,),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // context.push('/cart');
                ref.read(appRouterProvider).push('/cart');
                // context.read<Counter>().increment();
              },
              tooltip: 'Añadir nuevo',
              child: const Icon(Icons.shopping_cart),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: 0,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Business',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'School',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: Color(0xFF9E9E9E),
              showUnselectedLabels: true,
              // currentIndex: _selectedIndex,
              // onTap: _onItemTapped,
            )));
  }
}
