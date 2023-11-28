import 'package:flutter/material.dart';
import 'package:next_label/mini-com/model/product_mode.dart';
import 'package:next_label/mini-com/screens/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<Product> cartList = [];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text("APP BAR"),
          actions: [
            Badge(
              backgroundColor: Colors.black,
              offset: const Offset(5, 2),
              largeSize: 20,
              alignment: Alignment.topRight,
              label: Text(cartList.length.toString()),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return CartScreen(
                          cartList: cartList,
                        );
                      },
                    ));
                  },
                  icon: const Icon(Icons.shopping_cart)),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: GridView.builder(
                itemCount: productList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.82,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  Product item = productList[index];
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(item.image),
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
                                    try {
                                      cartList.firstWhere(
                                          (element) => element.id == item.id);
                                      SnackBar snackBar = const SnackBar(
                                        content: Text("Item already exist !"),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    } catch (_) {
                                      setState(() {
                                        cartList.add(item);
                                      });
                                    }
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
                }),
          ),
        ));
  }
}
