import 'package:flutter/material.dart';

class TextfieldComp extends StatelessWidget{
  final String hintText;
  final bool obscureText; 
  final TextEditingController controller;

  const TextfieldComp({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: hintText,
      ),
      obscureText: obscureText,
    );
  }
}