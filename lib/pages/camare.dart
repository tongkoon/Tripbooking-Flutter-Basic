import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
      ),
      body: Column(
        children: [
          FilledButton(
            onPressed: () async {
              final ImagePicker picker = ImagePicker();
              // Pick an image.
              image = await picker.pickImage(source: ImageSource.gallery);
            },
            child: const Text('Gallery'),
          ),
          FilledButton(
            onPressed: () async {
              final ImagePicker picker = ImagePicker();
              // Pick an image.
              image = await picker.pickImage(source: ImageSource.camera);
              setState(() {
                
              });
            },
            child: const Text('Camera'),
          ),
          (image != null) ?Image.file(File(image!.path)) : Container(),
        ],
      ),
    );
  }
}
