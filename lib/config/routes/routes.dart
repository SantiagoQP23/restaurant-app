import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/core/widgets/bottom_navigation_page.dart';
import 'package:restaurant_app/features/auth/presentation/screens/login_screen.dart';
import 'package:restaurant_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:restaurant_app/features/cart/presentation/screens/product_screen.dart';
import 'package:restaurant_app/features/home/presentation/screens/home_screen.dart';
import 'package:restaurant_app/features/cart/presentation/screens/menu_screen.dart';
import 'package:restaurant_app/features/cart/presentation/screens/tables_screen.dart';
import 'package:restaurant_app/features/orders/presentation/screens/bill_screen.dart';
import 'package:restaurant_app/features/orders/presentation/screens/checkout_screen.dart';
import 'package:restaurant_app/features/orders/presentation/screens/new_bill_screen.dart';
import 'package:restaurant_app/features/orders/presentation/screens/order_screen.dart';
import 'package:restaurant_app/features/orders/presentation/screens/orders_screen.dart';

class Routes {
  static const String orders = '/orders';
  static const String home = '/home';
  static const String order = '/order';
  static const String homeOrder = home + order;
  static const String cart = '/cart';
  static const String menu = '/menu';
  static const String product = '/product';
  static const String login = '/login';
  static const String bill = '/bill';
  static const String checkout = '/checkout';
  static const String tables = '/tables';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeTabNavigatorKey = GlobalKey<NavigatorState>();
final _profileTabNavigatorKey = GlobalKey<NavigatorState>();

const loginPath = '/login';
const registerPath = '/register';
//tabs kesy

//pages paths
const profilePath = '/profile';
const profileChangePasswordPath = '/change-password';
const homePath = '/home';

final authRouter = GoRouter(
  initialLocation: '/login',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: loginPath,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: LoginScreen()),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: registerPath,
      // builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
Page getPage({
  required Widget child,
  required GoRouterState state,
}) {
  return MaterialPage(
    key: state.pageKey,
    child: child,
  );
}

GoRoute orderRoute = GoRoute(
    path: 'order',
    builder: (context, state) => const OrderScreen(id: '',),
    routes: [
      GoRoute(
          path: 'new-bill',
          builder: (context, state) => const NewBillScreen(),
          routes: [
            // GoRoute(
            //     path: 'bill',
            //     builder: (context, state) => const BillScreen(),
            //     routes: [
            //       GoRoute(
            //         path: 'checkout',
            //         builder: (context, state) => const CheckoutScreen(),
            //       ),
            //     ])
          ]),
      // GoRoute(path: 'bill', builder: (context, state) => const BillScreen()),
    ]);

// GoRouter configuration
final GoRouter router = GoRouter(
    redirect: (BuildContext context, GoRouterState state) {
      // final isAuthenticated = true;
      // if (!isAuthenticated) {
      //   return '/login';
      // } else {
      //   return null;
      // }
    },
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
          routes: [
            StatefulShellRoute.indexedStack(
              parentNavigatorKey: _rootNavigatorKey,
              branches: [
                StatefulShellBranch(
                  navigatorKey: _homeTabNavigatorKey,
                  routes: [
                    GoRoute(
                      path: homePath,
                      pageBuilder: (context, GoRouterState state) {
                        return getPage(
                          child: const HomeScreen(),
                          state: state,
                        );
                      },
                    ),
                  ],
                ),
                StatefulShellBranch(
                  navigatorKey: _profileTabNavigatorKey,
                  routes: [
                    GoRoute(
                      path: profilePath,
                      pageBuilder: (context, state) {
                        return getPage(
                          child: const OrdersScreen(),
                          state: state,
                        );
                      },
                    ),
                    GoRoute(
                      path: profileChangePasswordPath,
                      pageBuilder: (context, state) {
                        return getPage(
                          child: const HomeScreen(),
                          state: state,
                        );
                      },
                    ),
                  ],
                ),
              ],
              pageBuilder: (
                BuildContext context,
                GoRouterState state,
                StatefulNavigationShell navigationShell,
              ) {
                return getPage(
                  child: BottomNavigationPage(
                    child: navigationShell,
                  ),
                  state: state,
                );
              },
            ),
            // GoRoute(
            //     path: '/',
            //     builder: (context, state) => const HomeScreen(),
            //     routes: [orderRoute]),
            // GoRoute(
            //     path: '/orders',
            //     builder: (context, state) => const OrdersScreen(),
            //     routes: [orderRoute]),
            // GoRoute(
            //     path: '/cart',
            //     builder: (context, state) => const TablesScreen(),
            //     routes: [
            //       GoRoute(
            //           path: 'menu',
            //           builder: (context, state) => const MenuScreen(),
            //           routes: [
            //             GoRoute(
            //                 path: 'cart',
            //                 builder: (context, state) => const CartScreen()),
            //             GoRoute(
            //                 path: 'product',
            //                 builder: (context, state) => const ProductScreen()),
            //           ]),
            //     ]),
            // GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
          ])
    ]);
