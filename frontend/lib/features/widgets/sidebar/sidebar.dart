import 'package:flutter/material.dart';
import 'package:frontend/features/widgets/sidebar/document_list.dart';
import 'package:frontend/features/widgets/sidebar/upload_document.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  // TODO: Solve overflow issue
  DocumentListWidget documentList =
      DocumentListWidget(key: DocumentListWidget.documentListKey);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      documentList,
      const Spacer(),
      const SizedBox(
        height: 10,
      ),
      const UploadDocumentWidget(),
      const SizedBox(
        height: 10,
      ),
    ]);
  }
}
