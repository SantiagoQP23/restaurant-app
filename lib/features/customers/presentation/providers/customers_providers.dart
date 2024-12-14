import 'package:restaurant_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:restaurant_app/features/customers/domain/entities/customer.dart';
import 'package:restaurant_app/features/customers/domain/entities/dto/filter_customers_dto.dart';
import 'package:restaurant_app/features/customers/domain/repositories/customers_repository.dart';
import 'package:restaurant_app/features/customers/infraestructure/datasources/customers_datasource_impl.dart';
import 'package:restaurant_app/features/customers/infraestructure/repositories/customers_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customers_providers.g.dart';

@Riverpod(keepAlive: true)
CustomersRepository customersRepository(CustomersRepositoryRef ref) {
  final accessToken = ref.watch(authProvider).token ?? '';

  final repository = CustomersRepositoryImpl(
      datasource: CustomersDatasourceImpl(accessToken: accessToken));
  return repository;
}

@Riverpod(keepAlive: true)
class FilterCustomers extends _$FilterCustomers {
  @override
  FilterCustomersDTO build() {
    return FilterCustomersDTO();
  }

  void setFilters(FilterCustomersDTO filters) {
    state = filters;
  }
}

@Riverpod(keepAlive: true)
class Customers extends _$Customers {
  @override
  Future<List<Customer>> build() {
    final filters = ref.watch(filterCustomersProvider);
    final repository = ref.watch(customersRepositoryProvider);
    return repository.getCustomers(filters);
  }
}
