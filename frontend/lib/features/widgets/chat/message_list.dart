import 'package:flutter/material.dart';
import 'package:frontend/features/widgets/chat/message.dart';

class MessageList extends StatefulWidget {
  const MessageList({super.key});
  static final GlobalKey<MessageListState> messageListKey =
      GlobalKey<MessageListState>();
  @override
  State<MessageList> createState() => MessageListState();
}

class MessageListState extends State<MessageList> {
  List<Widget> messageWidgets = [];

  void sendMessage(String message) {
    final userMessageWidget = UserMessage(text: message);
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
