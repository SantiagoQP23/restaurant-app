import 'package:restaurant_app/features/orders/domain/datasources/orders_datasource.dart';
import 'package:restaurant_app/features/orders/domain/entities/order.dart';
import 'package:restaurant_app/features/orders/domain/repositories/orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersDataSource dataSource;

  OrdersRepositoryImpl({required this.dataSource});

  @override
  Future<List<Order>> getActiveOrders() {
    return dataSource.getActiveOrders();
  }

  @override
  Future<Order> getOrderById(String id) {
    return dataSource.getOrderById(id);
  }
}
