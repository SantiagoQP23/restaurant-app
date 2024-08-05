import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text('Payment Method'),
            const ExpansionTile(
              title: Text('Efectivo '),
              subtitle: Text('Selecciona el número de caja'),
              children: <Widget>[RadioExample()],
            ),
            SizedBox(
              height: 20,
            ),
            Text('Total'),
            Text('\$53.00', style: TextStyle(fontSize: 30)),
            SizedBox(
              height: 20,
            ),
            Text('Cantidad recibida'),
            TextField(
              decoration: InputDecoration(
                hintText: 'Ingrese la cantidad recibida',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Cambio'),
            Text('\$7.00', style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
      bottomSheet: Container(
          padding: const EdgeInsets.all(20),
          height: 75,
          child: Column(
            children: [
              SizedBox(
                  width: double.infinity,
                  child: 
                  ElevatedButton(onPressed: (){
                    context.go('/order/new-bill/bill');
                  }, child: Text('Cobrar'))
                  // height: 200,
          )],
          )),
    );
  }
}

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  int? _character = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Caja 1'),
          subtitle: Text('Santiago Quirumbay'),
          leading: Icon(Icons.account_balance_wallet_rounded),
          trailing: Radio<int>(
            value: 0,
            groupValue: _character,
            onChanged: (int? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Caja 1'),
          subtitle: Text('Santiago Quirumbay'),
          leading: Icon(Icons.account_balance_wallet_rounded),
          trailing: Radio<int>(
            value: 0,
            groupValue: _character,
            onChanged: (int? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Caja 1'),
          subtitle: Text('Santiago Quirumbay'),
          leading: Icon(Icons.account_balance_wallet_rounded),
          trailing: Radio<int>(
            value: 0,
            groupValue: _character,
            onChanged: (int? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Caja 1'),
          subtitle: Text('Santiago Quirumbay'),
          leading: Icon(Icons.account_balance_wallet_rounded),
          trailing: Radio<int>(
            value: 0,
            groupValue: _character,
            onChanged: (int? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
