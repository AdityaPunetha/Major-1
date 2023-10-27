import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/features/widgets/chat/message.dart';
import 'package:frontend/features/widgets/sidebar/document_list.dart';
import 'package:frontend/global/common.dart';
import 'package:http/http.dart' as http;

class MessageList extends StatefulWidget {
  const MessageList({super.key});
  static final GlobalKey<MessageListState> messageListKey =
      GlobalKey<MessageListState>();
  @override
  State<MessageList> createState() => MessageListState();
}

class MessageListState extends State<MessageList> {
  List<Message> messageWidgets = [];

  void sendMessage(String message) async {
    final userMessageWidget = UserMessage(text: message);
    DocumentListWidgetState? documentListWidgetState =
        DocumentListWidget.documentListKey.currentState;
    String body = jsonEncode(<String, dynamic>{
      "message": message,
      "chat_history": messageWidgets.map((e) => e.text).toList(),
      "selected_document": documentListWidgetState?.selectedDocs.toList()
    });

    var response = await http.post(Uri.parse(RoutingBalance.documents),
        headers: <String, String>{
          "Content-Type": "application/json",
          "accept": "application/json"
        },
        body: body);

    const chatbotReply = "Hello, what do you want to know?";
    const chatbotMessageWidget = AIMessage(text: chatbotReply);
    setState(() {
      messageWidgets.add(userMessageWidget);
      messageWidgets.add(chatbotMessageWidget);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: ListView.builder(
                itemCount: messageWidgets.length,
                itemBuilder: (_, i) => messageWidgets[i])));
  }
}
