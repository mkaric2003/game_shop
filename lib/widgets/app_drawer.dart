// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:game_shop/screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.indigo.withOpacity(0.5),
            //Colors.white.withOpacity(0.5),
            Colors.black.withOpacity(0.7),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          children: <Widget>[
            AppBar(
              title: const Text('Welcome to our Game-Shop'),
              automaticallyImplyLeading: false,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.shop,
                color: Colors.white,
                size: 30,
              ),
              title: const Text(
                'GAME SHOP',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.payment,
                color: Colors.white,
                size: 30,
              ),
              title: const Text('ORDERS',
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              onTap: () {
                Navigator.of(context).pushNamed(OrdersScreen.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
