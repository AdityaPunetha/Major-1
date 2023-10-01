import 'package:flutter/material.dart';

class LeftNavButtonWidget extends StatelessWidget {
  final String textData;
  const LeftNavButtonWidget({super.key, required this.textData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
          children: [Text("$textData", style: TextStyle(color: Colors.black))]),
    );
  }
}
