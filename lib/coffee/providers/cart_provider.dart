import 'package:flutter/foundation.dart';
import 'package:coffee/coffee/model/coffee_model.dart';

class CartProvider with ChangeNotifier {
  final Map<String, Coffee> _cart = {};

  Map<String, Coffee> get cart => _cart;

  void addToCart(Coffee coffee) {
    if (_cart.containsKey(coffee.title)) {
      _cart[coffee.title]!.quantity.value += 1;
    } else {
      coffee.quantity.value = 1;
      _cart[coffee.title] = coffee;
    }
    notifyListeners();
  }

  void updateQuantity(String title, int change) {
    if (_cart.containsKey(title)) {
      Coffee coffee = _cart[title]!;
      coffee.quantity.value += change;

      if (coffee.quantity.value <= 0) {
        _cart.remove(title);
      }
    }
    notifyListeners();
  }
}