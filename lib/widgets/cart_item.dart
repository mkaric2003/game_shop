// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:game_shop/providers/cart.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String? id;
  final String? productId;

  final double? price;
  final int? quantity;
  final String? title;

  CartItem(
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.title,
  );
//////////////////////////////////////////////kartice sa podacima o proizvodima iz korpe
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        child: Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 15),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            backgroundColor: Colors.indigo,
            title: Text(
              'Are you sure?',
              style: TextStyle(color: Colors.white),
            ),
            content: Text('Do you want to remove the item frome the cart?',
                style: TextStyle(color: Colors.white)),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text('NO', style: TextStyle(color: Colors.white))),
              // ignore: deprecated_member_use
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text('YES', style: TextStyle(color: Colors.white)))
            ],
          ),
        );
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId!);
      },
      child: Card(
        elevation: 30,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
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
            child: ListTile(
              leading: CircleAvatar(
                child: FittedBox(
                    child: Text('\$$price',
                        style: TextStyle(color: Colors.white))),
              ),
              title: Text(title!, style: TextStyle(color: Colors.white)),
              subtitle: Text(
                'Total: \$${price! * quantity!}',
                style: TextStyle(color: Colors.white),
              ),
              trailing:
                  Text('$quantity x', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
