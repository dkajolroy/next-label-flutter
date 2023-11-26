import 'package:flutter/material.dart';
import 'package:next_label/widgets/bottom_sheed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomSheedWidget(),
    );
  }
}
