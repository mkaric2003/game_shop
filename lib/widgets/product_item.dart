// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:game_shop/providers/product.dart';
import 'package:game_shop/screens/product_deatail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  //final String? id;
  //final String? title;
  //final String? imageUrl;

  //ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    //////////////////////////izgled kartica////////////////////////////
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetailScreen.routeName, arguments: product.id);
        },
        child: Image.network(
          product.imageUrl!,
          fit: BoxFit.cover,
        ),
      ), //karitce na pocetnom screenu
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        leading: Consumer<Product>(
          builder: (ctx, product, child) => IconButton(
            onPressed: () {
              product.toggleFavoriteStatus();
            },
            icon: Icon(product.isFavorite
                ? Icons.favorite
                : Icons.favorite_border), //izgled ikone
            color: Theme.of(context).accentColor,
          ),
        ),
        title: Text(
          product.title!,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart),
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
