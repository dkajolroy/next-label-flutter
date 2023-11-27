import 'package:flutter/material.dart';
import 'package:next_label/model/product_mode.dart';
import 'package:next_label/screens/home_screen.dart';

class CartScreen extends StatefulWidget {
  final List<Product> cartList;
  const CartScreen({required this.cartList, super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

int totalPrice() {
  if (cartList.isNotEmpty) {
    return cartList
        .map((e) => e.price * e.quantity)
        .reduce((value, element) => value + element);
  } else {
    return 0;
  }
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("APP BAR"),
        actions: [
          Center(
            child: Text(cartList.length.toString()),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: cartList.length,
          itemBuilder: (context, index) {
            Product item = widget.cartList[index];
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.network(
                              item.image,
                            ),
                          ),
                          Text(item.title),
                        ],
                      ),
                      Text("${item.price} TK")
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.blue,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              "${totalPrice().toString()} Tk",
              style: const TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
