import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/config/routes/custom_navigation_helper.dart';
import 'package:restaurant_app/features/cart/presentation/screens/cart_screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Orders'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.go(CustomNavigationHelper.ordersPath);
            },
          ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Order ID: 123456 ',
                      style: TextStyle(fontSize: 13),
                    ),
                    Text(
                      'Table 2',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(' 10:30 12 julio 2021'),
                  ],
                ),
              ]),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Estado',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      Text('Entregado'),
                    ],
                  ),
                  TextButton(onPressed: () {}, child: Text('09:30'))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Mesero',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      Text('Santiago Quirumbay'),
                    ],
                  ),
                  TextButton(onPressed: () {}, child: Text('Cambiar'))
                ],
              ),
              SizedBox(
                height: 10,
              ),
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
                  Text('Total por pagar '),
                  Text('\$100'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: double.infinity,
                  // height: 200,
                  child: const CheckoutOrder())
            ],
          )),
    );
  }
}

class CheckoutOrder extends StatelessWidget {
  const CheckoutOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Cobrar'),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
                padding: const EdgeInsets.all(10),
                child: IntrinsicHeight(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Resumen del pedido'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Total'),
                          Text('\$100'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Pago en efectivo: '),
                          Text('\$50'),
                        ],
                      ),
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
                          Text('16 Julio 2024 10:30 '),
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: <Widget>[
                              Center(
                                child: SizedBox(
                                  width: 42,
                                  height: 42,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                    value: 0.50,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.blue),
                                  ),
                                ),
                              ),
                              Center(child: Text('50%')),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: const Text('Crear cuenta'),
                            onPressed: () => context.go('/order/new-bill'),
                          ))
                    ],
                  ),
                ));
          },
        );
      },
    );
  }
}
