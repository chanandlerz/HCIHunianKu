import 'package:flutter/material.dart';

class SearchTextFieldFavoritesPage extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const SearchTextFieldFavoritesPage({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 15),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 205, 166, 122)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          hintText: hintText,
          // suffixIcon: Icon(
          //   Icons.notifications_none,
          //   color: Color.fromARGB(255, 205, 166, 122),
          // )
        ),
      ),
    );
  }
}
