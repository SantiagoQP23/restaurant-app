import 'package:restaurant_app/features/orders/infraestructura/models/bill_detail_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:restaurant_app/features/orders/domain/entities/entities.dart';

part 'bill_model.freezed.dart';
part 'bill_model.g.dart';


@freezed
class BillModel with _$BillModel {
  const BillModel._();
  const factory BillModel({
    required int id,
    @JsonKey(name: 'num')
    required String number,
    required String comments,
    required String paymentMethod,
    required double receivedAmount,
    required double change,
    required double subtotal,
    required double total,
    required double discount,
    required bool isPaid,
    required String createdAt,
    required String updatedAt,
    required bool isActive,
    required List<BillDetailModel> details,
  }) = _BillModel;

  factory BillModel.fromJson(Map<String, dynamic> json) =>
      _$BillModelFromJson(json);

  Bill toEntity() => Bill(
        id: id,
        number: number,
        comments: comments,
        paymentMethod: paymentMethod == 'CASH'
            ? PaymentMethod.cash
            : paymentMethod == 'CARD'
                ? PaymentMethod.card
                : PaymentMethod.transfer,
        receivedAmount: receivedAmount,
        change: change,
        subtotal: subtotal,
        total: total,
        discount: discount,
        isPaid: isPaid,
        createdAt: DateTime.parse(createdAt),
        updatedAt: DateTime.parse(updatedAt),
        isActive: isActive,
        details: details.map((e) => e.toEntity()).toList(),
      );

}

