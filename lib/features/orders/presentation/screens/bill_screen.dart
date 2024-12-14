import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/core/websockets/socket_service.dart';
import 'package:restaurant_app/features/bills/presentation/widgets/select_payment_method.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';
import 'package:restaurant_app/features/orders/presentation/providers/bills_provider.dart';
import 'package:restaurant_app/features/shared/infraestructure/models/socket_event_mapper.dart';
import 'package:restaurant_app/features/shared/infraestructure/services/toast_service.dart';
import 'package:restaurant_app/features/shared/infraestructure/services/toast_service_imp.dart';
import 'package:restaurant_app/features/shared/providers/socket_provider.dart';

class BillScreen extends ConsumerWidget {
  final int id;
  const BillScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final billQuery = ref.watch(billByIdProvider(id));
    return billQuery.when(
        data: (bill) => BillInfoScaffold(bill: bill),
        loading: () => const LoadingScaffold(),
        error: (error, _) => Scaffold(
              appBar: AppBar(
                title: Text('Error'),
              ),
              body: Center(
                child: Text('Error: $error'),
              ),
            ));
    // error: error,
    // loading: );
  }
}

class BillInfoScaffold extends ConsumerStatefulWidget {
  final Bill bill;
  const BillInfoScaffold({
    super.key,
    required this.bill,
  });

  @override
  ConsumerState<BillInfoScaffold> createState() => _BillInfoScaffoldState();
}

class _BillInfoScaffoldState extends ConsumerState<BillInfoScaffold> {
  @override
  void initState() {
    super.initState();
    // ref.read(activeBillProvider.notifier).setActiveBill(widget.bill);
  }

  @override
  Widget build(BuildContext context) {
    final details = widget.bill.details;
    final discount = ref.watch(discountBillProvider);
    final bill = widget.bill;
    return Scaffold(
        appBar: AppBar(
            // title: const Text('Bill'),
            ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Restaurante Doña Yoli',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(' 10:30 | 12 julio 2021'),
                      Text(widget.bill.isPaid ? 'Pagado' : 'Pendiente'),
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
                    ...details.map((detail) => TableRow(children: [
                          TableCell(
                              child: Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              detail.orderDetail.product.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )),
                          TableCell(
                            child: Text(
                              'x${detail.quantity}',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          TableCell(
                              child: Text('\$${detail.total}',
                                  textAlign: TextAlign.right)),
                        ])),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 1,
                ),
                const SizedBox(
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
                          padding: const EdgeInsets.only(bottom: 10),
                          child: const Text(
                            'Discount',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ),
                        TableCell(
                          child: InkWell(
                            onTap: () => buildDiscountBottomSheet(context),
                            child: Text(
                              '\$${widget.bill.discount}',
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        const TableCell(
                          child: Text(
                            'Total',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ),
                        TableCell(
                          child: Text(
                            '\$${widget.bill.total}',
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ])
                    ]),
                const SizedBox(
                  height: 10,
                ),
              ],
            )),
        bottomSheet: bill.isPaid
            ? null
            : Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total: \$${widget.bill.total - discount}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return SelectPaymentMethodScreen(
                                  bill: widget.bill);
                            },
                          ),
                        );
                      },
                      child: const Text('Cobrar'),
                    ),
                  ],
                ),
              ));
  }

  buildDiscountBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return DiscountBottomSheet(bill: widget.bill);
        });
  }
}

class DiscountBottomSheet extends ConsumerStatefulWidget {
  Bill bill;
  DiscountBottomSheet({
    super.key,
    required this.bill,
  });

  @override
  ConsumerState<DiscountBottomSheet> createState() =>
      _DiscountBottomSheetState();
}

class _DiscountBottomSheetState extends ConsumerState<DiscountBottomSheet> {
  List<int> discountOptions = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50];
  final TextEditingController _discountController = TextEditingController();
  late SocketService socketService;

  final double discount = 0;
  int discountPercent = 0;

  updateDiscount(int discount) {
    final dis = discount * widget.bill.total / 100;
    _discountController.text = dis.toString();
    ref.read(discountBillProvider.notifier).setDiscount(dis);

    setState(() {
      discountPercent = discount;
    });
  }

  updateBill() {
    final toast = ToastServiceImpl();
    // final updateBillDTO = widget.bill.toUpdateDTO(discount: discount);
    // socketService.socket.emitWithAck(
    //     SocketEvents.updateBill, updateBillDTO.toJson(), ack: (data) {
    //   final socketResponse = SocketEventMapper.fromJson(data);
    //   if (socketResponse.ok) {
    //     toast.show(socketResponse.msg, ToastType.success);
    //   } else {
    //     toast.show(socketResponse.msg, ToastType.error);
    //   }
    // });
    // widget.updateBill(bill);
  }

  @override
  void initState() {
    super.initState();
    socketService = ref.read(socketInstanceProvider);
  }

  @override
  Widget build(BuildContext context) {
    final bill = widget.bill;
    return IntrinsicHeight(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text('Discount',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(
                controller: _discountController,
                autofocus: true,
                onChanged: (value) => setState(() {
                  discountPercent =
                      (100 * double.parse(value) / bill.total).round();
                }),
                // decoration: const InputDecoration(
                //   labelText: 'Discount',
                // ),
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: discountOptions.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: index == discountOptions.length - 1
                            ? const EdgeInsets.fromLTRB(8, 0, 8, 0)
                            : const EdgeInsets.only(left: 8),
                        child: ChoiceChip(
                            onSelected: (value) =>
                                updateDiscount(discountOptions[index]),
                            selected: discountPercent == discountOptions[index],
                            label: Text('% ${discountOptions[index]}')),
                      );
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      updateBill();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Apply'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
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

class LoadingScaffold extends StatelessWidget {
  const LoadingScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
