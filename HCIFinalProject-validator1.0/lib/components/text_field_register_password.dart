import 'package:flutter/material.dart';

class RegisterTextFieldPassword extends StatefulWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const RegisterTextFieldPassword({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  State<RegisterTextFieldPassword> createState() =>
      _RegisterTextFieldPasswordState();
}

class _RegisterTextFieldPasswordState extends State<RegisterTextFieldPassword> {
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        validator: (value) {
          if (value!.isEmpty) {
            return "Enter Password";
          } 
          if (passwordController.text.length < 6) {
            return "Password Length should not be less than 6 character";
          }
          return null;
        },
        
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 205, 166, 122)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
