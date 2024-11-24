import 'package:restaurant_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:restaurant_app/features/cart/domain/entities/category.dart';
import 'package:restaurant_app/features/cart/domain/repositories/categories_repository.dart';
import 'package:restaurant_app/features/cart/infraestructura/datasources/categories_datasource_impl.dart';
import 'package:restaurant_app/features/cart/infraestructura/repositories/categories_repository_impl.dart';
import 'package:restaurant_app/features/cart/presentation/providers/sections_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_providers.g.dart';

// @riverpod 
@Riverpod(keepAlive: true)
CategoriesRepository categoriesRepository(CategoriesRepositoryRef ref) {
  final accessToken = ref.watch(authProvider).token ?? '';

  final repository = CategoriesRepositoryImpl(
      categoriesDatasource: CategoriesDatasourceImpl(accessToken: accessToken));
  return repository;
}

// @riverpod
@Riverpod(keepAlive: true)
class Categories extends _$Categories {
  @override
  Future<List<Category>> build() async {
    final repository = ref.watch(categoriesRepositoryProvider);
    return repository.getCategories();
  }
}

@Riverpod(keepAlive: true)
List<Category> categoriesByActiveSection (CategoriesByActiveSectionRef ref) {
    final section = ref.watch(activeSectionProvider);
    final categoriesState = ref.watch(categoriesProvider);
    final categories = categoriesState.value?.where((category) {
      return category.sectionId == section.id;
    });

    return categories != null ? categories.toList() : [];
}