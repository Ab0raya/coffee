import 'package:get/get.dart';

class Coffee {
  String title;
  String image;
  String description;
  String subTitle;
  String price;
  RxInt quantity;

  Coffee({
    required this.title,
    required this.image,
    required this.description,
    required this.subTitle,
    required this.price,
    int quantity = 0,
  }) : quantity = quantity.obs;
}
