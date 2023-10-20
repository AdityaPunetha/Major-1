import 'package:flutter/material.dart';

class UploadDocumentWidget extends StatelessWidget {
  const UploadDocumentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: const Text(
        "Upload Document",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
