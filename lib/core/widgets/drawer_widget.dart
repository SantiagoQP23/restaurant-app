import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Menu'),
              onTap: () {
                context.go('/menu');
              },
            ),
            ListTile(
              title: const Text('Orders'),
              onTap: () {
                context.go('/orders');
              },
            ),
          ],
        ),

    );
  }
}