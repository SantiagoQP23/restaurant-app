import 'package:restaurant_app/features/orders/domain/entities/entities.dart';

abstract class BillsRepository {
  Future<List<Bill>> getBills();
  Future<Bill> getBill(int id);
}
