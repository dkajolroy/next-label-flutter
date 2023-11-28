import 'package:get/get.dart';
import 'package:next_label/models/product_model.dart';

class CartController extends GetxController {
  List<Product> cartItems = [];

  void addToCart(Product item) {
    cartItems.add(item);
    update();
  }

  void removeFromCart(int index) {
    cartItems.removeAt(index);
    update();
  }
}
