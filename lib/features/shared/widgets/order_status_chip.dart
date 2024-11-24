import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';


StatelessWidget orderStatusChip({
  required OrderStatus status,
}) {
const orderStatusMap = {
  OrderStatus.pending: Colors.orange,
  OrderStatus.inProgress: Colors.blue,
  OrderStatus.delivered: Colors.green,
  OrderStatus.cancelled: Colors.red,
};
  return Chip(
    backgroundColor: orderStatusMap[status]!.withOpacity(0.2),
    label: Text(StringUtils.capitalize(status.name)),
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color:  orderStatusMap[status],
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: const BorderSide(color: Colors.transparent),
      
    ),
  );
}