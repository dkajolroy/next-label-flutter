import 'package:get/get.dart';
import 'package:next_label/controller/cart_controller.dart';
import 'package:next_label/controller/navigation_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());
    Get.lazyPut<CartController>(() => CartController());
  }
}
