import 'package:restaurant_app/features/orders/domain/datasources/bills_datasource.dart';
import 'package:restaurant_app/features/orders/domain/entities/bill.dart';
import 'package:restaurant_app/features/orders/domain/repositories/bills_repository.dart';

class BillsRepositoryImpl implements BillsRepository {
  final BillsDatasource datasource;

  BillsRepositoryImpl({required this.datasource});

  @override
  Future<Bill> getBill(int id) {
    return datasource.getBill(id);
  }

  @override
  Future<List<Bill>> getBills() {
    return datasource.getBills();
  }
}
