import 'package:restaurant_app/features/finances/domain/datasources/cash_register_datasource.dart';
import 'package:restaurant_app/features/finances/domain/entities/cash_register.dart';
import 'package:restaurant_app/features/finances/domain/repositories/cash_register_repository.dart';

class CashRegisterRepositoryImpl implements CashRegisterRepository {
  final CashRegisterDatasource dataSource;

  CashRegisterRepositoryImpl(this.dataSource);

  @override
  Future<List<CashRegister>> getAllOpenCashRegister() {
    return dataSource.getAllOpenCashRegister();
  }

}