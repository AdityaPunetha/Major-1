import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:frontend/features/chat/presentation/widgets/document.dart';
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
  // Future<http.Response> fetchDocuments() {
  //   return http.get(Uri.parse('http://127.0.0.1:8000/document/'));
  // }

  final String postsURL = "http://127.0.0.1:8000/document/";

  Future<List<Widget>> fetchDocuments() async {
    //  TODO: Rename posts
    Response res = await http.get(Uri.parse(postsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<DocumentWidget> posts = body
          .map(
            (dynamic item) => DocumentWidget.fromJson(item),
          )
          .toList();
      List<Widget> lastList = [];
      for (var i = 0; i < posts.length; i++) {
        // TODO: Too many docs, scrollbar
        lastList.add(posts[i]);
        lastList.add(SizedBox(
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
    return Container(
      child: FutureBuilder(
        future: fetchDocuments(),
        builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
          if (snapshot.hasData) {
            //  TODO: Rename posts
            List<Widget>? posts = snapshot.data;
            return Column(children: posts!.toList());
          } else {
            // TODO: On fail to connect with backend
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
