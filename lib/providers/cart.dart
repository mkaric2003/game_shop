// ignore_for_file: prefer_final_fields, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';

class CartItem {
  final String? id;
  final String? title;
  final int? quantity;
  final double? price;

  CartItem({
    this.id,
    this.title,
    this.quantity,
    this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

//////////////////////////////////////////////////////////// računa ukupnu cijenu dodanih elemenata
  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, CartItem) {
      total += CartItem.price! * CartItem.quantity!;
    });
    return total;
  }
///////////////////////////////////////////////////////////

////////////////////////////////////////// broji elemente dodane u korpu
  int get itemCount {
    return _items.length;
  }
///////////////////////////////////////////

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity! + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: 1),
      );
    }
    notifyListeners();
  }

////////////////////////////////////// brisanje proizvoda iz korpe
  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
//////////////////////////////////////////////////////////////////
}
