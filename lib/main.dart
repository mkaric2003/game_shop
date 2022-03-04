// ignore_for_file: prefer_const_constructors, deprecated_member_use, use_key_in_widget_constructors, unused_label

import 'package:flutter/material.dart';
import 'package:game_shop/providers/cart.dart';
import 'package:game_shop/providers/products.dart';
import 'package:game_shop/screens/cart_screen.dart';
import 'package:game_shop/screens/product_deatail_screen.dart';
import 'package:game_shop/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => Products(),
          ),
          ChangeNotifierProvider(
            create: ((ctx) => Cart()),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Welcome to Flutter',
          theme: ThemeData(
              primarySwatch: Colors.indigo,
              accentColor: Colors.red,
              fontFamily: 'Lato'),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen()
          },
        ));
  }
}
