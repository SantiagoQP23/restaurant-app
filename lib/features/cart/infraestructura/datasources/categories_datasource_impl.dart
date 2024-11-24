import 'package:dio/dio.dart';
import 'package:restaurant_app/config/config.dart';
import 'package:restaurant_app/features/cart/domain/datasources/categories_datasources.dart';
import 'package:restaurant_app/features/cart/domain/entities/category.dart';
import 'package:restaurant_app/features/cart/infraestructura/models/category_model.dart';

class CategoriesDatasourceImpl implements CategoriesDatasource {
  late final Dio dio;
  final String accessToken;

  CategoriesDatasourceImpl({required this.accessToken})
      : dio = Dio(BaseOptions(
          baseUrl: Environment.apiUrl,
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ));

  @override
  Future<List<Category>> getCategories() async {
    try {
      final response = await dio.get('/categories');
      final data = response.data as List;
     final categories =  data.map((category) {
        final categoryModel = CategoryModel.fromJson(category);
        return categoryModel.toEntity();
      }).toList();
      return categories;
    } on DioException catch (e) {
      throw Exception();
    }
  }
}
