import 'package:restaurant_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:restaurant_app/features/finances/domain/entities/cash_register.dart';
import 'package:restaurant_app/features/finances/domain/repositories/cash_register_repository.dart';
import 'package:restaurant_app/features/finances/infraestructure/datasources/cash_register_datasource_impl.dart';
import 'package:restaurant_app/features/finances/infraestructure/repositories/cash_register_repository_impl.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cash_register_providers.g.dart';

@Riverpod(keepAlive: true)
CashRegisterRepository cashRegisterRepository(CashRegisterRepositoryRef ref) {
  final accessToken = ref.watch(authProvider).token ?? '';

  final repository = CashRegisterRepositoryImpl(
      CashRegisterDatasourceImpl(accessToken: accessToken));
  return repository;
}

@Riverpod()
class OpenCashRegisters extends _$OpenCashRegisters {
  @override
  Future<List<CashRegister>> build() async {
    final repository = ref.watch(cashRegisterRepositoryProvider);
    return repository.getAllOpenCashRegister();
  }
}
