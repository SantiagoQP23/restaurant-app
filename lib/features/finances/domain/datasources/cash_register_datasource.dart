import 'package:restaurant_app/features/finances/domain/entities/cash_register.dart';

abstract class CashRegisterDatasource {
  Future<List<CashRegister>> getAllOpenCashRegister();
}