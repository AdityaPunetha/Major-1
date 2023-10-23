import 'package:flutter/material.dart';

class MessageList {
  List<Widget> messageWidgets = [];

  void receiveMessage(String message) {
    final userMessageWidget = MessageWidget(text: message, isSentByUser: true);
    messageWidgets.add(userMessageWidget);

    // Simulate a delay before the chatbot's reply
    Future.delayed(const Duration(seconds: 1), () {
      const chatbotReply = "Hello, what do you want to know?";
      const chatbotMessageWidget =
          MessageWidget(text: chatbotReply, isSentByUser: false);
      messageWidgets.add(chatbotMessageWidget);
    });
  }

  void sendMessage(String message) {
    final userMessageWidget = MessageWidget(text: message, isSentByUser: true);
    messageWidgets.add(userMessageWidget);
  }
}

class MessageWidget extends StatelessWidget {
  final String text;
  final bool isSentByUser;

  const MessageWidget({super.key, required this.text, required this.isSentByUser});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSentByUser ? Colors.blue : Colors.grey, // Use isSentByUser flag
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
