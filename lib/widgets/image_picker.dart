import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final ImagePicker picker = ImagePicker();
  XFile? image;

  void _uploadImage() async {
    final pickimage = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      image = pickimage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Bar"),
      ),
      body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image == null
                  ? const Text("No Image")
                  : Image.file(
                      File(image!.path),
                      width: 200,
                      height: 200,
                    ),
              IconButton(
                  onPressed: _uploadImage,
                  icon: const Icon(
                    Icons.file_upload_outlined,
                    size: 30,
                  ))
            ],
          ),
        )
      ])),
    );
  }
}
