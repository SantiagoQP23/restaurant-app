import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/config/routes/routes.dart';
import 'package:restaurant_app/core/widgets/bottom_navigation_page.dart';
import 'package:restaurant_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:restaurant_app/features/cart/presentation/screens/menu_screen.dart';
import 'package:restaurant_app/features/cart/presentation/screens/product_screen.dart';
import 'package:restaurant_app/features/cart/presentation/screens/tables_screen.dart';
import 'package:restaurant_app/features/home/presentation/screens/home_screen.dart';
import 'package:restaurant_app/features/orders/presentation/screens/bill_screen.dart';
import 'package:restaurant_app/features/orders/presentation/screens/checkout_screen.dart';
import 'package:restaurant_app/features/orders/presentation/screens/new_bill_screen.dart';
import 'package:restaurant_app/features/orders/presentation/screens/order_screen.dart';

class CustomNavigationHelper {
  static final CustomNavigationHelper _instance =
      CustomNavigationHelper._internal();

  static CustomNavigationHelper get instance => _instance;

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> homeTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> searchTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> settingsTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> ordersTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> cartTabNavigatorKey =
      GlobalKey<NavigatorState>();

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  static const String signUpPath = '/signUp';
  static const String signInPath = '/signIn';
  static const String detailPath = '/detail';
  static const String rootDetailPath = '/rootDetail';

  static const String homePath = '/home';
  static const String settingsPath = '/settings';
  static const String searchPath = '/search';
  static const String ordersPath = '/orders';
  static const String cartPath = '/cart';

  factory CustomNavigationHelper() {
    return _instance;
  }

  CustomNavigationHelper._internal() {
    final routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: homeTabNavigatorKey,
            routes: [
              GoRoute(
                path: homePath,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const HomeScreen(),
                    state: state,
                  );
                },
                // routes: [orderRoute]
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: ordersTabNavigatorKey,
            routes: [
              GoRoute(
                path: Routes.orders,
                pageBuilder: (context, state) {
                  return getPage(
                    child: const HomeScreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: cartTabNavigatorKey,
            routes: [
              GoRoute(
                path: cartPath,
                pageBuilder: (context, state) {
                  return getPage(
                    child: const CartScreen(),
                    state: state,
                  );
                },
                routes: [
                  GoRoute(
                      path: 'menu',
                      builder: (context, state) => const MenuScreen(),
                      routes: [
                        GoRoute(
                            path: 'cart',
                            builder: (context, state) => const CartScreen()),
                        GoRoute(
                            path: 'product',
                            builder: (context, state) => const ProductScreen()),
                      ]),
                ]
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: settingsTabNavigatorKey,
            routes: [
              GoRoute(
                path: settingsPath,
                pageBuilder: (context, state) {
                  return getPage(
                    child: const OrderScreen(),
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
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: '/order',
        pageBuilder: (context, state) {
          return getPage(
            child: const OrderScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: signUpPath,
        pageBuilder: (context, state) {
          return getPage(
            child: const BillScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: signInPath,
        pageBuilder: (context, state) {
          return getPage(
            child: const CheckoutScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        path: detailPath,
        pageBuilder: (context, state) {
          return getPage(
            child: const OrderScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: rootDetailPath,
        pageBuilder: (context, state) {
          return getPage(
            child: const NewBillScreen(),
            state: state,
          );
        },
      ),
    ];

    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: homePath,
      routes: routes,
    );
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
