import 'package:flutter/material.dart';
import 'package:frontend/features/chat/presentation/widgets/document.dart';
import 'package:frontend/features/chat/presentation/widgets/documentList.dart';
import 'package:frontend/features/chat/presentation/widgets/uploadDocument.dart';
// import 'package:frontend/features/chat/presentation/widgets/left_nav_button_widget.dart';
import 'package:frontend/global/common/common.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({Key? key}) : super(key: key);

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  TextEditingController messageController = TextEditingController();
  List<Widget> messageWidgets = []; // List to store message widgets

  void receiveMessage(String message) {
    setState(() {
      final userMessageWidget =
          MessageWidget(text: message, isSentByUser: true);
      messageWidgets.add(userMessageWidget);

      // Simulate a delay before the chatbot's reply
      Future.delayed(const Duration(seconds: 1), () {
        const chatbotReply = "Hello, what do you want to know?";
        const chatbotMessageWidget =
            MessageWidget(text: chatbotReply, isSentByUser: false);
        messageWidgets.add(chatbotMessageWidget);
        setState(() {}); // Trigger a rebuild to show the chatbot's reply
      });

      messageController.clear(); // Clear the input field
    });
  }

  void sendMessage(String message) {
    // setState(() {
    final userMessageWidget = MessageWidget(text: message, isSentByUser: true);
    // messageWidgets.add(userMessageWidget);
    messageController.clear(); // Clear the input field

    // Simulate a delay before the chatbot's reply
    Future.delayed(const Duration(seconds: 1), () {
      const chatbotReply = "Hello, what do you want to know?";
      const chatbotMessageWidget =
          MessageWidget(text: chatbotReply, isSentByUser: false);
      setState(() {
        messageWidgets.add(userMessageWidget);
        messageWidgets.add(chatbotMessageWidget);
      }); // Trigger a rebuild to show the chatbot's reply
    });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: 300,
                  decoration: BoxDecoration(
                    boxShadow: glowBoxShadow,
                    color: const Color.fromARGB(255, 239, 239, 239),
                  ),
                  child: const Column(
                    children: [
                      DocumentListWidget(),
                      Spacer(),
                      SizedBox(height: 10),
                      UploadDocumentWidget(),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: ListView.builder(
                            itemCount: messageWidgets.length,
                            itemBuilder: (_, i) => messageWidgets[i],
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
                                  sendMessage(message);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
          color: isSentByUser
              ? Colors.blue
              : Colors.grey, // Blue box for user messages
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
