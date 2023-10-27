import 'package:flutter/material.dart';
import 'package:frontend/features/widgets/sidebar/document_list.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/global/common.dart';

class Document extends StatefulWidget {
  final String documentName;
  final String documentID;
  const Document(
      {super.key, required this.documentName, required this.documentID});

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      documentName: json['docName'],
      documentID: json['docID'],
    );
  }
  @override
  State<Document> createState() => _DocumentState();
}

class _DocumentState extends State<Document> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(children: [
        Center(
            child: Checkbox(
                value: isChecked,
                onChanged: (newBool) => setState(() {
                      isChecked = newBool;
                      if (isChecked == true) {
                        DocumentListWidgetState? documentListWidgetState =
                            DocumentListWidget.documentListKey.currentState;
                        documentListWidgetState?.selectedDocs
                            .add(widget.documentID);
                      } else {
                        DocumentListWidgetState? documentListWidgetState =
                            DocumentListWidget.documentListKey.currentState;
                        documentListWidgetState?.selectedDocs
                            .remove(widget.documentID);
                      }
                    }))),
        Text(widget.documentName, style: const TextStyle(color: Colors.black)),
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () async {
            Uri url =
                Uri.parse("${RoutingBalance.documents}${widget.documentID}");
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
