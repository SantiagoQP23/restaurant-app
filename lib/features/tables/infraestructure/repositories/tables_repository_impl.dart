import 'package:restaurant_app/features/tables/domain/domain.dart';
// import 'package:restaurant_app/features/tables/infraestructure/datasources/tables_datasource_impl.dart';

class TablesRepositoryImpl implements TablesRepository {
  final TablesDataSource dataSource;

  TablesRepositoryImpl({required this.dataSource});
  // : dataSource = dataSource ?? TablesDatasourceImpl();

  @override
  Future<List<TableEntity>> getTables() async {
    return dataSource.getTables();
  }
}
