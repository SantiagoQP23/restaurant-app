import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';

class SelectTypeOrder extends StatefulWidget {
  final OrderType orderType;
  final ValueChanged<OrderType> onSelected;

  const SelectTypeOrder({
    super.key,
    required this.orderType,
    required this.onSelected,
  });

  @override
  State<SelectTypeOrder> createState() => _SelectTypeOrderState();
}

class _SelectTypeOrderState extends State<SelectTypeOrder> {
  final orderTypes = [OrderType.inPlace, OrderType.takeAway];
  OrderType selectedType = OrderType.inPlace;

  @override
  void initState() {
    super.initState();
    selectedType = widget.orderType;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      children: List<Widget>.of(
        orderTypes.map(
          (OrderType type) {
            return ChoiceChip(
              label: Text(type.name),
              selected: widget.orderType == type,
              onSelected: (bool selected) {
                if(widget.orderType != type) {
                  widget.onSelected(type);
                }
              
              },
            );
          },
        ),
      ),
    );
  }
}
