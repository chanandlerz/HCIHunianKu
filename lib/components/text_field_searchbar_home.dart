import 'package:flutter/material.dart';

class SearchTextFieldHomePage extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const SearchTextFieldHomePage({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            hintStyle: const TextStyle(fontSize: 15),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 205, 166, 122)),
                borderRadius: BorderRadius.circular(15.0)),
            fillColor: Colors.grey.shade200,
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            hintText: hintText,
            prefixIcon: const Icon(
              Icons.location_on,
              color: Color.fromARGB(255, 205, 166, 122),
            )
            // suffixIcon: Icon(
            //   Icons.notifications_none,
            //   color: Color.fromARGB(255, 205, 166, 122),
            // )
            ),
      ),
    );
  }
}
