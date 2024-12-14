import 'package:restaurant_app/features/customers/domain/datasources/customers_datasource.dart';
import 'package:restaurant_app/features/customers/domain/entities/customer.dart';
import 'package:restaurant_app/features/customers/domain/entities/dto/filter_customers_dto.dart';
import 'package:restaurant_app/features/customers/domain/repositories/customers_repository.dart';

class CustomersRepositoryImpl implements CustomersRepository {
  final CustomersDatasource datasource;

  CustomersRepositoryImpl({required this.datasource});

  @override
  Future<Customer> getCustomer(String id) async {
    return await datasource.getCustomer(id);
  }

  @override
  Future<List<Customer>> getCustomers(FilterCustomersDTO filters) async {
    return await datasource.getCustomers(filters);
  }
}
