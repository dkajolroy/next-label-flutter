import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:next_label/controller/navigation_controller.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Container(
      padding: const EdgeInsets.all(10),
      child: GNav(
          onTabChange: (value) {
            controller.setNavigationIndex(value);
          },
          selectedIndex: controller.currentIndex,
          rippleColor:
              (Colors.grey[300])!, // tab button ripple color when pressed
          hoverColor: (Colors.grey[700])!, // tab button hover color
          haptic: true, // haptic feedback
          tabBorderRadius: 30,
          // tabActiveBorder:
          //     Border.all(color: Colors.grey, width: 1), // tab button border
          tabBorder:
              Border.all(color: Colors.white, width: 1), // tab button border

          curve: Curves.easeInCubic, // tab animation curves
          duration: const Duration(milliseconds: 400), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          color: Colors.grey[800], // unselected icon color
          activeColor: Colors.purple, // selected icon and text color
          iconSize: 24, // tab button icon size
          tabBackgroundColor:
              Colors.purple.withOpacity(0.1), // selected tab background color
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 12), // navigation bar padding
          tabs: [
            GButton(
              backgroundColor: Colors.purple[100],
              iconActiveColor: Colors.purple,
              textColor: Colors.purple,
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            GButton(
              backgroundColor: Colors.pink[100],
              iconActiveColor: Colors.pink,
              textColor: Colors.pink,
              icon: Icons.shopping_bag_outlined,
              text: 'Cart',
            ),
            GButton(
              backgroundColor: Colors.orange[100],
              iconActiveColor: Colors.orange,
              textColor: Colors.orange,
              icon: Icons.heart_broken_outlined,
              text: 'Search',
            ),
            GButton(
              backgroundColor: Colors.teal[100],
              iconActiveColor: Colors.teal,
              textColor: Colors.teal,
              icon: Icons.person_outline,
              text: 'Profile',
            )
          ]),
    );
  }
}
