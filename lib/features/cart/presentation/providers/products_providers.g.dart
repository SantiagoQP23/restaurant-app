// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsByNameHash() => r'566895ab90f76f0c113f604080735cc209cc5698';

/// See also [productsByName].
@ProviderFor(productsByName)
final productsByNameProvider = Provider<List<Product>>.internal(
  productsByName,
  name: r'productsByNameProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsByNameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductsByNameRef = ProviderRef<List<Product>>;
String _$productNameHash() => r'ec88f54016d3e8bbfaea344e70bd8ed1071e22aa';

/// See also [ProductName].
@ProviderFor(ProductName)
final productNameProvider = NotifierProvider<ProductName, String>.internal(
  ProductName.new,
  name: r'productNameProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productNameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductName = Notifier<String>;
String _$activeProductHash() => r'89328428824355812a095deeb1c001d4383b4ea6';

/// See also [ActiveProduct].
@ProviderFor(ActiveProduct)
final activeProductProvider =
    NotifierProvider<ActiveProduct, Product?>.internal(
  ActiveProduct.new,
  name: r'activeProductProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeProductHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveProduct = Notifier<Product?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
