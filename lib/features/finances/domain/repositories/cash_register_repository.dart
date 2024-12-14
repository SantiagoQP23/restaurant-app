
import 'package:restaurant_app/features/finances/domain/entities/cash_register.dart';

abstract class CashRegisterRepository {
  Future<List<CashRegister>> getAllOpenCashRegister();
}