import 'package:flutter/material.dart';
import 'package:next_label/models/product_model.dart';
import 'package:next_label/widgets/product_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 200,
              backgroundColor: Colors.grey[900],
              foregroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Apple store"),
                centerTitle: true,
                expandedTitleScale: 1.6,
                background: Image.asset(
                  "lib/assets/apple_banner.webp",
                  fit: BoxFit.cover,
                ),
              )),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverGrid.builder(
                // padding: const EdgeInsets.all(10),
                itemCount: productList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.72,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  Product item = productList[index];
                  return ProductWidget(
                    item: item,
                  );
                }),
          )
        ],
      ),
    );
  }
}
