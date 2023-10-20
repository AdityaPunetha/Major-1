import 'package:flutter/material.dart';
import 'package:frontend/features/chat/presentation/widgets/document.dart';
import 'package:frontend/features/chat/presentation/widgets/uploadDocument.dart';
// import 'package:frontend/features/chat/presentation/widgets/left_nav_button_widget.dart';
import 'package:frontend/global/common/common.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({super.key});

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: Row(children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: 300,
              decoration: BoxDecoration(
                  boxShadow: glowBoxShadow,
                  color: Color.fromARGB(255, 239, 239, 239)),
              child: const Column(children: [
                DocumentWidget(textData: "Document 1"),
                Spacer(),
                SizedBox(
                  height: 10,
                ),
                UploadDocumentWidget(),
                SizedBox(
                  height: 10,
                ),
              ]),
            ),
            Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            // boxShadow: glowBoxShadow,
                            color: Colors.white,
                          ),
                          // chat-like display area
                          // a chat-like UI where the user can ask questions and receive responses.
                        ),
                      ),
                      //search bar with a send symbol at the bottom
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          // boxShadow: glowBoxShadow,
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Search...",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.send),
                              onPressed: () {
                                // Implement your send action here
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
      )
    );
  }
}
