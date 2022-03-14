// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:game_shop/providers/cart.dart' show Cart;
import 'package:game_shop/providers/orders.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.indigo.withOpacity(0.5),
            //Colors.white.withOpacity(0.5),
            Colors.black.withOpacity(0.7),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
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
              Card(
                elevation: 30,
                margin: EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.indigo.withOpacity(0.95),
                      //Colors.white.withOpacity(0.5),
                      Colors.black.withOpacity(0.9),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Total',
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .titleLarge!
                                  .color),
                        ),
                        Spacer(),
                        Chip(
                          //label: Text(cart.totalAmount.toString()),
                          label: Text(
                            '\$${cart.totalAmount.toStringAsFixed(2)}',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .titleLarge!
                                    .color),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                            onPressed: () {
                              Provider.of<Orders>(context, listen: false)
                                  .addOrder(
                                cart.items.values.toList(),
                                cart.totalAmount,
                              );
                              cart.clear();
                            },
                            child: Text(
                              'ORDER NOW',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .titleLarge!
                                      .color),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) => CartItem(
                    cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].title),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
