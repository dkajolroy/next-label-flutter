import 'package:get/get.dart';

class NavigationController extends GetxController {
  int currentIndex = 0;

  void setNavigationIndex(int value) {
    currentIndex = value;
    update();
  }
}
