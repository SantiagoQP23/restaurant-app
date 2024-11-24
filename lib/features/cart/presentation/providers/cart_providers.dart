import 'package:restaurant_app/features/cart/domain/entities/new_order_detail.dart';
import 'package:restaurant_app/features/cart/infraestructura/models/create_order_detail_dto.dart';
import 'package:restaurant_app/features/cart/infraestructura/models/create_order_dto.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';
import 'package:restaurant_app/features/tables/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_providers.g.dart';

@Riverpod(keepAlive: true)
class TableOrder extends _$TableOrder {
  @override
  TableEntity? build() {
    return null;
  }

  void setTableOrder(TableEntity table) {
    state = table;
  }
}

@Riverpod(keepAlive: true)
class OrderGuests extends _$OrderGuests {
  @override
  int build() {
    return 1;
  }

  void setOrderGuests(int guests) {
    state = guests;
  }
}

@Riverpod(keepAlive: true)
class OrderNotes extends _$OrderNotes {
  @override
  String build() {
    return '';
  }

  void setOrderNotes(String notes) {
    state = notes;
  }
}

@Riverpod(keepAlive: true)
class OrderTypeCart extends _$OrderTypeCart {
  @override
  OrderType build() {
    return OrderType.inPlace;
  }

  void setOrderType(OrderType orderType) {
    state = orderType;
  }
}

@Riverpod(keepAlive: true)
class OrderDetails extends _$OrderDetails {
  @override
  List<NewOrderDetail> build() {
    return [];
  }

  void addOrderDetail(NewOrderDetail orderDetail) {
    state = [...state, orderDetail];
  }

  void removeOrderDetail(NewOrderDetail orderDetail) {
    state = state.where((element) => element != orderDetail).toList();
  }

  void clearOrderDetails() {
    state = [];
  }

  void updateOrderDetail(NewOrderDetail orderDetail) {
    state = state
        .map((e) => e.product.id == orderDetail.product.id ? orderDetail : e)
        .toList();
  }
}

@riverpod
double totalCart(TotalCartRef ref) {
  final orderDetails = ref.watch(orderDetailsProvider);
  return orderDetails.fold(
      0,
      (previousValue, element) =>
          previousValue + element.product.price * element.quantity);
}

@Riverpod(keepAlive: true)
CreateOrderDto createOrderDto(CreateOrderDtoRef ref) {
  final table = ref.watch(tableOrderProvider);
  final orderType = ref.watch(orderTypeCartProvider);
  final orderDetails = ref.watch(orderDetailsProvider);
  final guests = ref.watch(orderGuestsProvider);
  final notes = ref.watch(orderNotesProvider);
  return CreateOrderDto(
      details: orderDetails
          .map((orderDetail) => CreateOrderDetailDto(
              description: orderDetail.note,
              productId: orderDetail.product.id,
              quantity: orderDetail.quantity,
              price: orderDetail.product.price))
          .toList(),
      tableId: table?.id,
      typeOrder: orderType,
      notes: notes,
      people: guests);
}
