import 'package:flutter/material.dart';
import 'package:frontend/features/widgets/checkbox.dart';
import 'package:frontend/features/widgets/delete.dart';

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
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(children: [
        const CheckboxWidget(value: false, onChanged: true),
        Text(documentName, style: TextStyle(color: Colors.black)),
        const DeleteWidget(
          enabled: true,
        ),
      ]),
    );
  }
}
