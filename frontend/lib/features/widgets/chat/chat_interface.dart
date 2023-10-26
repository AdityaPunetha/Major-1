import 'package:flutter/material.dart';
import 'package:frontend/features/widgets/chat/chat_input.dart';
import 'message_list.dart';

class ChatInterface extends StatefulWidget {
  const ChatInterface({Key? key}) : super(key: key);

  @override
  State<ChatInterface> createState() => _ChatInterfaceState();
}

class _ChatInterfaceState extends State<ChatInterface> {
  MessageList messages = MessageList(key: MessageList.messageListKey);
  ChatInput chatInput = const ChatInput();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [messages, chatInput],
      ),
    );
  }
}
