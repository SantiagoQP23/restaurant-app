import 'package:restaurant_app/features/cart/domain/datasources/categories_datasources.dart';
import 'package:restaurant_app/features/cart/domain/entities/category.dart';
import 'package:restaurant_app/features/cart/domain/repositories/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesDatasource categoriesDatasource;

  CategoriesRepositoryImpl({required this.categoriesDatasource});

  @override
  Future<List<Category>> getCategories() {
    return categoriesDatasource.getCategories();
  }

}