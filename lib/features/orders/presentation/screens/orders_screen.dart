import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/features/home/presentation/widgets/order_list.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('My orders'),
              actions: const [Text('Online')],
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'New'),
                  Tab(text: 'In progress'),
                  Tab(text: 'Delivered'),
                  Tab(text: 'Canceled'),
                  Tab(text: 'History'),
                ],
                isScrollable: true,
                tabAlignment: TabAlignment.center,
              ),
            ),

            // drawer: const DrawerWidget(),
            body: TabBarView(
              children: [
                OrderList(status: 'New'),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
                Icon(Icons.directions_bike),
                Icon(Icons.directions_bike),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.go('/cart');
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
