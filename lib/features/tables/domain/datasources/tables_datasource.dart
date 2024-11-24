
import 'package:restaurant_app/features/tables/domain/entities/table.dart';

abstract class TablesDataSource {
  Future<List<TableEntity>> getTables();
}