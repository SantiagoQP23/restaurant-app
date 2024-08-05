import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:restaurant_app/features/orders/data/repository/orders_repository.dart';

// class HttpOrdersRepository implements OrdersRepository {
//   final dio = Dio();
//   HttpOrdersRepository({required this.client});

//   @override
//   Future<List<Order>> getOrders() async {
//     final response = await dio.get('https://api.com/orders');
//     if (response.statusCode == 200) {
//       final List<dynamic> ordersJson = jsonDecode(response.body);
//       return ordersJson.map((json) => Order.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load orders');
//     }
//   }
// }
