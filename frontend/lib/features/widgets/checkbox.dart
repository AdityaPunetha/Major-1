import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({super.key, required value, required onChanged});

  @override
  State<CheckboxWidget> createState() => _CheckboxState();
}

class _CheckboxState extends State<CheckboxWidget> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Checkbox(
            value: isChecked,
            onChanged: (newBool) => setState(() {
                  isChecked = newBool;
                })));
  }
}
