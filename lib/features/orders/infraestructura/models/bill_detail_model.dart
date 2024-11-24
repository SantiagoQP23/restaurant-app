
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_app/features/cart/infraestructura/models/models.dart';

import 'package:restaurant_app/features/orders/domain/entities/entities.dart';
import 'package:restaurant_app/features/orders/infraestructura/models/order_detail_model.dart';

part 'bill_detail_model.freezed.dart';
part 'bill_detail_model.g.dart';

@freezed
class BillDetailModel with _$BillDetailModel {
  const BillDetailModel._();
  const factory BillDetailModel({
    required int id,
    required int quantity,
    required double price,
    required double total,
     required String createdAt,
     required String updatedAt,
    required OrderDetailModel orderDetail,
  }) = _BillDetailModel;

  factory BillDetailModel.fromJson(Map<String, dynamic> json) =>
      _$BillDetailModelFromJson(json);

  BillDetail toEntity() => BillDetail(
        id: id.toString(),
        quantity: quantity,
        price: price,
        total: total,
        createdAt: DateTime.parse(createdAt),
        updatedAt: DateTime.parse(updatedAt),
        orderDetail: orderDetail.toEntity(),
      );
}

