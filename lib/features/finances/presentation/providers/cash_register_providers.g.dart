// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_register_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cashRegisterRepositoryHash() =>
    r'9db710890ad0b1ba37743a544b0d68a420ad8650';

/// See also [cashRegisterRepository].
@ProviderFor(cashRegisterRepository)
final cashRegisterRepositoryProvider =
    Provider<CashRegisterRepository>.internal(
  cashRegisterRepository,
  name: r'cashRegisterRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cashRegisterRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CashRegisterRepositoryRef = ProviderRef<CashRegisterRepository>;
String _$openCashRegistersHash() => r'0c8752ee859a2c18a694963cc10570f6b4bd2b36';

/// See also [OpenCashRegisters].
@ProviderFor(OpenCashRegisters)
final openCashRegistersProvider = AutoDisposeAsyncNotifierProvider<
    OpenCashRegisters, List<CashRegister>>.internal(
  OpenCashRegisters.new,
  name: r'openCashRegistersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$openCashRegistersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OpenCashRegisters = AutoDisposeAsyncNotifier<List<CashRegister>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
