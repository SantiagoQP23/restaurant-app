// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bills_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$billsRepositoryHash() => r'd191d41c791f71247fa687f8ddb668e40ca7ef52';

/// See also [billsRepository].
@ProviderFor(billsRepository)
final billsRepositoryProvider = Provider<BillsRepository>.internal(
  billsRepository,
  name: r'billsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$billsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BillsRepositoryRef = ProviderRef<BillsRepository>;
String _$billByIdHash() => r'f15f2af98e682eae602471da846955a86e923adc';

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

abstract class _$BillById extends BuildlessAsyncNotifier<Bill> {
  late final int id;

  FutureOr<Bill> build(
    int id,
  );
}

/// See also [BillById].
@ProviderFor(BillById)
const billByIdProvider = BillByIdFamily();

/// See also [BillById].
class BillByIdFamily extends Family<AsyncValue<Bill>> {
  /// See also [BillById].
  const BillByIdFamily();

  /// See also [BillById].
  BillByIdProvider call(
    int id,
  ) {
    return BillByIdProvider(
      id,
    );
  }

  @override
  BillByIdProvider getProviderOverride(
    covariant BillByIdProvider provider,
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
  String? get name => r'billByIdProvider';
}

/// See also [BillById].
class BillByIdProvider extends AsyncNotifierProviderImpl<BillById, Bill> {
  /// See also [BillById].
  BillByIdProvider(
    int id,
  ) : this._internal(
          () => BillById()..id = id,
          from: billByIdProvider,
          name: r'billByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$billByIdHash,
          dependencies: BillByIdFamily._dependencies,
          allTransitiveDependencies: BillByIdFamily._allTransitiveDependencies,
          id: id,
        );

  BillByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  FutureOr<Bill> runNotifierBuild(
    covariant BillById notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(BillById Function() create) {
    return ProviderOverride(
      origin: this,
      override: BillByIdProvider._internal(
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
  AsyncNotifierProviderElement<BillById, Bill> createElement() {
    return _BillByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BillByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BillByIdRef on AsyncNotifierProviderRef<Bill> {
  /// The parameter `id` of this provider.
  int get id;
}

class _BillByIdProviderElement
    extends AsyncNotifierProviderElement<BillById, Bill> with BillByIdRef {
  _BillByIdProviderElement(super.provider);

  @override
  int get id => (origin as BillByIdProvider).id;
}

String _$paymentMethodBillHash() => r'234fa12ddc860d42dbb09e57b3055d8c349c1c63';

/// See also [PaymentMethodBill].
@ProviderFor(PaymentMethodBill)
final paymentMethodBillProvider =
    NotifierProvider<PaymentMethodBill, PaymentMethod>.internal(
  PaymentMethodBill.new,
  name: r'paymentMethodBillProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paymentMethodBillHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PaymentMethodBill = Notifier<PaymentMethod>;
String _$customerBillHash() => r'4ec8126fcbe462199d7f699299cf8936cd6b8735';

/// See also [CustomerBill].
@ProviderFor(CustomerBill)
final customerBillProvider = NotifierProvider<CustomerBill, Customer?>.internal(
  CustomerBill.new,
  name: r'customerBillProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$customerBillHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CustomerBill = Notifier<Customer?>;
String _$cashRegisterBillHash() => r'2a62edd4da4825cf21660eca96d000340a570c37';

/// See also [CashRegisterBill].
@ProviderFor(CashRegisterBill)
final cashRegisterBillProvider =
    NotifierProvider<CashRegisterBill, CashRegister?>.internal(
  CashRegisterBill.new,
  name: r'cashRegisterBillProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cashRegisterBillHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CashRegisterBill = Notifier<CashRegister?>;
String _$receivedAmountBillHash() =>
    r'89fdd3466ebb2a43f904c7668a9ed8f4fc78fee9';

/// See also [ReceivedAmountBill].
@ProviderFor(ReceivedAmountBill)
final receivedAmountBillProvider =
    NotifierProvider<ReceivedAmountBill, double>.internal(
  ReceivedAmountBill.new,
  name: r'receivedAmountBillProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$receivedAmountBillHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ReceivedAmountBill = Notifier<double>;
String _$discountBillHash() => r'd7ce357330f92f335f962dee9d187b280ef0bafa';

/// See also [DiscountBill].
@ProviderFor(DiscountBill)
final discountBillProvider = NotifierProvider<DiscountBill, double>.internal(
  DiscountBill.new,
  name: r'discountBillProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$discountBillHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DiscountBill = Notifier<double>;
String _$activeBillHash() => r'35d88dccf5f9c0a18c114c44f720b69e40c7aa6b';

/// See also [ActiveBill].
@ProviderFor(ActiveBill)
final activeBillProvider = NotifierProvider<ActiveBill, Bill?>.internal(
  ActiveBill.new,
  name: r'activeBillProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$activeBillHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveBill = Notifier<Bill?>;
String _$payBillDTOHash() => r'534b2b0f4cdd36ef160c6b1ad448a343f6ebc1b6';

/// See also [PayBillDTO].
@ProviderFor(PayBillDTO)
final payBillDTOProvider =
    NotifierProvider<PayBillDTO, UpdateBillDTO?>.internal(
  PayBillDTO.new,
  name: r'payBillDTOProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$payBillDTOHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PayBillDTO = Notifier<UpdateBillDTO?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
