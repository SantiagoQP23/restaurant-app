import 'package:dio/dio.dart';
import 'package:restaurant_app/config/config.dart';
import 'package:restaurant_app/features/orders/domain/datasources/bills_datasource.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';
import 'package:restaurant_app/features/orders/infraestructura/models/bill_model.dart';

class BillsDatasourceImpl implements BillsDatasource {
  late final Dio dio;
  final String accessToken;

  BillsDatasourceImpl({required this.accessToken})
      : dio = Dio(BaseOptions(
          baseUrl: Environment.apiUrl,
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ));

  @override
  Future<List<Bill>> getBills() async {
    try {
      final response = await dio.get('/bills');
      final billList = response.data as List;
      final bills = billList.map((bill) {
        return BillModel.fromJson(bill).toEntity();
      }).toList();
      return bills;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Bill> getBill(int id) async {
    try {
      final response = await dio.get('/bills/$id');
      final data = response.data;
      final bill = BillModel.fromJson(data).toEntity();
      return bill;
    } catch (e) {
      throw Exception();
    }
  }
}
