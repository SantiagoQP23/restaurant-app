import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:restaurant_app/core/websockets/socket_service.dart';
import 'package:restaurant_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:restaurant_app/features/cart/infraestructura/models/create_order_dto.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';
import 'package:restaurant_app/features/orders/domain/repositories/orders_repository.dart';
import 'package:restaurant_app/features/orders/infraestructura/datasources/orders_datasource_impl.dart';
import 'package:restaurant_app/features/orders/infraestructura/models/order_model.dart';
import 'package:restaurant_app/features/orders/infraestructura/models/update_order_dto.dart';
import 'package:restaurant_app/features/orders/infraestructura/repository/orders_repository_impl.dart';
import 'package:restaurant_app/features/shared/infraestructure/models/socket_event_mapper.dart';
import 'package:restaurant_app/features/shared/infraestructure/services/toast_service.dart';
import 'package:restaurant_app/features/shared/infraestructure/services/toast_service_imp.dart';
import 'package:restaurant_app/features/shared/providers/socket_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'orders_provider.g.dart';

@Riverpod(keepAlive: true)
OrdersRepository ordersRepository(OrdersRepositoryRef ref) {
  final accessToken = ref.watch(authProvider).token ?? '';

  final repository = OrdersRepositoryImpl(
      dataSource: OrdersDatasourceImpl(accessToken: accessToken));
  return repository;
}

@Riverpod(keepAlive: true)
class ActiveOrder extends _$ActiveOrder {
  @override
  Order? build() {
    return null;
  }

  void setActiveOrder(Order order) {
    state = order;
  }

  void clearActiveOrder() {
    state = null;
  }
}

@Riverpod(keepAlive: true)
Stream<List<Order>> orders(OrdersRef ref) async* {
  final socketService = ref.watch(socketInstanceProvider);
  final toast = ToastServiceImpl();
  final StreamController<List<Order>> controller =
      StreamController<List<Order>>();
  final orders = ref.watch(activeOrdersProvider).value ?? [];
  socketService.socket.on(SocketEvents.orderUpdated, (data) async* {
    final socketEvent = SocketEventMapper.fromJson(data);
    final order = OrderModel.fromJson(socketEvent.data);
    log('Order updated: ${data.toString()}');
    toast.show(socketEvent.msg, ToastType.success);
    final newOrders = orders.map((e) {
      if (e.id == order.id) {
        return order;
      }
      return e;
    }).toList();

    yield newOrders;

    // controller.add(order);
    // yield controller.stream;
    // return controller.stream;
  });
  controller.add(orders);
  yield* controller.stream;

  // await for (final value in controller.stream) {
  //   log('stream value => ${value.toString()}');
  //   yield value;
  // }
}

@Riverpod(keepAlive: true)
class ActiveOrders extends _$ActiveOrders {
  @override
  Future<List<Order>> build() async {
    final repository = ref.watch(ordersRepositoryProvider);
    return repository.getActiveOrders();
  }

  void onNewOrder(dynamic data) {
    // final socketService = ref.watch(socketInstanceProvider);
    final msg = data['msg'];
    final toast = ToastServiceImpl();
    toast.show(msg, ToastType.success);
  }

  void onUpdatedOrder(dynamic data) {
    final msg = data['msg'];
    final toast = ToastServiceImpl();
    toast.show(msg, ToastType.success);
    final orderModel = OrderModel.fromJson(data['data']);
    updateOrder(orderModel.toEntity());
  }

  void updateOrder(Order updatedOrder) {
    final activeOrder = ref.read(orderByIdProvider(updatedOrder.id).notifier);
    activeOrder.setOrder(updatedOrder);
    final currentOrders = state.asData?.value ?? [];
    final newState = [
      ...currentOrders
          .map((order) => order.id == updatedOrder.id ? updatedOrder : order)
    ];
    state = AsyncValue.data(newState);
  }

  void addOrder(CreateOrderDto newOrder) {
    final socketService = ref.watch(socketInstanceProvider);
    final toast = ToastServiceImpl();
    socketService.socket.emitWithAck('create-order', newOrder.toJson(),
        ack: (data) {
      final socketResponse = SocketEventMapper.fromJson(data);
      if (socketResponse.ok) {
        toast.show(socketResponse.msg, ToastType.success);
      } else {
        toast.show(socketResponse.msg, ToastType.error);
      }
    });
  }

  void emitUpdateOrder(UpdateOrderDto updateOrder) {
    final socketService = ref.watch(socketInstanceProvider);
    final toast = ToastServiceImpl();
    socketService.socket.emitWithAck('update-order', updateOrder.toJson(),
        ack: (data) {
      final socketResponse = SocketEventMapper.fromJson(data);
      if (socketResponse.ok) {
        toast.show(socketResponse.msg, ToastType.success);
      } else {
        toast.show(socketResponse.msg, ToastType.error);
      }
    });
  }
}

// @Riverpod(keepAlive: true)
// Future<Order> orderById(OrderByIdRef ref, String id) async {
//   final repository = ref.watch(ordersRepositoryProvider);
//   return repository.getOrderById(id);
// }

@Riverpod(keepAlive: true)
class OrderById extends _$OrderById{
  @override
  Future<Order> build(String id) async {
    final repository = ref.watch(ordersRepositoryProvider);
    return repository.getOrderById(id);
  }

  setOrder(Order order) {
    state = AsyncValue.data(order);
  }

  void clearOrder() {
    state = const AsyncValue.loading();
  }
}
