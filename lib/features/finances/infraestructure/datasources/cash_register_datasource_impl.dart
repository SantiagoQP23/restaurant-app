import 'package:dio/dio.dart';
import 'package:restaurant_app/config/config.dart';
import 'package:restaurant_app/features/finances/domain/datasources/cash_register_datasource.dart';
import 'package:restaurant_app/features/finances/domain/entities/cash_register.dart';
import 'package:restaurant_app/features/finances/infraestructure/models/cash_register_model.dart';

class CashRegisterDatasourceImpl implements CashRegisterDatasource {
  late final Dio dio;
  final String accessToken;

  CashRegisterDatasourceImpl({required this.accessToken})
      : dio = Dio(BaseOptions(
          baseUrl: Environment.apiUrl,
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ));

  @override
  Future<List<CashRegister>> getAllOpenCashRegister() async {
    try {
      final response = await dio.get('/cash-register/active');
      final cashRegister = response.data;
      final cashRegisterModel = CashRegisterModel.fromJson(cashRegister).toEntity();
      final cashRegisters = [cashRegisterModel];
      //       final cashRegisterList = response.data as List;
      // final cashRegisters = cashRegisterList.map((cashRegister) {
      //   final cashRegisterModel = CashRegisterModel.fromJson(cashRegister);
      //   return cashRegisterModel.toEntity();
      // }).toList();
      return cashRegisters;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
