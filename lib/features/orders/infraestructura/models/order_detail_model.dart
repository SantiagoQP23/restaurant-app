import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_app/features/cart/infraestructura/models/product_model.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';

part 'order_detail_model.freezed.dart';
part 'order_detail_model.g.dart';

@freezed
class OrderDetailModel with _$OrderDetailModel {
  const OrderDetailModel._();

  factory OrderDetailModel({
    required String id,
    required double quantity,
    required double price,
    required double qtyDelivered,
    required double amount,
    required String description,
    required String createdAt,
    required String updatedAt,
    required bool isActive,
    required ProductModel product,
  }) = _OrderDetailModel;

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailModelFromJson(json);

  OrderDetail toEntity() => OrderDetail(
        id: id,
        quantity: quantity,
        price: price,
        qtyDelivered: qtyDelivered,
        amount: amount,
        description: description,
        createdAt: DateTime.parse(createdAt),
        updatedAt: DateTime.parse(updatedAt),
        isActive: isActive,
        product: product.toEntity(),
      );
}
