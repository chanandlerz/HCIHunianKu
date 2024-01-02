import 'package:flutter/material.dart';

class RegisterTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const RegisterTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,

        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 205, 166, 122)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),

          hintText: hintText,
        ),
      ),
    );
  }
}
