import 'package:flutter/material.dart';
import 'package:frontend/features/chat/presentation/widgets/chat_interface.dart';
import 'package:frontend/features/chat/presentation/widgets/document.dart';
import 'package:frontend/features/chat/presentation/widgets/documentList.dart';
import 'package:frontend/features/chat/presentation/widgets/uploadDocument.dart';
import 'package:frontend/features/chat/presentation/widgets/message_list.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: 300,
              decoration: BoxDecoration(
                  boxShadow: glowBoxShadow,
                  color: const Color.fromARGB(255, 239, 239, 239)),
              child: const Column(children: [
                DocumentListWidget(),
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
            const Expanded(
              child: ChatInterface(),
            ),
          ]),
        )
      ]),
    );
  }
}