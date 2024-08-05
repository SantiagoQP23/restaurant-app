import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TableCard extends StatelessWidget {
  const TableCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          context.go('/cart/menu');
        },
        splashColor: Colors.blue.withAlpha(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.restaurant),
            Text('Table 1', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
            SizedBox(height: 10),
            Container(
                child: Chip(
              label: Text('Available', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.green,
              padding: EdgeInsets.all(1),
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              side: BorderSide.none,
            )),
          ],
        ),
      ),
    );
  }
}
