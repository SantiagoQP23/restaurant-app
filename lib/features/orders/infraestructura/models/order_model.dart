import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_app/features/auth/infraestructure/models/user_model.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';
import 'package:restaurant_app/features/orders/infraestructura/models/bill_model.dart';
import 'package:restaurant_app/features/tables/infraestructure/infraestructure.dart';
import 'order_detail_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const OrderModel._();
  const factory OrderModel({
    required String id,
    @JsonKey(name: 'num')
    required int number,
    required String notes,
    required String deliveryTime,
    required String type,
    required bool isPaid,
    required bool isClosed,
    required int people,

    required double total,
    required String createdAt,
    required String updatedAt,
     @Default(null)
     TableModel? table,
    required UserModel user,
    required String status,
    required List<OrderDetailModel> details,
    @Default([])
    List<BillModel>? bills,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Order toEntity() => Order(
        id: id,
        number: number,
        notes: notes,
        deliveryTime: DateTime.parse(deliveryTime),
        type: type == 'TAKE_AWAY' ? OrderType.takeAway : OrderType.inPlace,
        people: people,
        isPaid: isPaid,
        isClosed: isClosed,
        total: total,
        createdAt: DateTime.parse(createdAt),
        updatedAt: DateTime.parse(updatedAt),
        table:  table?.toEntity(),
        waiter: user.toEntity(),
        status: status == 'PENDING'
            ? OrderStatus.pending
            : status == 'IN_PROGRESS'
                ? OrderStatus.inProgress
                : status == 'DELIVERED'
                    ? OrderStatus.delivered
                    : OrderStatus.cancelled,
        details: details.map((e) => e.toEntity()).toList(),
        bills: bills?.map((e) => e.toEntity()).toList() ?? [],
      );
}
