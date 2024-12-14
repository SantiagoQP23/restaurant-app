import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';

StatelessWidget orderStatusChip({
  required OrderStatus status,
}) {
  const orderStatusMapColor = {
    OrderStatus.pending: Colors.orange,
    OrderStatus.inProgress: Colors.blue,
    OrderStatus.delivered: Colors.green,
    OrderStatus.cancelled: Colors.red,
  };

  const orderStatusMapText = {
    OrderStatus.pending: 'PENDING',
    OrderStatus.inProgress: 'IN PROGRESS',
    OrderStatus.delivered: 'DELIVERED',
    OrderStatus.cancelled: 'CANCELLED',
  };

  return Chip(
    backgroundColor: orderStatusMapColor[status]!.withOpacity(0.2),
    label: Text(
      StringUtils.capitalize(orderStatusMapText[status]!),
    ),
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: orderStatusMapColor[status],
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: const BorderSide(color: Colors.transparent),
    ),
  );
}
