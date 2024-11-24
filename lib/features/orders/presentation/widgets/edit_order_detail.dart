import 'package:flutter/material.dart';
import 'package:restaurant_app/features/orders/domain/entities/entities.dart';

class EditOrderDetail extends StatefulWidget {
  final OrderDetail orderDetail;
  const EditOrderDetail({super.key, required this.orderDetail});

  @override
  State<EditOrderDetail> createState() => _EditOrderDetailState();
}

class _EditOrderDetailState extends State<EditOrderDetail> {
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  String note = '';
  String price = '';
  double _counter = 1;
  double quantity = 0;
  double quantityDelivered = 0;

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

  @override
  void initState() {
    super.initState();
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
        
            // Expanded(
            //   child: order.bills.isEmpty
            //       ? const Center(child: Text('No hay cuentas'))
            //       : ListView.builder(
            //           shrinkWrap: true,
            //           itemCount: order.bills.length,
            //           itemBuilder: (context, index) {
            //             final bill = order.bills[index];
            //             return ListTile(
            //               leading: CircularProgressIndicator(
            //                 strokeWidth: 3,
            //                 value: bill.total / order.total,
            //                 valueColor:
            //                     AlwaysStoppedAnimation<Color>(Colors.blue),
            //               ),
            //               title: Text('${bill.paymentMethod.name}'),
            //               subtitle: Text(formatDate.format(bill.createdAt)),
            //               trailing: Text('\$${bill.total}'),
            //             );
            //           }),
            // ),
            const SizedBox(
              height: 10,
            ),
            const Text('Quantity'),
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
              Text((orderDetail.product.price * _counter).toString()),
            ]),
            SizedBox(
              height: 10,
            ),
            Text(
                'Quantity delivered ${orderDetail.qtyDelivered}/${orderDetail.quantity}'),
        
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                    Navigator.pop(context);
                  },
                )),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.grey)),
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
