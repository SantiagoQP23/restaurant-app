import 'package:restaurant_app/features/cart/infraestructura/models/create_order_detail_dto.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';

class CreateOrderDto {
  String? tableId;
  num people;
  OrderType typeOrder;
  String notes;
  List<CreateOrderDetailDto> details;
  CreateOrderDto({
    this.tableId,
    required this.people,
    required this.typeOrder,
    required this.notes,
    required this.details,
  }) {}

  Map<String, dynamic> toJson() {
    return {
      'tableId': tableId,
      'people': people,
      'typeOrder': typeOrder == OrderType.inPlace ? 'IN_PLACE' : 'TAKE_AWAY',
      'notes': notes,
      'details': details.map((e) => e.toJson()).toList(),
    };
  }
}
