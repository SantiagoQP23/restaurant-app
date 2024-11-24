// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ordersRepositoryHash() => r'7861856cf798b61452b11f4434b6d6c95c775a61';

/// See also [ordersRepository].
@ProviderFor(ordersRepository)
final ordersRepositoryProvider = Provider<OrdersRepository>.internal(
  ordersRepository,
  name: r'ordersRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ordersRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OrdersRepositoryRef = ProviderRef<OrdersRepository>;
String _$ordersHash() => r'4f6f55be9912b152aa92d4a6bea0c4431682211b';

/// See also [orders].
@ProviderFor(orders)
final ordersProvider = StreamProvider<List<Order>>.internal(
  orders,
  name: r'ordersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ordersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OrdersRef = StreamProviderRef<List<Order>>;
String _$activeOrderHash() => r'3c55a80636aa2c9ab643f8d0c72f069847ec341d';

/// See also [ActiveOrder].
@ProviderFor(ActiveOrder)
final activeOrderProvider = NotifierProvider<ActiveOrder, Order?>.internal(
  ActiveOrder.new,
  name: r'activeOrderProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$activeOrderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveOrder = Notifier<Order?>;
String _$activeOrdersHash() => r'2f6660d7798c80233cca489680ccbb699c896a8e';

/// See also [ActiveOrders].
@ProviderFor(ActiveOrders)
final activeOrdersProvider =
    AsyncNotifierProvider<ActiveOrders, List<Order>>.internal(
  ActiveOrders.new,
  name: r'activeOrdersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$activeOrdersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveOrders = AsyncNotifier<List<Order>>;
String _$orderByIdHash() => r'968dc9af56a62ce98f847ff3cb9496382fc10603';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$OrderById extends BuildlessAsyncNotifier<Order> {
  late final String id;

  FutureOr<Order> build(
    String id,
  );
}

/// See also [OrderById].
@ProviderFor(OrderById)
const orderByIdProvider = OrderByIdFamily();

/// See also [OrderById].
class OrderByIdFamily extends Family<AsyncValue<Order>> {
  /// See also [OrderById].
  const OrderByIdFamily();

  /// See also [OrderById].
  OrderByIdProvider call(
    String id,
  ) {
    return OrderByIdProvider(
      id,
    );
  }

  @override
  OrderByIdProvider getProviderOverride(
    covariant OrderByIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'orderByIdProvider';
}

/// See also [OrderById].
class OrderByIdProvider extends AsyncNotifierProviderImpl<OrderById, Order> {
  /// See also [OrderById].
  OrderByIdProvider(
    String id,
  ) : this._internal(
          () => OrderById()..id = id,
          from: orderByIdProvider,
          name: r'orderByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$orderByIdHash,
          dependencies: OrderByIdFamily._dependencies,
          allTransitiveDependencies: OrderByIdFamily._allTransitiveDependencies,
          id: id,
        );

  OrderByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  FutureOr<Order> runNotifierBuild(
    covariant OrderById notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(OrderById Function() create) {
    return ProviderOverride(
      origin: this,
      override: OrderByIdProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<OrderById, Order> createElement() {
    return _OrderByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OrderByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OrderByIdRef on AsyncNotifierProviderRef<Order> {
  /// The parameter `id` of this provider.
  String get id;
}

class _OrderByIdProviderElement
    extends AsyncNotifierProviderElement<OrderById, Order> with OrderByIdRef {
  _OrderByIdProviderElement(super.provider);

  @override
  String get id => (origin as OrderByIdProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
