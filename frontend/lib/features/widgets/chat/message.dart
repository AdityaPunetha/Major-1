import 'package:flutter/material.dart';

abstract class Message extends StatelessWidget {
  final String text;
  const Message({super.key, required this.text});
}

class UserMessage extends Message {
  const UserMessage({super.key, required super.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue,
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

class AIMessage extends Message {
  final String? reference;
  const AIMessage({super.key, required super.text, this.reference});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey,
            )),
        child: Text(
          text,
          style: const TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
