import 'package:flutter/material.dart';

class InputBoxWidget extends StatelessWidget {
  InputBoxWidget({
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
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: "Enter $label",
      ),
    );
  }
}
