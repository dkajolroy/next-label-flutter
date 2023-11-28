import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:next_label/controller/binding.dart';
import 'package:next_label/controller/navigation_controller.dart';
import 'package:next_label/screens/account_screen.dart';
import 'package:next_label/screens/cart_screen.dart';
import 'package:next_label/screens/home_screen.dart';
import 'package:next_label/screens/wishlist_screen.dart';
import 'package:next_label/widgets/bottom_nav.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // final int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black)),
      getPages: [
        GetPage(
            binding: DashboardBinding(),
            name: "/",
            page: () => const NavigationMain())
      ],
    );
  }
}

class NavigationMain extends StatelessWidget {
  const NavigationMain({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(NavigationController());
    return GetBuilder<NavigationController>(
      builder: (controller) {
        return Scaffold(
            body: IndexedStack(
              index: controller.currentIndex,
              children: const [
                HomeScreen(),
                CartScreen(),
                WishlistScreen(),
                AccountScreen()
              ],
            ),
            bottomNavigationBar: const BottomNav());
      },
    );
  }
}
