import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: keyboardType ?? TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
