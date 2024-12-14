import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_app/core/websockets/socket_service.dart';
import 'package:restaurant_app/features/orders/domain/entities/create_bill_detail.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';
import 'package:restaurant_app/features/orders/infraestructura/models/create_bill_dto.dart';
import 'package:restaurant_app/features/shared/infraestructure/models/socket_event_mapper.dart';
import 'package:restaurant_app/features/shared/infraestructure/services/toast_service.dart';
import 'package:restaurant_app/features/shared/infraestructure/services/toast_service_imp.dart';
import 'package:restaurant_app/features/shared/providers/socket_provider.dart';

class BillCreationSheet extends ConsumerStatefulWidget {
  final Order order;
  const BillCreationSheet({super.key, required this.order});

  @override
  BillCreationSheetState createState() => BillCreationSheetState();
}

class BillCreationSheetState extends ConsumerState<BillCreationSheet> {
  bool _selectAll = false;
  Map<String, CreateBillDetail> selectedDetails = {};
  late SocketService socketService;

  double getTotalToPay() {
    final order = widget.order;
    final totalToPay = order.details.fold<double>(
        0,
        (previousValue, detail) =>
            previousValue +
            ((detail.quantity - detail.qtyPaid) * detail.price));
    return totalToPay;
  }

  double getTotalToPaySelected() {
    final totalToPay = selectedDetails.values.fold<double>(
        0,
        (previousValue, billDetail) =>
            previousValue + (billDetail.quantity * billDetail.detail.price));
    return totalToPay;
  }

  void updateBillDetail(String orderDetailId, double quantity) {
    final billDetail = selectedDetails[
        orderDetailId]!; // order.details.firstWhere((element) => element.id == orderDetailId);

    // final newDetail = detail.copyWith(qtyPaid: quantity.toDouble());
    final createBillDetail = billDetail.copyWith(quantity: quantity);
    setState(() {
      selectedDetails[orderDetailId] = createBillDetail;
    });
  }

  void emitCreateBill() {
    final order = widget.order;

    final toast = ToastServiceImpl();
    final createBillDTO = CreateBillDTO(
        orderId: order.id,
        details: selectedDetails.values
            .where((selectedDetail) => selectedDetail.quantity > 0)
            .toList(),
        paymentMethod: PaymentMethod.cash,
        discount: 0,
        receivedAmount: 0);
    socketService.socket.emitWithAck(
        SocketEvents.createBill, createBillDTO.toJson(), ack: (data) {
      final socketResponse = SocketEventMapper.fromJson(data);
      if (socketResponse.ok) {
        toast.show(socketResponse.msg, ToastType.success);
      } else {
        toast.show(socketResponse.msg, ToastType.error);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    final order = widget.order;
    socketService = ref.read(socketInstanceProvider);
    for (var detail in order.details) {
      if (detail.qtyPaid < detail.quantity) {
        selectedDetails[detail.id] =
            CreateBillDetail(detail: detail, quantity: 0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    return Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Create bill',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Order details',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    const Text('Select all'),
                    const SizedBox(width: 10),
                    Checkbox(
                        value: _selectAll,
                        onChanged: (value) {
                          setState(() {
                            _selectAll = value!;
                          });
                        })
                  ],
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: selectedDetails.length,
                  itemBuilder: (context, index) {
                    final createBill = selectedDetails.values.elementAt(index);

                    final detail = createBill.detail;
                    return Card(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 3,
                                      value: detail.qtyPaid / detail.quantity,
                                      color: Colors.cyan,
                                      backgroundColor: Colors.grey,
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                              Colors.blue),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                      '${detail.quantity - detail.qtyPaid} ${detail.product.name} of ${detail.quantity}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                ],
                              ),
                              Text('Price: \$${detail.price}'),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _selectAll
                                  ? Container()
                                  : Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          onPressed: () {
                                            if (createBill.quantity >= 1) {
                                              updateBillDetail(
                                                  createBill.detail.id,
                                                  createBill.quantity - 1);
                                            }
                                          },
                                        ),
                                        Text('${createBill.quantity}'),
                                        IconButton(
                                          icon: const Icon(Icons.add),
                                          onPressed: () {
                                            if (createBill.quantity <
                                                (createBill.detail.quantity -
                                                    createBill
                                                        .detail.qtyPaid)) {
                                              updateBillDetail(
                                                  createBill.detail.id,
                                                  createBill.quantity + 1);
                                            }
                                            // _incrementQuantityDelivered();
                                          },
                                        ),
                                      ],
                                    ),
                              Text(
                                  ' \$${_selectAll ? detail.amount : createBill.total}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          )
                        ],
                      ),
                    ));
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Total por pagar'),
                Text(
                  '\$${_selectAll ? getTotalToPay() : getTotalToPaySelected()}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: getTotalToPay() == getTotalToPaySelected()
                          ? Colors.black
                          : Colors.blue),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (!_selectAll && selectedDetails.isEmpty)
                      ? null
                      : () => {
                            emitCreateBill(),
                            // Navigator.pop(context),
                          },
                  child: const Text('Create bill'),
                  // totalToPay != 0 ? context.go('/order/new-bill') : null,
                )),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            )
          ],
        ));
  }
}
