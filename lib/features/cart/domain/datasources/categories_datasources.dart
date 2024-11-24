import 'package:restaurant_app/features/cart/domain/entities/category.dart';

abstract class CategoriesDatasource {
  Future<List<Category>> getCategories();
}