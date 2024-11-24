import 'package:dio/dio.dart';
import 'package:restaurant_app/config/config.dart';
import 'package:restaurant_app/features/orders/domain/datasources/orders_datasource.dart';
import 'package:restaurant_app/features/orders/domain/entities/order.dart';
import 'package:restaurant_app/features/orders/infraestructura/models/order_model.dart';

class OrdersDatasourceImpl implements OrdersDataSource {
  late final Dio dio;
  final String accessToken;

  OrdersDatasourceImpl({required this.accessToken})
      : dio = Dio(BaseOptions(
          baseUrl: Environment.apiUrl,
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ));

  @override
  Future<List<Order>> getActiveOrders() async {
    try {
      final response = await dio.get('/orders/actives');
      final orderList = response.data as List;
      // final orderList = data['orders'] as List;
      final orders = orderList.map((order) {
        final orderModel = OrderModel.fromJson(order);
        return orderModel.toEntity();
      }).toList();
      return orders;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Order> getOrderById(String id) async {
    try {
      final response = await dio.get('/orders/$id');
      final data = response.data;
      final order = OrderModel.fromJson(data).toEntity();
      return order;
    } catch (e) {
      throw Exception();
    }
  }

  // @override
  // Future<void> createOrder(OrderModel order) async {
  //   await _firestore.collection('orders').add(order.toJson());
  // }

  // @override
  // Future<List<OrderModel>> getOrders() async {
  //   final snapshot = await _firestore.collection('orders').get();
  //   return snapshot.docs.map((doc) => OrderModel.fromJson(doc.data())).toList();
  // }
}
