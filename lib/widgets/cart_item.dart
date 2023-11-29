import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_label/controller/cart_controller.dart';
import 'package:next_label/models/product_model.dart';

class CartItem extends StatelessWidget {
  final Product item;
  final int itemIndex;
  const CartItem({required this.itemIndex, required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    final controller = Get.put(CartController());
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
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      item.image,
                      height: 80,
                      width: 80,
                    ),
                  ),
                  SizedBox(
                      width: screen.width / 3,
                      child: Text(item.title, maxLines: 1))
                ],
              ),
              Row(
                children: [
                  Text("${item.price} TK"),
                  IconButton(
                      onPressed: () {
                        controller.removeFromCart(itemIndex);
                      },
                      icon: const Icon(Icons.delete))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
