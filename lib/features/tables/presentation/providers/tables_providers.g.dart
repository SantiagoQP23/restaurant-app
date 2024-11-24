// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tablesRepositoryHash() => r'a2062e4655b152ed16ba4880263f3d9191ebcc52';

/// See also [tablesRepository].
@ProviderFor(tablesRepository)
final tablesRepositoryProvider = Provider<TablesRepository>.internal(
  tablesRepository,
  name: r'tablesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tablesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TablesRepositoryRef = ProviderRef<TablesRepository>;
String _$tablesHash() => r'f2ce634be2f1c0bee2798c6b3fec3c2984d88e46';

/// See also [Tables].
@ProviderFor(Tables)
final tablesProvider =
    AsyncNotifierProvider<Tables, List<TableEntity>>.internal(
  Tables.new,
  name: r'tablesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tablesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Tables = AsyncNotifier<List<TableEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
