import 'package:app_development/components/filter_property_beli.dart';
import 'package:app_development/pages/detail_property_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';

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
              height: screenHeight / 5,
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
                                  widget.myListingData[i][3] +
                                      " di" +
                                      widget.myListingData[i][2],
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
                                  width: 30,
                                  height: 12,
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    color: Colors.lightGreen,
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
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 160,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 205, 166, 122),
                                ),
                              ),
                              child: Text('Ubah Status'),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 160,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 205, 166, 122),
                                ),
                              ),
                              child: Text('Ubah Deskripsi'),
                            ),
                          ),
                        ],
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
