import 'package:flutter/material.dart';

class SearchTextFieldFeedsPage extends StatefulWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const SearchTextFieldFeedsPage({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  State<SearchTextFieldFeedsPage> createState() =>
      _SearchTextFieldFeedsPageState();
}

class _SearchTextFieldFeedsPageState extends State<SearchTextFieldFeedsPage> {
  TextEditingController searchbarController = TextEditingController();
  void performSearch(String query) {
    Navigator.pushNamed(context, '/result', arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: widget.obscureText,
        controller: widget.controller,
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
            contentPadding:
                EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            hintText: widget.hintText,
            suffixIcon: IconButton(
              icon: Icon(Icons.search_rounded),
              onPressed: () {
                // performSearch(searchbarController.text);
              },
            )
            // suffixIcon: Icon(
            //   Icons.notifications_none,
            //   color: Color.fromARGB(255, 205, 166, 122),
            // )
            ),
        // onSubmitted: (value) {
        //   searchbarController;
        // },
      ),
    );
  }
}
