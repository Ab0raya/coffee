import 'package:coffee/coffee/model/coffee_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cart = <String, Coffee>{}.obs;

  void addToCart(Coffee coffee) {
    if (cart.containsKey(coffee.title)) {
      cart[coffee.title]!.quantity.value += 1;
    } else {
      coffee.quantity.value = 1;
      cart[coffee.title] = coffee;
    }
  }

  void updateQuantity(String title, int change) {
    if (cart.containsKey(title)) {
      Coffee coffee = cart[title]!;
      coffee.quantity.value += change;

      if (coffee.quantity.value <= 0) {
        cart.remove(title);
      }
    }
  }
}
