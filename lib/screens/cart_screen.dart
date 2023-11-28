import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_label/controller/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartColtroller = Get.put(CartController());
    return Scaffold(
        backgroundColor: Colors.grey[200],
        bottomSheet: Container(
          height: 50,
          color: Colors.pink,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                "20 TK",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("Cart"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(
                                "lib/assets/mobile_01.webp",
                                height: 80,
                                width: 80,
                              ),
                            ),
                            const Text("Product Name")
                          ],
                        ),
                        Text("${cartColtroller.cartItems.length} TK"),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
