import 'package:flutter/material.dart';
import 'package:frontend/features/widgets/message.dart';

class MessageList extends StatefulWidget {
  const MessageList({super.key});

  @override
  State<MessageList> createState() => _MessageListState();

  static void sendMessage(String message) {
    _MessageListState().sendMessage(message);
  }
}

class _MessageListState extends State<MessageList> {
  static List<Widget> messageWidgets = [];

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
    return ListView.builder(
        itemCount: messageWidgets.length,
        itemBuilder: (_, i) => messageWidgets[i]);
  }
}

class MessageWidget extends StatelessWidget {
  final String text;
  final bool isSentByUser;

  const MessageWidget(
      {super.key, required this.text, required this.isSentByUser});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color:
              isSentByUser ? Colors.blue : Colors.grey, // Use isSentByUser flag
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
