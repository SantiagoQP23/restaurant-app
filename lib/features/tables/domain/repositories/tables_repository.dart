import 'package:restaurant_app/features/tables/domain/entities/table.dart';

abstract class TablesRepository {
  Future<List<TableEntity>> getTables();
}