// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$customersRepositoryHash() =>
    r'5b2a0745c6d9564d474a8ea15c225cebff2c7d61';

/// See also [customersRepository].
@ProviderFor(customersRepository)
final customersRepositoryProvider = Provider<CustomersRepository>.internal(
  customersRepository,
  name: r'customersRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$customersRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CustomersRepositoryRef = ProviderRef<CustomersRepository>;
String _$filterCustomersHash() => r'6907b502e01d0b2a908975d86a6541b7dfea9172';

/// See also [FilterCustomers].
@ProviderFor(FilterCustomers)
final filterCustomersProvider =
    NotifierProvider<FilterCustomers, FilterCustomersDTO>.internal(
  FilterCustomers.new,
  name: r'filterCustomersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filterCustomersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FilterCustomers = Notifier<FilterCustomersDTO>;
String _$customersHash() => r'e0021a60efea65e0490d4abf98ab4ccd5702f211';

/// See also [Customers].
@ProviderFor(Customers)
final customersProvider =
    AsyncNotifierProvider<Customers, List<Customer>>.internal(
  Customers.new,
  name: r'customersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$customersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Customers = AsyncNotifier<List<Customer>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
