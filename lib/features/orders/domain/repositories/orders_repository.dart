import 'package:restaurant_app/features/orders/domain/entities/entities.dart';

abstract class OrdersRepository {
  Future<List<Order>> getActiveOrders();

  Future<Order> getOrderById(String id);
}
