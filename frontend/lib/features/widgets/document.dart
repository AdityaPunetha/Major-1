import 'package:flutter/material.dart';
import 'package:frontend/features/widgets/document_list.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/global/common.dart';
import 'package:frontend/features/widgets/checkbox.dart';

class DocumentWidget extends StatelessWidget {
  final String documentName;
  final String documentID;
  const DocumentWidget(
      {super.key, required this.documentName, required this.documentID});

  factory DocumentWidget.fromJson(Map<String, dynamic> json) {
    return DocumentWidget(
      documentName: json['docName'],
      documentID: json['docID'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(children: [
        const CheckboxWidget(value: false, onChanged: true),
        Text(documentName, style: const TextStyle(color: Colors.black)),
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () async {
            Uri url = Uri.parse("${RoutingBalance.documents}$documentID");
            http.Response res = await http.delete(url);
            // TODO: add response code handling
            DocumentListWidgetState? documentListWidgetState =
                DocumentListWidget.documentListKey.currentState;
            documentListWidgetState?.refresh();
          },
        ),
      ]),
    );
  }
}
