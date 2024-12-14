import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_app/core/websockets/socket_service.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';
import 'package:restaurant_app/features/orders/presentation/providers/orders_provider.dart';
import 'package:restaurant_app/features/shared/infraestructure/models/socket_event_mapper.dart';
import 'package:restaurant_app/features/shared/infraestructure/services/toast_service.dart';
import 'package:restaurant_app/features/shared/infraestructure/services/toast_service_imp.dart';
import 'package:restaurant_app/features/shared/providers/socket_provider.dart';

class EditOrderDetail extends ConsumerStatefulWidget {
  final OrderDetail orderDetail;
  final String orderId;
  const EditOrderDetail(
      {super.key, required this.orderDetail, required this.orderId});

  @override
  EditOrderDetailState createState() => EditOrderDetailState();
}

class EditOrderDetailState extends ConsumerState<EditOrderDetail> {
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  late SocketService socketService;
  String note = '';
  String price = '';
  double _counter = 1;
  double quantity = 0;
  double quantityDelivered = 0;
  late Order activeOrder;

  updateNote(String value) {
    setState(() {
      note = value;
    });
  }

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

  void _incrementQuantityDelivered() {
    setState(() {
      if (quantityDelivered < quantity) {
        quantityDelivered++;
      }
    });
  }

  void _decrementQuantityDelivered() {
    setState(() {
      if (quantityDelivered > 1) {
        quantityDelivered--;
      }
    });
  }

  void updateOrderDetail() {
    socketService.socket.emitWithAck(
        SocketEvents.updateOrderDetail,
        widget.orderDetail.toUpdateOrderDto(
          orderId: widget.orderId,
          quantity: _counter,
          qtyDelivered: quantityDelivered,
          description: note,
          price: double.parse(price),
        ), ack: (data) {
      final toast = ToastServiceImpl();
      final socketResponse = SocketEventMapper.fromJson(data);
      if (socketResponse.ok) {
        toast.show(socketResponse.msg, ToastType.success);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    socketService = ref.read(socketInstanceProvider);
    _counter = widget.orderDetail.quantity;
    quantity = widget.orderDetail.quantity;

    quantityDelivered = widget.orderDetail.qtyDelivered;
    note = widget.orderDetail.description;
    price = widget.orderDetail.price.toString();
    _priceController.text = price;
    _noteController.text = note;
  }

  @override
  Widget build(BuildContext context) {
    final orderDetail = widget.orderDetail;
    return IntrinsicHeight(
        child: Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              child: Text(
                orderDetail.product.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _noteController,
              minLines: 3,
              maxLines: 8,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                label: const Text('Note'),
                hintText: 'Note',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onChanged: (value) => updateNote(value),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(
                label: const Text('Price'),
                hintText: 'Price',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onChanged: (value) => updateNote(value),
            ),

            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text('Quantity'),
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
            ]),
            const Divider(
              height: 10,
              thickness: 1,
              color: Colors.grey,
            ),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                  'Quantity delivered ${orderDetail.qtyDelivered}/${orderDetail.quantity}'),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      _decrementQuantityDelivered();
                    },
                  ),
                  Text('$quantityDelivered'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      _incrementQuantityDelivered();
                    },
                  ),
                ],
              ),
            ]),

            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () {
                    updateOrderDetail();
                    Navigator.pop(context);
                  },
                )),
            SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ))
            // SizedBox(
            //     width: double.infinity,
            //     child: ElevatedButton(
            //       child: const Text('Crear cuenta'),
            //       onPressed: () =>
            //           totalToPay != 0 ? context.go('/order/new-bill') : null,
            //     ))
          ],
        ),
      ),
    ));
  }
}
