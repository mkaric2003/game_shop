// ignore_for_file: invalid_required_named_param

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String? id;
  //final List<String>? categories;
  final String? title;
  final String? imageUrl;
  final String? description;
  final double? price;
  bool isFavorite;
  final bool? isBattleRoyal;
  final bool? isStrategy;
  final bool? isSports;
  final bool? isHorror;

  Product({
    @required this.id,
    // @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.description,
    @required this.price,
    @required this.isFavorite = false,
    @required this.isBattleRoyal = false,
    @required this.isStrategy = false,
    @required this.isSports = false,
    @required this.isHorror = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
