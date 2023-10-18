import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadDocumentWidget extends StatelessWidget {
  const UploadDocumentWidget({super.key});

  void getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: Platform.isWindows,
        allowedExtensions: ['pdf']);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        getFile();
      },
      child: const Text('Select Document'),
    );
  }
}
