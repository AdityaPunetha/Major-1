import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:frontend/features/widgets/document_list.dart';
import 'package:http/http.dart' as http;

class UploadDocumentWidget extends StatelessWidget {
  const UploadDocumentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        getFile();
      },
      child: const Text('Select Document'),
    );
  }

  void getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowMultiple: true, allowedExtensions: ['pdf']);
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      final request = http.MultipartRequest(
          'POST', (Uri.parse("http://127.0.0.1:8000/document/")));
      for (File filePath in files) {
        final file = await http.MultipartFile.fromPath('files', filePath.path);
        request.files.add(file);
      }
      final response = await request.send();

      if (response.statusCode == 200) {
        // print('Files uploaded successfully');
        const DocumentListWidget().refresh();
      } else {
        print('Failed to upload files. Status code: ${response.statusCode}');
      }
    } else {
      // User canceled the picker
    }
  }
}
