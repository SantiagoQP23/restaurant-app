import 'package:restaurant_app/features/orders/domain/entities/entities.dart';

abstract class BillsDatasource {
  Future<List<Bill>> getBills();
  Future<Bill> getBill(int id);
}