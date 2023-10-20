import 'package:flutter/material.dart';
import 'package:frontend/features/chat/presentation/widgets/document.dart';
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

  void sendMessage(String message) {
    setState(() {
      final messageWidget = MessageWidget(text: message, isSentByUser: true);
      messageWidgets.add(messageWidget); // Add the message widget to the list
      messageController.clear(); // Clear the input field
    });
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
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: 300,
                  decoration: BoxDecoration(
                    boxShadow: glowBoxShadow,
                    color: Color.fromARGB(255, 239, 239, 239),
                  ),
                  child: Column(
                    children: [
                      DocumentWidget(textData: "Document 1"),
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
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: ListView(
                            children: messageWidgets,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
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
                              icon: Icon(Icons.send),
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

  MessageWidget({required this.text, required this.isSentByUser});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSentByUser ? Colors.blue : Colors.grey, // Blue box for user messages
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

