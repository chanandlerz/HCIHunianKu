import 'package:app_development/components/listing_page_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListingPage extends StatefulWidget {
  const ListingPage({super.key});

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 58, 58, 58),
        body: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            ListingWidget(),
          ],
        ),
      ),
    );
  }
}
