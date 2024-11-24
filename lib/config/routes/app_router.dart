import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/config/routes/app_router_notifier.dart';
import 'package:restaurant_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:restaurant_app/features/auth/presentation/screens/screens.dart';
import 'package:restaurant_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:restaurant_app/features/cart/presentation/screens/menu_screen.dart';
import 'package:restaurant_app/features/cart/presentation/screens/product_screen.dart';
import 'package:restaurant_app/features/cart/presentation/screens/tables_screen.dart';
import 'package:restaurant_app/features/home/presentation/screens/main_screen.dart';
import 'package:restaurant_app/features/orders/presentation/screens/order_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:restaurant_app/features/home/presentation/screens/home_screen.dart';

part 'app_router.g.dart';

class AppRoutes {
  static const splash = '/splash';
  static const login = '/login';
  static const home = '/home';
  static const cart = '/cart';
  static const product = '/product';
  static const menu = '/menu';
  static const tables = '/tables';
  static const orders = '/orders';
}

@Riverpod(keepAlive: true)
GoRouter appRouter(AppRouterRef ref) {
  final authentication = ref.watch(authProvider);
  return GoRouter(
    initialLocation: '/splash',
    // refreshListenable: authStatus,
    routes: [
      GoRoute(
          path: '/splash',
          builder: (context, state) => const CheckAuthStatusScreen()),
      GoRoute(
        path: '/',
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/cart',
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
          path: '/product', builder: (context, state) => const ProductScreen()),
      GoRoute(path: '/menu', builder: (context, state) => const MenuScreen()),
      GoRoute(
          path: '/tables', builder: (context, state) => const TablesScreen()),
      GoRoute(
          path: '/orders/:orderId',
          builder: (BuildContext context, GoRouterState state) {
            final orderId = state.pathParameters['orderId'] ?? '';
            return OrderScreen(id: orderId);
          }),
    ],
    redirect: (context, state) {
      final isGoingTo = state.matchedLocation;
      final authStatus = authentication.authStatus;

      if (isGoingTo == '/splash' && authStatus == AuthStatus.checking)
        return null;

      if (authStatus == AuthStatus.unauthenticated) {
        if (isGoingTo == '/login' || isGoingTo == '/register') return null;

        return '/login';
      }

      if (authStatus == AuthStatus.authenticated) {
        if (isGoingTo == '/login' ||
            isGoingTo == '/register' ||
            isGoingTo == '/splash') {
          return '/';
        }
      }

      // if(authStatus == AuthStatus.checking) {
      //   return '/splash';
      // }

      return null;
    },
  );
}
