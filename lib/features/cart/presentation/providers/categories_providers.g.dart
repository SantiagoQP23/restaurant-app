// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoriesRepositoryHash() =>
    r'fe8aaad4709cff70dc762afa7eb773f269504652';

/// See also [categoriesRepository].
@ProviderFor(categoriesRepository)
final categoriesRepositoryProvider = Provider<CategoriesRepository>.internal(
  categoriesRepository,
  name: r'categoriesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoriesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CategoriesRepositoryRef = ProviderRef<CategoriesRepository>;
String _$categoriesByActiveSectionHash() =>
    r'ba2447dacc280572a0dc497d7edd013e6037f0a5';

/// See also [categoriesByActiveSection].
@ProviderFor(categoriesByActiveSection)
final categoriesByActiveSectionProvider = Provider<List<Category>>.internal(
  categoriesByActiveSection,
  name: r'categoriesByActiveSectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoriesByActiveSectionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CategoriesByActiveSectionRef = ProviderRef<List<Category>>;
String _$categoriesHash() => r'c810b665ce35d5a0160a4d950a59a253231abb9d';

/// See also [Categories].
@ProviderFor(Categories)
final categoriesProvider =
    AsyncNotifierProvider<Categories, List<Category>>.internal(
  Categories.new,
  name: r'categoriesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$categoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Categories = AsyncNotifier<List<Category>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
