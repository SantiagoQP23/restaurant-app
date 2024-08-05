import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text('Cart items'),
              ProductItem(),
              ProductItem(),
              ProductItem(),
              ProductItem(),
              ProductItem(),
              ProductItem(),
              SizedBox(
                height: 110,
                width: 0,
              ),
            ],
          )),
      bottomSheet: Container(
          padding: const EdgeInsets.all(20),
          height: 105,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Total: '),
                  Text('\$100'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: double.infinity,
                  // height: 200,
                  child: const BottomSheetExample())
            ],
          )),
    );
  }
}

class ProductItem extends StatefulWidget {
  const ProductItem({super.key});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Arroz marinero'),
              Text('\$25'),
              Text('lorem ipsum  dolor sit amet'),
              Text('lorem ipsum  dolor sit amet'),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        _decrementCounter();
                      },
                    ),
                    Text('$_counter'),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        _incrementCounter();
                      },
                    ),
                  ],
                ),
                const Text('25'),
              ])
            ])));
  }
}

class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Checkout'),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  child: Center(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text('Resumen del pedido'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Total: '),
                            Text('\$100'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Tipo'),
                            Text('Para llevar'),
                          ],
                        ),
                        TextButton(
                            onPressed: () {}, child: Text('Añadir nota')),
                        Container(
                          child: true
                              ? Column(
                                  children: [
                                    const Text('Datos del cliente'),
                                    TextField(
                                      minLines: 3,
                                      maxLines: 8,
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        hintText: 'Notas',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ToggleButtonsSample(title: 'kalsfd'),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: const Text('Crear pedido'),
                              onPressed: () => Navigator.pop(context),
                            ))
                      ],
                    ),
                  ),
                ));
          },
        );
      },
    );
  }
}

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
        children: <Widget>[
          // ToggleButtons with a single selection.
          Text('Single-select', style: theme.textTheme.titleSmall),
          const SizedBox(height: 5),
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
            constraints: const BoxConstraints(
              minHeight: 40.0,
              minWidth: 80.0,
            ),
            isSelected: _selectedFruits,
            children: options,
          ),

          const SizedBox(height: 20),
        ]);
  }
}
