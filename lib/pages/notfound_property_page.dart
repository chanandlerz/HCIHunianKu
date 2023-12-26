import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:app_development/components/property_page_grid.dart';
import 'package:app_development/components/filter_property_beli.dart';
import 'package:app_development/components/filter_property_sewa.dart';
import 'package:app_development/components/text_field_searchbar_home.dart';
import 'package:flutter/material.dart';

class NotFoundPropertyPage extends StatelessWidget {
  // final List<dynamic> filteredData;

  NotFoundPropertyPage({Key? key}) : super(key: key);

  final searchbarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 58, 58, 58),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded),
              color: Color.fromARGB(255, 205, 166, 122),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BottomNavBar()));
              },
            ),
            title: Text(
              'List Properti',
              style: TextStyle(color: Color.fromARGB(255, 205, 166, 122)),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 58, 58, 58),
          body: Center(
            child: Text(
              'Properti tidak dapat ditemukan',
              style: TextStyle(
                  color: Color.fromARGB(255, 205, 166, 122), fontSize: 25),
            ),
          )),
    );
  }
}
