import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:restaurant_app/features/cart/domain/entities/new_order_detail.dart';
import 'package:restaurant_app/features/cart/presentation/providers/cart_providers.dart';
import 'package:restaurant_app/features/cart/presentation/screens/cart_screen.dart';

class ProductItem extends ConsumerStatefulWidget {
  final NewOrderDetail orderDetail;
  const ProductItem({super.key, required this.orderDetail});

  @override
  ProductItemState createState() => ProductItemState();
}

class ProductItemState extends ConsumerState<ProductItem> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
      ref
          .read(orderDetailsProvider.notifier)
          .updateOrderDetail(widget.orderDetail.copyWith(quantity: _counter));
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
        ref
            .read(orderDetailsProvider.notifier)
            .updateOrderDetail(widget.orderDetail.copyWith(quantity: _counter));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _counter = widget.orderDetail.quantity;
  }

  void deleteOrderDetail() {
    ref
        .read(orderDetailsProvider.notifier)
        .removeOrderDetail(widget.orderDetail);
  }

  void editOrderDetail() {
    ref
        .read(orderDetailsProvider.notifier)
        .updateOrderDetail(widget.orderDetail);
  }

  @override
  Widget build(BuildContext context) {
    final orderDetail = widget.orderDetail;
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 1,
            onPressed: (context) {
              deleteOrderDetail();
            },
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
          ),
          EditSlidableAction(
            orderDetail: orderDetail,
          ),
        ],
      ),
      child: Card(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderDetail.product.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('\$${orderDetail.product.price}'),
                    const SizedBox(height: 5),
                    Text(orderDetail.note),
                    // Text('lorem ipsum  dolor sit amet'),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue,
                                      width: 2), // Border color and width
                                  borderRadius: BorderRadius.circular(
                                      50), // Optional: Rounded corners
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.remove),
                                  iconSize: 16,
                                  onPressed: () {
                                    _decrementCounter();
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 10,
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
                          Text('\$${orderDetail.product.price * _counter}'),
                        ])
                  ]))),
    );
  }
}

class EditSlidableAction extends StatelessWidget {
  final NewOrderDetail orderDetail;
  const EditSlidableAction({
    super.key,
    required this.orderDetail,
  });

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return EditCartDetail(orderDetail: orderDetail);
            });
      },
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.blue,
      icon: Icons.edit,
      label: 'Edit',
    );
  }
}

class EditCartDetail extends ConsumerStatefulWidget {
  const EditCartDetail({
    super.key,
    required this.orderDetail,
  });

  final NewOrderDetail orderDetail;

  @override
  ConsumerState<EditCartDetail> createState() => _EditCartDetailState();
}

class _EditCartDetailState extends ConsumerState<EditCartDetail> {
  final TextEditingController _controller = TextEditingController();
  String note = '';

  updateNote(String value) {
    setState(() {
      note = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.text = widget.orderDetail.note;
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      widget.orderDetail.product.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _controller,
                  minLines: 3,
                  maxLines: 8,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Note',
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onChanged: (value) => updateNote(value),
                ),
                const SizedBox(height: 10),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text('Save'),
                      onPressed: () {
                        ref
                            .read(orderDetailsProvider.notifier)
                            .updateOrderDetail(
                                widget.orderDetail.copyWith(note: note));
                        Navigator.pop(context);
                      },
                    )),
                SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      // style: ButtonStyle(
                      //     backgroundColor:
                      //         WidgetStateProperty.all(Colors.grey)),
                      child: const Text('Cancel'),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
