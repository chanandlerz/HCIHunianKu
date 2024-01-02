import 'package:app_development/components/filter_property_beli.dart';
import 'package:app_development/pages/detail_property_page.dart';
import 'package:app_development/pages/listing_saya_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter_udid/flutter_udid.dart';
import 'package:app_development/connection.dart';

Connection connection = Connection();

class ListingWidget extends StatefulWidget {
  final List<dynamic> myListingData;
  const ListingWidget({Key? key, required this.myListingData})
      : super(key: key);

  @override
  State<ListingWidget> createState() => _ListingWidgetState();
}

class _ListingWidgetState extends State<ListingWidget> {
  String nullCheck(var value) {
    if (value == null || value == "") {
      return value = "-";
    } else {
      return value.toString();
    }
  }

  bool imageCheck(var value) {
    if (value == null || value == "") {
      return false;
    } else {
      return true;
    }
  }

  String priceHandler(var value) {
    if (value == null || value == "") {
      return "-";
    } else {
      double number = double.parse(value);
      if (number >= 1000000000) {
        number = number / 1000000000;
        String number2 = number.toStringAsFixed(1);
        String price = number2 + " Miliar";
        return price;
      } else if (number >= 1000000) {
        number = number / 1000000;
        String number2 = number.toStringAsFixed(1);
        String price = number2 + " Juta";
        return price;
      } else if (number >= 1000) {
        number = number / 1000;
        String number2 = number.toStringAsFixed(1);
        String price = number2 + " Ribu";
        return price;
      } else {
        return value.toString();
      }
    }
  }

  Future updateStatusProperty(String id, String status) async {
    final Uri url = Uri.http(connection.url, 'updateStatusProperty');
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'id': id,
          'Status': status,
        }));

    if (response.statusCode == 200) {
      print('Data updated successfuly');
    } else {
      print('Failed to update data. Status Code: ${response.statusCode}');
      print('Error Response: ${response.body}');
    }
  }

  Future Status(BuildContext context, String id) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isDismissible: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          double screenWidth = MediaQuery.of(context).size.width;
          double screenHeight = MediaQuery.of(context).size.height;
          return DraggableScrollableSheet(
            initialChildSize: 0.25,
            minChildSize: 0.25,
            maxChildSize: 1,
            expand: false,
            builder: (_, controller) => SizedBox(
              height: screenHeight / 3,
              child: ListView(
                controller: controller,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: screenWidth,
                          child: ElevatedButton(
                            onPressed: () async {
                              await updateStatusProperty(id, "Ready");
                              String udid = await FlutterUdid.udid;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ListingPage(udid: udid),
                                ),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 205, 166, 122),
                              ),
                            ),
                            child: Text('Ready'),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 50,
                          width: screenWidth,
                          child: ElevatedButton(
                            onPressed: () async {
                              await updateStatusProperty(id, "Sold");
                              String udid = await FlutterUdid.udid;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ListingPage(udid: udid),
                                ),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 205, 166, 122),
                              ),
                            ),
                            child: Text('Sold'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List<dynamic> myListingData = widget.myListingData;
    return Column(
      children: [
        for (int i = 0; i < myListingData.length; i++)
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              // height: screenHeight / 5,
              width: screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                //padding: const EdgeInsets.all(8.0),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(id: myListingData[i][0]),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: imageCheck(widget.myListingData[i][13])
                                ? Image.memory(
                                    Base64Codec()
                                        .decode(widget.myListingData[i][13]),
                                    height: 110,
                                    width: 150, // Adjusted width
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    'assets/noImageAvailable.png',
                                    height: 110,
                                    width: 110, // Adjusted width
                                  ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 5),
                                      child: Text(
                                        'RP',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      priceHandler(widget.myListingData[i][5]
                                          .toString()),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  nullCheck(widget.myListingData[i][4]),
                                ),
                                Text(
                                  widget.myListingData[i][2] +
                                      widget.myListingData[i][3],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.bed,
                                      color: Color.fromARGB(255, 205, 166, 122),
                                      size: 15,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 3, right: 5),
                                      child: Text(nullCheck(
                                          widget.myListingData[i][7])),
                                    ),
                                    Icon(
                                      Icons.bathtub_rounded,
                                      color: Color.fromARGB(255, 205, 166, 122),
                                      size: 15,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 3),
                                      child: Text(nullCheck(
                                          widget.myListingData[i][8])),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 40,
                                  height: 12,
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    color: (nullCheck(
                                                widget.myListingData[i][15]) ==
                                            "Ready")
                                        ? Colors.lightGreen
                                        : Colors.red,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    nullCheck(widget.myListingData[i][15]),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                      child: Container(
                        height: 30,
                        width: screenWidth,
                        child: ElevatedButton(
                          onPressed: () async {
                            await Status(
                                context, widget.myListingData[i][0].toString());
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 205, 166, 122),
                            ),
                          ),
                          child: Text('Ubah Status'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
