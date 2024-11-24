import 'package:dio/dio.dart';
import 'package:restaurant_app/config/config.dart';
import 'package:restaurant_app/features/tables/domain/domain.dart';
import 'package:restaurant_app/features/tables/infraestructure/models/table_model.dart';

class TablesDataSourceImpl extends TablesDataSource {
  late final Dio dio;
  final String accessToken;

  TablesDataSourceImpl({required this.accessToken})
      : dio = Dio(BaseOptions(
          baseUrl: Environment.apiUrl,
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ));

  // @override
  // Future<Table> getTable(String tableId) async {
  //   try {
  //     final response = await dio.get('/tables/$tableId');
  //     return Table.fromJson(response.data);
  //   } on DioError catch (e) {
  //     throw e.error;
  //   }
  // }

  @override
  Future<List<TableEntity>> getTables() async {
    try {
      final response = await dio.get('/tables');
      final tables = response.data as List;
      return tables.map((table) {
        final tableModel = TableModel.fromJson(table);
        return tableModel.toEntity();
      }).toList();
    } on DioException catch (e) {
      throw Exception();
    }
  }
}
