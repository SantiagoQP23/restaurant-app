import 'package:restaurant_app/features/customers/domain/entities/customer.dart';
import 'package:restaurant_app/features/customers/domain/entities/dto/filter_customers_dto.dart';

abstract class CustomersRepository {
  Future<List<Customer>> getCustomers(FilterCustomersDTO filters);
  Future<Customer> getCustomer(String id);
}
