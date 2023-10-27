import 'package:flutter/material.dart';
import 'package:frontend/features/widgets/chat/chat_interface.dart';
import 'package:frontend/features/widgets/sidebar/sidebar.dart';
import 'package:frontend/global/common.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: Row(children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: 400,
                decoration: BoxDecoration(
                    boxShadow: glowBoxShadow,
                    color: const Color.fromARGB(255, 239, 239, 239)),
                child: const Sidebar()),
            const Expanded(
              child: ChatInterface(),
            ),
          ]),
        )
      ]),
    );
  }
}
