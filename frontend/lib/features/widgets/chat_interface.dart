import 'package:flutter/material.dart';
import 'message_list.dart';

class ChatInterface extends StatefulWidget {
  const ChatInterface({Key? key}) : super(key: key);

  @override
  State<ChatInterface> createState() => _ChatInterfaceState();
}

class _ChatInterfaceState extends State<ChatInterface> {
  TextEditingController messageController = TextEditingController();
  List<ChatMessage> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (_, i) {
                  final message = messages[i];
                  return MessageWidget(
                    text: message.text,
                    isSentByUser: message.isSentByUser,
                  );
                },
              ),
            ),
          ),
          Container(
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
                      // Add the user message
                      messages
                          .add(ChatMessage(text: message, isSentByUser: true));
                      // Simulate the chatbot reply
                      messages.add(ChatMessage(
                          text: "Hello, what do you want to know?",
                          isSentByUser: false));
                      // Clear the input field and update the UI
                      messageController.clear();
                      setState(() {});
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isSentByUser;

  ChatMessage({required this.text, required this.isSentByUser});
}
