import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_label/controller/cart_controller.dart';
import 'package:next_label/models/product_model.dart';

class ViewProductScreen extends StatelessWidget {
  final Product item;
  const ViewProductScreen({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        item.image,
                        fit: BoxFit.cover,
                        height: screenSize.height / 4,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        item.title,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      Text(
                        item.description * 4,
                        maxLines: 3,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${item.price.toString()} TK",
                            style: const TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              children: [
                                FloatingActionButton(
                                  mini: true,
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.grey[900],
                                  onPressed: () {},
                                  child: const Icon(
                                    Icons.remove,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "1",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                FloatingActionButton(
                                  backgroundColor: Colors.purple,
                                  mini: true,
                                  foregroundColor: Colors.white,
                                  onPressed: () {},
                                  child: const Icon(Icons.add),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
            Expanded(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Size"),
                            Row(
                              children: [
                                FloatingActionButton(
                                  mini: true,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.purple,
                                  onPressed: () {},
                                  child: const Text("4GB"),
                                ),
                                FloatingActionButton(
                                  mini: true,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.grey[800],
                                  onPressed: () {},
                                  child: const Text("6GB"),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.purple,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  foregroundColor: Colors.white),
                              onPressed: () {
                                controller.addToCart(item);
                              },
                              child: SizedBox(
                                width: screenSize.width - 40,
                                height: 30,
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Add to cart"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.shopping_cart)
                                  ],
                                ),
                              )),
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
