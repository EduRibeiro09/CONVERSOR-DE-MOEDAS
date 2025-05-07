import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  final String labelText;
  final String prefixText;
  final TextEditingController controller;

  const BuildTextField({
    Key? key,
    required this.labelText,
    required this.prefixText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixText: prefixText,
        labelStyle: const TextStyle(color: Colors.green),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}
