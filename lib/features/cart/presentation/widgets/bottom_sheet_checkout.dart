import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/features/cart/presentation/providers/cart_providers.dart';
import 'package:restaurant_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:restaurant_app/features/cart/presentation/widgets/toggle_buttons_sample.dart';
import 'package:restaurant_app/features/orders/presentation/providers/orders_provider.dart';

class BottomSheetCheckout extends ConsumerStatefulWidget {
  const BottomSheetCheckout({
    super.key,
  });

  @override
  BottomSheetCheckoutState createState() => BottomSheetCheckoutState();
}

class BottomSheetCheckoutState extends ConsumerState<BottomSheetCheckout> {
  final TextEditingController _controller = TextEditingController();
  void updateNote(String note) {
    ref.read(orderNotesProvider.notifier).setOrderNotes(note);
  }

  @override
  void initState() {
    super.initState();
    // final notes = ref.watch(orderNotesProvider);

    _controller.text = '';
  }

  @override
  Widget build(BuildContext context) {
    final totalCart = ref.watch(totalCartProvider);
    final createOrderDto = ref.watch(createOrderDtoDataProvider);
    final notes = ref.watch(orderNotesProvider);
    _controller.text = notes;
    return IntrinsicHeight(
        child: Container(
      padding: const EdgeInsets.all(10),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Resumen del pedido',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total: '),
                  Text('\$$totalCart'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _controller,
                minLines: 3,
                maxLines: 8,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Notas',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (value) => updateNote(value),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text('Create order'),
                    onPressed: () {
                      ref
                          .read(activeOrdersProvider.notifier)
                          .emitCreateOrder(createOrderDto, (orderId) {
                        // ref.read(createOrderDtoDataProvider.notifier).clearCreateOrderDto();
                        context.pop();
                        context.go("/home");
                      });
                    },
                  )),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    child: const Text('Cancel'),
                    onPressed: () => Navigator.pop(context),
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
