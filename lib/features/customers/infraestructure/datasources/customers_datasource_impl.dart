import 'package:dio/dio.dart';
import 'package:restaurant_app/config/config.dart';
import 'package:restaurant_app/features/customers/domain/datasources/customers_datasource.dart';
import 'package:restaurant_app/features/customers/domain/entities/customer.dart';
import 'package:restaurant_app/features/customers/domain/entities/dto/filter_customers_dto.dart';
import 'package:restaurant_app/features/customers/infraestructure/models/customer_model.dart';

class CustomersDatasourceImpl implements CustomersDatasource {
  late Dio dio;
  final String accessToken;

  CustomersDatasourceImpl({required this.accessToken}) {
    dio = Dio(BaseOptions(
      baseUrl: Environment.apiUrl,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    ));
  }
  @override
  Future<Customer> getCustomer(String id) async {
    try {
      final response = await dio.get('/clients/$id');
      final data = response.data;
      final customer = CustomerModel.fromJson(data).toEntity();
      return customer;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<Customer>> getCustomers(FilterCustomersDTO filters) async {
    try {
      final response = await dio.get('/clients', queryParameters: filters.toJson());
      final customerList = response.data["clients"] as List;


      final customers = customerList.map((customer) {
        final customerModel = CustomerModel.fromJson(customer);
        return customerModel.toEntity();
      }).toList();
      return customers;
    } catch (e) {
      throw Exception();
    }
  }
}
