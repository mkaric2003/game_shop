// ignore_for_file: use_key_in_widget_constructors, unused_import, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:game_shop/providers/product.dart';
import 'package:game_shop/providers/products.dart';
import 'package:game_shop/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.indigo.withOpacity(0.5),
          //Colors.white.withOpacity(0.5),
          Colors.black.withOpacity(0.7),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: GridView.builder(
        //padding: EdgeInsets.only(top: 0.5),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 5 / 3,
            crossAxisSpacing: 0,
            mainAxisSpacing: 20),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: ProductItem(
              // products[i].id,
              //products[i].title,
              //products[i].imageUrl,
              ),
        ),
        itemCount: products.length,
      ),
    );
  }
}
