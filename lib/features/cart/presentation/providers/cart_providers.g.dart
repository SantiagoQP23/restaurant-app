// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$totalCartHash() => r'f1072b17860020e7f7c63ab40aaccb8115060ece';

/// See also [totalCart].
@ProviderFor(totalCart)
final totalCartProvider = AutoDisposeProvider<double>.internal(
  totalCart,
  name: r'totalCartProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$totalCartHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TotalCartRef = AutoDisposeProviderRef<double>;
String _$tableOrderHash() => r'2ba40d0337504e10bbc00216165cf0aa1ec4375a';

/// See also [TableOrder].
@ProviderFor(TableOrder)
final tableOrderProvider = NotifierProvider<TableOrder, TableEntity?>.internal(
  TableOrder.new,
  name: r'tableOrderProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tableOrderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TableOrder = Notifier<TableEntity?>;
String _$orderGuestsHash() => r'cb75f7cbbd9b286dc1d397869da59abcfdf44f19';

/// See also [OrderGuests].
@ProviderFor(OrderGuests)
final orderGuestsProvider = NotifierProvider<OrderGuests, int>.internal(
  OrderGuests.new,
  name: r'orderGuestsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$orderGuestsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OrderGuests = Notifier<int>;
String _$orderNotesHash() => r'2cd6ada523e77fb2ca2e908e33a302f6fdfdaa07';

/// See also [OrderNotes].
@ProviderFor(OrderNotes)
final orderNotesProvider = NotifierProvider<OrderNotes, String>.internal(
  OrderNotes.new,
  name: r'orderNotesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$orderNotesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OrderNotes = Notifier<String>;
String _$orderTypeCartHash() => r'9c53fd2142a3060a3d47e1efabe9d99b5c617c55';

/// See also [OrderTypeCart].
@ProviderFor(OrderTypeCart)
final orderTypeCartProvider =
    NotifierProvider<OrderTypeCart, OrderType>.internal(
  OrderTypeCart.new,
  name: r'orderTypeCartProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$orderTypeCartHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OrderTypeCart = Notifier<OrderType>;
String _$orderDetailsHash() => r'6d9fdcbf56b0499b68b19803ef6e58ebd9cb3a92';

/// See also [OrderDetails].
@ProviderFor(OrderDetails)
final orderDetailsProvider =
    NotifierProvider<OrderDetails, List<NewOrderDetail>>.internal(
  OrderDetails.new,
  name: r'orderDetailsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$orderDetailsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OrderDetails = Notifier<List<NewOrderDetail>>;
String _$createOrderDtoDataHash() =>
    r'a14f9aa3247fb724207cc85b87fd51e7d164cfa1';

/// See also [CreateOrderDtoData].
@ProviderFor(CreateOrderDtoData)
final createOrderDtoDataProvider =
    NotifierProvider<CreateOrderDtoData, CreateOrderDto>.internal(
  CreateOrderDtoData.new,
  name: r'createOrderDtoDataProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$createOrderDtoDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CreateOrderDtoData = Notifier<CreateOrderDto>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
