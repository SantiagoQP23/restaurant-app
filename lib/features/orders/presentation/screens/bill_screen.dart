import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BillScreen extends StatelessWidget {
  const BillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bill'),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Restaurante Doña Yoli',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(' 10:30 | 12 julio 2021'),
                    ],
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),
                Table(
                  columnWidths: const <int, TableColumnWidth>{
                    0: FlexColumnWidth(),
                    1: FixedColumnWidth(40),
                    2: FixedColumnWidth(84),
                  },
                  children: [
                    TableRow(children: [
                      TableCell(child: Container( child: Text('Hamburguesa con papas fritas', ), padding: EdgeInsets.only(bottom: 10),)),
                      TableCell(
                        child: Text(
                          'x123',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TableCell(
                          child: Text('\$10.00', textAlign: TextAlign.right)),
                    ]),
                    TableRow(children: [
                      TableCell(child: Text('Hamburguesa con papas fritas')),
                      TableCell(
                        child: Text(
                          'x123',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TableCell(
                          child: Text('\$10.00', textAlign: TextAlign.right)),
                    ]),
                    TableRow(children: [
                      TableCell(child: Text('Hamburguesa con papas fritas')),
                      TableCell(
                        child: Text(
                          'x123',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TableCell(
                          child: Text('\$10.00', textAlign: TextAlign.right)),
                    ]),
                    TableRow(children: [
                      TableCell(child: Text('Hamburguesa con papas fritas')),
                      TableCell(
                        child: Text(
                          'x123',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TableCell(
                          child: Text('\$10.00', textAlign: TextAlign.right)),
                    ]),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                Table(
                    // border: TableBorder.all(),
                    columnWidths: const <int, TableColumnWidth>{
                      0: FlexColumnWidth(),
                      1: FixedColumnWidth(84),
                    },
                    children: [
                      TableRow(children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Tip',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ),
                        TableCell(
                          child: Text(
                            '\$2.50',
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Discount',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ),
                        TableCell(
                          child: Text(
                            '\$3.00',
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Text(
                            'Total',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ),
                        TableCell(
                          child: Text(
                            '\$10.00',
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ])
                    ]),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
        bottomSheet: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$10.00',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.go('/order/new-bill/bill/checkout');
                },
                child: Text('Cobrar'),
              ),
            ],
          ),
        ));
  }
}

TableRow buildTableRowDivider({
  required int cols,
  double height = 1,
  Color color = Colors.grey,
}) =>
    TableRow(
      children: [
        for (var i = 0; i < cols; i++)
          Container(
            padding: EdgeInsets.only(top: 15),
            height: height,
            color: color,
          )
      ],
    );
