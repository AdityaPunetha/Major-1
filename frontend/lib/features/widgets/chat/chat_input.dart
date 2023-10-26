import 'package:flutter/material.dart';
import 'package:frontend/features/widgets/chat/message_list.dart';

class ChatInput extends StatefulWidget {
  const ChatInput({super.key});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                hintText: "Type a message...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                String message = messageController.text;
                if (message.isNotEmpty) {
                  messageController.clear();
                  MessageListState? messageListState =
                      MessageList.messageListKey.currentState;
                  messageListState?.sendMessage(message);
                }
              }),
        ],
      ),
    );
  }
}
