import 'package:dio/dio.dart';
import 'package:restaurant_app/config/config.dart';
import 'package:restaurant_app/features/cart/domain/datasources/sections_datasources.dart';
import 'package:restaurant_app/features/cart/domain/entities/section.dart';
import 'package:restaurant_app/features/cart/infraestructura/models/section_model.dart';

class SectionsDatasourceImpl implements SectionsDatasource {
  late final Dio dio;
  final String accessToken;

  SectionsDatasourceImpl({required this.accessToken})
      : dio = Dio(BaseOptions(
          baseUrl: Environment.apiUrl,
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ));

  @override
  Future<List<Section>> getSections() async {
    try {
      final response = await dio.get('/sections');
      final sections = response.data as List;
      return sections.map((section) {
        final sectionModel = SectionModel.fromJson(section);
        return sectionModel.toEntity();
      }).toList();
    } on DioException catch (e) {
      throw Exception();
    }
  }
}

        // final tableModel = TableModel.fromJson(table);
        // return tableModel.toEntity();