// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:game_shop/screens/product_deatail_screen.dart';

class ProductItem extends StatelessWidget {
  final String? id;
  final String? title;
  final String? imageUrl;

  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    //////////////////////////izgled kartica////////////////////////////
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetailScreen.routeName, arguments: id);
        },
        child: Image.network(
          imageUrl!,
          fit: BoxFit.cover,
        ),
      ), //karitce na pocetnom screenu
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite),
          color: Theme.of(context).accentColor,
        ),
        title: Text(
          title!,
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
