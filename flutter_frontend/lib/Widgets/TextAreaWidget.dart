import 'package:flutter/material.dart';

class TextAreaWidget extends StatelessWidget {
  TextAreaWidget({
    super.key,
    required this.label,
    required this.controller,
  });

  // String username, password, gender, age;
  String label;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 6,
      keyboardType: TextInputType.multiline,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        border: const OutlineInputBorder(),
        labelText: "Enter $label",
      ),
    );
  }
}
