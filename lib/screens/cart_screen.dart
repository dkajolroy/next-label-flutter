import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_label/controller/cart_controller.dart';
import 'package:next_label/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(CartController());
    return GetBuilder<CartController>(
      builder: (controller) {
        return Scaffold(
            backgroundColor: Colors.grey[200],
            bottomSheet: Container(
              height: 50,
              color: Colors.pink,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    "${controller.totalPrice()} TK",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              title: const Text("Cart"),
            ),
            body: Padding(
                padding: const EdgeInsets.all(10),
                child: controller.cartItems.isNotEmpty
                    ? ListView.builder(
                        itemCount: controller.cartItems.length,
                        itemBuilder: (context, int index) {
                          return CartItem(
                            itemIndex: index,
                            item: controller.cartItems[index],
                          );
                        },
                      )
                    : const Center(
                        child: Text(
                          "Cart is empty !",
                          style: TextStyle(fontSize: 20),
                        ),
                      )));
      },
    );
  }
}
