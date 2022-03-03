// ignore_for_file: unused_local_variable, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:game_shop/providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  // final String? title;
  //final double price;

  //ProductDetailScreen(this.title, this.price);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments
        as String; // prosljeđivanje podataka između screenova (id)
    final loadedProduct = Provider.of<Products>(context, listen: false)
        .findById(productId); // kupi podatke
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title!),
      ),
    );
  }
}
