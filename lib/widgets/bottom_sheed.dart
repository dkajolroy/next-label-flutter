import 'package:flutter/material.dart';

class BottomSheedWidget extends StatefulWidget {
  const BottomSheedWidget({super.key});

  @override
  State<BottomSheedWidget> createState() => _BottomSheedWidgetState();
}

class _BottomSheedWidgetState extends State<BottomSheedWidget> {
  @override
  Widget build(BuildContext context) {
    void _openBottomSheed() {
      showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return sheed;
          });
    }

    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: _openBottomSheed, child: const Text("Open")),
      ),
    );
  }
}

Widget sheed = Container(
  decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
  height: 500,
  child: const Column(
    children: [
      SizedBox(
        width: 100,
        child: Divider(
          height: 20,
          thickness: BorderSide.strokeAlignOutside,
          color: Colors.grey,
        ),
      ),
      Expanded(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "This is BottomSheet",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    ],
  ),
);
