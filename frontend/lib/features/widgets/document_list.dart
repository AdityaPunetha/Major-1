import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/features/widgets/document.dart';
import 'package:frontend/global/common.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DocumentListWidget extends StatefulWidget {
  const DocumentListWidget({super.key});

  @override
  State<DocumentListWidget> createState() => _DocumentListWidgetState();

  void refresh() {
    _DocumentListWidgetState().refresh();
  }
}

class _DocumentListWidgetState extends State<DocumentListWidget> {
  Future<List<Widget>> fetchDocuments() async {
    Response res = await http.get(Uri.parse(RoutingBalance.documents));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<DocumentWidget> docs = body
          .map(
            (dynamic item) => DocumentWidget.fromJson(item),
          )
          .toList();
      List<Widget> lastList = [];
      for (var i = 0; i < docs.length; i++) {
        // TODO: Too many docs, scrollbar
        lastList.add(docs[i]);
        lastList.add(const SizedBox(
          height: 10,
        ));
      }
      return lastList;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchDocuments(),
      builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
        if (snapshot.hasData) {
          List<Widget>? docs = snapshot.data;
          return Column(children: docs!.toList());
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
