import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_label/controller/cart_controller.dart';
import 'package:next_label/models/product_model.dart';
import 'package:next_label/screens/view_product_screen.dart';

class ProductWidget extends StatelessWidget {
  final Product item;
  const ProductWidget({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Get.to(ViewProductScreen(item: item));
            },
            child: Image.asset(
              item.image,
            ),
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  item.title,
                  maxLines: 1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${item.price} TK",
                    style: const TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.addToCart(item);
                      // try {
                      //   cartList.firstWhere(
                      //       (element) => element.id == item.id);
                      //   SnackBar snackBar = const SnackBar(
                      //     content: Text("Item already exist !"),
                      //   );
                      //   ScaffoldMessenger.of(context)
                      //       .showSnackBar(snackBar);
                      // } catch (_) {
                      //   setState(() {
                      //     cartList.add(item);
                      //   });
                      // }
                    },
                    icon: Icon(Icons.shopping_cart_rounded,
                        color: Colors.grey[800]),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
