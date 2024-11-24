import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_app/features/cart/presentation/providers/cart_providers.dart';
import 'package:restaurant_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';

class OrderTypeToggle extends ConsumerStatefulWidget {
  const OrderTypeToggle({super.key, required this.type});

  final OrderType type;

  @override
  _OrderTypeToggleState createState() => _OrderTypeToggleState();
}

const List<Widget> options = <Widget>[
  Text('Take away'),
  Text('Dine in'),
  // TextField()
];

const List<OrderType> orderTypes = <OrderType>[
  OrderType.takeAway,
  OrderType.inPlace,
];

class _OrderTypeToggleState extends ConsumerState<OrderTypeToggle> {
  final List<bool> _selectedFruits = <bool>[true, false];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    _selectedFruits[0] = widget.type == OrderType.takeAway;
    _selectedFruits[1] = widget.type == OrderType.inPlace;

    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // ToggleButtons with a single selection.
          Text('Order type', style: theme.textTheme.titleSmall),
          const SizedBox(height: 5),
          Row(
            children: [
              ToggleButtons(
                direction: Axis.horizontal,
                onPressed: (int index) {
                  final orderType = orderTypes[index];
                  ref
                      .read(orderTypeCartProvider.notifier)
                      .setOrderType(orderType);
                  // setState(() {
                  //   // The button that is tapped is set to true, and the others to false.
                  //   for (int i = 0; i < _selectedFruits.length; i++) {
                  //     _selectedFruits[i] = i == index;

                  //   }
                  // });
                },
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                // selectedBorderColor: Colors.red[700],
                // selectedColor: Colors.white,
                // fillColor: Colors.red[200],
                // color: Colors.red[400],
                constraints: BoxConstraints(
                    minHeight: 40.0,
                    minWidth: (MediaQuery.of(context).size.width - 36) / 4),
                // minWidth: 80.0,
                isSelected: _selectedFruits,
                children: options,
              ),
              // TextField(
              //   decoration: InputDecoration(
              //     hintText: 'People',
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10)),
              //   ),
              // ),
            ],
          ),

          // const SizedBox(height: 20),
        ]);
  }
}
