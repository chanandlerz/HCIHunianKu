import 'package:app_development/components/bottom_nav_bar.dart';
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
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 58, 58, 58),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            color: Color.fromARGB(255, 205, 166, 122),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BottomNavBar()));
            },
          ),
          title: Text(
            'Listing Properti Anda',
            style: TextStyle(color: Color.fromARGB(255, 205, 166, 122)),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.tune_rounded),
              color: Color.fromARGB(255, 205, 166, 122),
              onPressed: () {},
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 58, 58, 58),
        body: ListView(
          children: [
            for (int i = 1; i < 10; i++)
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: ListingWidget(),
              ),
          ],
        ),
      ),
    );
  }
}
