import 'package:get/get.dart';

import '../models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  int get cartCount => cartItems.length;
  double get totalAmount =>
      cartItems.fold(0, (sum, element) => sum + element.price);

  addToCart(Product p) {
    cartItems.add(p);
  }
}
