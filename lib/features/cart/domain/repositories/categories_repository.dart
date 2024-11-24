import 'package:restaurant_app/features/cart/domain/entities/category.dart';

abstract class CategoriesRepository {
  Future<List<Category>> getCategories();
}