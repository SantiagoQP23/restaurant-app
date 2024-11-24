import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/config/routes/app_router.dart';
import 'package:restaurant_app/config/routes/routes.dart';
import 'package:restaurant_app/core/websockets/socket_service.dart';
import 'package:restaurant_app/features/cart/presentation/providers/cart_providers.dart';
import 'package:restaurant_app/features/cart/presentation/providers/sections_providers.dart';
import 'package:restaurant_app/features/home/presentation/screens/home_screen.dart';
import 'package:restaurant_app/features/home/presentation/widgets/order_list.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';
import 'package:restaurant_app/features/orders/presentation/providers/orders_provider.dart';
import 'package:restaurant_app/features/shared/providers/socket_provider.dart';
import 'package:badges/badges.dart' as badges;

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  late SocketService socketService;
  int _currentIndex = 0;

  final List<PreferredSizeWidget> _appBarsScreen = [
    const AppBarHomeScreen(),
    const AppBarHomeScreen(),
    const AppBarHomeScreen(),
    const AppBarHomeScreen(),
  ];

  final List<Widget> _bodiesScreen = [
    const BodyHomeScreen(),
    const BodyHomeScreen(),
    const BodyHomeScreen(),
    const BodyHomeScreen(),
  ];

  @override
  void initState() {
    super.initState();
    socketService = ref.read(socketInstanceProvider);

    socketService.socket.on(SocketEvents.orderUpdated, (dynamic data) {
      ref.read(activeOrdersProvider.notifier).onUpdatedOrder(data);
      // print('Order updated: ${data.toString()}');
    });
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
            appBar: _appBarsScreen[_currentIndex],

            // drawer: const DrawerWidget(),
            body: _bodiesScreen[_currentIndex],
            floatingActionButton: _currentIndex != 0
                ? null
                : FloatingActionButton(
                    onPressed: () {
                      router.push(Routes.menu);

                      // context.read<Counter>().increment();
                    },
                    tooltip: 'Create a new order',
                    child: const Icon(Icons.shopping_cart),
                  ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              currentIndex: _currentIndex,
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
