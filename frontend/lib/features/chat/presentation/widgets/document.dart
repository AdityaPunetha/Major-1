import 'package:flutter/material.dart';
import 'package:frontend/features/chat/presentation/widgets/checkbox.dart';
import 'package:frontend/features/chat/presentation/widgets/delete.dart';

class DocumentWidget extends StatelessWidget {
  final String textData;
  const DocumentWidget({super.key, required this.textData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(children: [
        const CheckboxWidget(value: false, onChanged: true),
        Text(textData, style: TextStyle(color: Colors.black)),
        const DeleteWidget(
          enabled: true,
        ),
      ]),
    );
  }
}
