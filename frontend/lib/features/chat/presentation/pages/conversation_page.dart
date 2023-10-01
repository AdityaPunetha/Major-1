import 'package:flutter/material.dart';
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
              child: Column(children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    "Document 1",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    "Document 2",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    "Upload Document",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                // LeftNavButtonWidget(
                //   textData: "Upload Document",
                // ),
                SizedBox(
                  height: 10,
                ),
              ]),
            ),
          ]),
        )
      ]),
    );
  }
}
