import 'package:app_development/pages/detail_property_page.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';

class PropertyWidget extends StatelessWidget {
  final List<dynamic> filteredData;

  const PropertyWidget({Key? key, required this.filteredData})
      : super(key: key);

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
    return GridView.count(
      childAspectRatio: 0.68,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 0; i < filteredData.length; i++)
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
            margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(id: filteredData[i][0]),
                  ),
                );
              },
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(1),
                      child: imageCheck(filteredData[i][13])
                          ? Image.memory(
                              Base64Codec().decode(filteredData[i][13]),
                              height: 110,
                              width: 500,
                            )
                          : Image.asset(
                              'assets/noImageAvailable.png',
                              height: 110,
                              width: 500,
                            ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 8, top: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      nullCheck(filteredData[i][14]),
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      priceHandler(filteredData[i][5].toString()),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      nullCheck(filteredData[i][4]),
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      filteredData[i][3] + " di" + filteredData[i][2],
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          children: [
                            Icon(
                              Icons.bed,
                              color: Color.fromARGB(255, 205, 166, 122),
                              size: 15,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 3, right: 5),
                              child: Text(nullCheck(filteredData[i][7])),
                            ),
                            Icon(
                              Icons.bathtub_rounded,
                              color: Color.fromARGB(255, 205, 166, 122),
                              size: 15,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 3),
                              child: Text(nullCheck(filteredData[i][8])),
                            ),
                          ],
                        ),
                        // Icon(
                        //   Icons.favorite_border,
                        //   color: Color.fromARGB(255, 205, 166, 122),
                        // )
                      ],
                    ),
                  ),

                  // const SizedBox(
                  //   height: 5,
                  // ),
                  // SizedBox(
                  //   height: 30,
                  //   width: 150,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor:
                  //           const Color.fromARGB(255, 205, 166, 122),
                  //     ),
                  //     onPressed: () {},
                  //     child: const Text(
                  //       "Hubungi Penjual",
                  //       style: TextStyle(color: Colors.white, fontSize: 15),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          )
      ],
    );
  }
}
