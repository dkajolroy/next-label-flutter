import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_label/models/product_model.dart';

class CartController extends GetxController {
  List<Product> cartItems = [];

  void addToCart(Product item) {
    try {
      cartItems.firstWhere((element) => element.id == item.id);
      Get.snackbar(
        "Already exist !",
        "Please try another product then add to cart !",
        barBlur: 20,
        borderWidth: 1,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        icon: const Icon(
          Icons.warning,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      cartItems.add(item);
      Get.snackbar(
        "Product Added !",
        "This product now available in the cart",
        barBlur: 20,
        borderWidth: 1,
        duration: const Duration(seconds: 2),
        colorText: Colors.white,
        icon: const Icon(
          Icons.check_box,
          color: Colors.green,
        ),
        snackPosition: SnackPosition.TOP,
      );
      update();
    }
  }

  void removeFromCart(int index) {
    cartItems.removeAt(index);
    update();
  }

  int totalPrice() {
    if (cartItems.isNotEmpty) {
      return cartItems
          .map((e) => e.price)
          .reduce((value, element) => value + element);
    } else {
      return 0;
    }
  }
}
