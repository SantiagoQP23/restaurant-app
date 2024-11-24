import 'package:restaurant_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:restaurant_app/features/tables/domain/domain.dart';
import 'package:restaurant_app/features/tables/infraestructure/infraestructure.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tables_providers.g.dart';

@Riverpod(keepAlive: true)
TablesRepository tablesRepository(TablesRepositoryRef ref) {
  final accessToken = ref.watch(authProvider).token ?? '';

  final repository = TablesRepositoryImpl(
      dataSource: TablesDataSourceImpl(accessToken: accessToken));

  return repository;
}

// @riverpod
@Riverpod(keepAlive: true)
class Tables extends _$Tables {
  @override
  Future<List<TableEntity>> build() async {
    final repository = ref.watch(tablesRepositoryProvider);
    return repository.getTables();
  }
}
