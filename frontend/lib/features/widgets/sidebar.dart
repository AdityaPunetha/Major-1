import 'package:flutter/material.dart';
import 'package:frontend/features/widgets/document_list.dart';
import 'package:frontend/features/widgets/upload_document.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      DocumentListWidget(),
      Spacer(),
      SizedBox(
        height: 10,
      ),
      UploadDocumentWidget(),
      SizedBox(
        height: 10,
      ),
    ]);
  }
}
