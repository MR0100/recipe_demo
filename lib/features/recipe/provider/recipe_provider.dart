import 'package:flutter/material.dart';

class RecipeProvider extends ChangeNotifier {
  int qty = 1;

  void increaseQty() {
    qty++;
    notifyListeners();
  }

  void decreaseQty() {
    if (qty > 0) {
      qty--;
    }
    notifyListeners();
  }
}
