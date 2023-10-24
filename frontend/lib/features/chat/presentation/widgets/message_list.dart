import 'package:flutter/material.dart';

class MessageList {
  List<Widget> messageWidgets = [];

  void sendMessage(String message) {
    final userMessageWidget = MessageWidget(text: message, isSentByUser: true);
    messageWidgets.add(userMessageWidget);

    
    final chatboxMessageWidget = MessageWidget(text: "hello", isSentByUser: false);
    messageWidgets.add(chatboxMessageWidget);
  }
}

class MessageWidget extends StatelessWidget {
  final String text;
  final bool isSentByUser;

  const MessageWidget({Key? key, required this.text, required this.isSentByUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSentByUser ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
