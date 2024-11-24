import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/config/routes/app_router.dart';
import 'package:restaurant_app/config/routes/routes.dart';
import 'package:restaurant_app/core/websockets/socket_service.dart';
import 'package:restaurant_app/features/cart/domain/entities/new_order_detail.dart';
import 'package:restaurant_app/features/cart/presentation/providers/cart_providers.dart';
import 'package:restaurant_app/features/cart/presentation/providers/sections_providers.dart';
import 'package:restaurant_app/features/home/presentation/widgets/order_list.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';
import 'package:restaurant_app/features/orders/presentation/providers/orders_provider.dart';
import 'package:restaurant_app/features/shared/providers/socket_provider.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late SocketService socketService;

  @override
  void initState() {
    super.initState();
    socketService = ref.read(socketInstanceProvider);

    socketService.socket.on(SocketEvents.newOrder, handler);
  }

  void handler(dynamic data) {
    // final order = OrderModel.fromJson(data);
    // ref.read(orderDetailsProvider.notifier).addOrder(order);
    ref.read(activeOrdersProvider.notifier).addOrder(data);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(sectionsProvider);
    final orderDetails = ref.watch(orderDetailsProvider);
    final router = ref.watch(appRouterProvider);
    final text = socketService.serverStatus == ServerStatus.online
        ? 'Online'
        : 'Offline';
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: const AppBarHomeScreen(),

            // drawer: const DrawerWidget(),
            body: BodyHomeScreen(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                router.push(Routes.menu);

                // context.read<Counter>().increment();
              },
              tooltip: 'Create a new order',
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
              showSelectedLabels: true,
            )));
    // currentIndex: _selectedIndex,
    // onTap: _onItemTapped,

    //         ),

    //         );
    // )));
  }
}

class AppBarHomeScreen extends ConsumerWidget implements PreferredSizeWidget {
  const AppBarHomeScreen({super.key});

  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderDetails = ref.watch(orderDetailsProvider);
    final socketService = ref.watch(socketInstanceProvider);
    final textSocketStatus = socketService.serverStatus == ServerStatus.online
        ? 'Online'
        : 'Offline';
    return AppBar(
      title: const Text('My orders'),
      actions: [
        Text(textSocketStatus),
        badges.Badge(
          badgeContent: Text(orderDetails.length.toString()),
          child: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              context.push(Routes.cart);
            },
          ),
        ),
      ],
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
    );
  }
}

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        OrderList(),
        OrderList(status: OrderStatus.pending),
        OrderList(status: OrderStatus.inProgress),
        OrderList(status: OrderStatus.delivered),
        OrderList(status: OrderStatus.cancelled),
      ],
    );
  }
}
