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
      description:
          'Powered by Football™, EA SPORTS™ FIFA 22 brings the game even closer to the real thing with fundamental gameplay advances and a new season of innovation across every mode.',
      price: 59.99,
      isFavorite: false,
      isSports: true,
      isBattleRoyal: false,
      isHorror: false,
      isStrategy: false,
    ),
    Product(
      id: 'p2',
      title: 'PES 21',
      imageUrl: 'https://www.konami.com/wepes/mobile/s/img/pes2021_ogp.png',
      description:
          'This product is an updated edition of eFootball PES 2020 (launched in September, 2019) containing the latest player data and club rosters.',
      price: 59.99,
      isFavorite: false,
      isSports: true,
      isBattleRoyal: false,
      isHorror: false,
      isStrategy: false,
    ),
    Product(
      id: 'p3',
      title: 'CS:GO',
      imageUrl:
          'http://media.steampowered.com/apps/csgo/blog/images/fb_image.png',
      description:
          'Counter-Strike: Global Offensive (CS: GO) expands upon the team-based action gameplay that it pioneered when it was launched 19 years ago.',
      price: 59.99,
      isFavorite: false,
      isSports: false,
      isBattleRoyal: true,
      isHorror: false,
      isStrategy: false,
    ),
    Product(
      id: 'p4',
      title: 'PUBG',
      imageUrl:
          'https://www.global-esports.news/wp-content/uploads/2022/01/PUBG-Free-to-play.jpg',
      description:
          'Land on strategic locations, loot weapons and supplies, and survive to become the last team standing across various, diverse Battlegrounds.',
      price: 59.99,
      isFavorite: false,
      isSports: false,
      isBattleRoyal: true,
      isHorror: false,
      isStrategy: false,
    ),
    Product(
      id: 'p5',
      title: 'GTA V',
      imageUrl:
          'https://www.guinnessworldrecords.com/Images/GTA-V-main_tcm25-19095.jpg',
      description:
          'Grand Theft Auto V for PC offers players the option to explore the award-winning world of Los Santos and Blaine County in resolutions of up to 4k and beyond, as well as the chance to experience the game running at 60 frames per second.',
      price: 59.99,
      isFavorite: false,
      isSports: false,
      isBattleRoyal: true,
      isHorror: false,
      isStrategy: false,
    )
  ];

  // var _showFavoritesOnly = false;

  List<Product> get items {
    //  if (_showFavoritesOnly) {
    //  return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  /////////// getuje favorite iteme
  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }
  //////////
//////////////////////////////////////////////////// za popup menu
  // void showFavoritesOnly() {
  // _showFavoritesOnly = true;
  // notifyListeners();
  //}

  //void showAll() {
  // _showFavoritesOnly = false;
  //notifyListeners();
  //}

/////////////////////////////////////////////////////
  Product findById(String id) {
    return _items
        .firstWhere((prod) => prod.id == id); // prepoznaje element po ID
  }

  void addProduct() {
    //_items.add(value);
    notifyListeners();
  }
}
