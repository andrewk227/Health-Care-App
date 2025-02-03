import 'package:flutter/material.dart';

class CustomTextFieldWithoutLabel extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String?) onSaved;
  Function validator;
  TextInputType keyboardType;

  CustomTextFieldWithoutLabel({
    super.key,
    required this.hintText,
    required this.controller,
    this.onSaved = _emptyFunction,
    this.validator = _emptyFunction,
    this.keyboardType = TextInputType.text,
  });

  // for decleration of constant functions
  static void _emptyFunction(String? value) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        onSaved: (value) => onSaved(value),
        validator: (value) => validator(value),
        controller: controller,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[400]),
        ),
        style: const TextStyle(fontSize: 16.0, color: Colors.black),
      ),
    );
  }
}
