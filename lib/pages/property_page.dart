import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:app_development/components/property_page_grid.dart';
import 'package:app_development/components/filter_property_beli.dart';
import 'package:app_development/components/filter_property_sewa.dart';
import 'package:app_development/components/text_field_searchbar_home.dart';
import 'package:flutter/material.dart';

class PropertyPage extends StatelessWidget {
  final List<dynamic> filteredData;

  PropertyPage({Key? key, required this.filteredData}) : super(key: key);

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
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  PropertyWidget(filteredData: filteredData),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
