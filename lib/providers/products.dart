// ignore_for_file: unused_import, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import '../providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'FIFA 22',
      imageUrl:
          'https://library.sportingnews.com/2021-10/ea-fifa-22-cover-kylian-mbappe_1qeaco87s803l13iu0tnr84jhq.jpg',
      description: 'EA SPORTS FIFA',
      price: 59.99,
      isFavorite: false,
    ),
    Product(
      id: 'p2',
      title: 'PES 21',
      imageUrl: 'https://www.konami.com/wepes/mobile/s/img/pes2021_ogp.png',
      description: 'PES 21',
      price: 59.99,
      isFavorite: false,
    ),
    Product(
      id: 'p3',
      title: 'CS:GO',
      imageUrl:
          'http://media.steampowered.com/apps/csgo/blog/images/fb_image.png',
      description: 'CS:GO',
      price: 59.99,
      isFavorite: false,
    ),
    Product(
      id: 'p4',
      title: 'PUBG',
      imageUrl:
          'https://www.global-esports.news/wp-content/uploads/2022/01/PUBG-Free-to-play.jpg',
      description: 'PUBG',
      price: 59.99,
      isFavorite: false,
    )
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items
        .firstWhere((prod) => prod.id == id); // prepoznaje element po ID
  }

  void addProduct() {
    //_items.add(value);
    notifyListeners();
  }
}