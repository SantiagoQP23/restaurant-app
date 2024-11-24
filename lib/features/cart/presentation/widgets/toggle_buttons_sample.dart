import 'package:flutter/material.dart';
import 'package:restaurant_app/features/cart/presentation/screens/cart_screen.dart';

class ToggleButtonsSample extends StatefulWidget {
  const ToggleButtonsSample({super.key, required this.title});

  final String title;

  @override
  State<ToggleButtonsSample> createState() => _ToggleButtonsSampleState();
}

const List<Widget> options = <Widget>[
  Text('1'),
  Text('2'),
  Text('3'),
  Text('4'),
  Text('5'),
  // TextField()
];

class _ToggleButtonsSampleState extends State<ToggleButtonsSample> {
  final List<bool> _selectedFruits = <bool>[true, false, false, false, false];
  bool vertical = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // ToggleButtons with a single selection.
          Text('People', style: theme.textTheme.titleSmall),
          const SizedBox(height: 5),
          Row(
            children: [
              ToggleButtons(
                direction: vertical ? Axis.vertical : Axis.horizontal,
                onPressed: (int index) {
                  setState(() {
                    // The button that is tapped is set to true, and the others to false.
                    for (int i = 0; i < _selectedFruits.length; i++) {
                      _selectedFruits[i] = i == index;
                    }
                  });
                },
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                // selectedBorderColor: Colors.red[700],
                // selectedColor: Colors.white,
                // fillColor: Colors.red[200],
                // color: Colors.red[400],
                // constraints: const BoxConstraints(
                //   minHeight: 40.0,
                //   minWidth: 80.0,
                // ),
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