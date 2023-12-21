import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:app_development/components/listing_page_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListingPage extends StatefulWidget {
  final String? udid;

  ListingPage({Key? key, required this.udid}) : super(key: key);

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  List<dynamic> myListingData = [];

  @override
  void initState() {
    super.initState();
    fetchListingDataFromServer();
  }

  Future fetchListingDataFromServer() async {
    //current work
    final Uri url = Uri.https('debug.lubisputri16.repl.co', 'myListing');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'udid': widget.udid,
      }),
    );

    if (response.statusCode == 200) {
      print('Data fetched successfuly');
      setState(() {
        myListingData = jsonDecode(response.body);
        print(myListingData);
      });
    } else {
      print('Failed to fetch data. Status Code: ${response.statusCode}');
      print('Error Response: ${response.body}');
    }
  }

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
            Padding(
              padding: EdgeInsets.only(bottom: 20, left: 10, right: 10),
              child: ListingWidget(
                myListingData: myListingData,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
