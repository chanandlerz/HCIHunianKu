import 'package:app_development/pages/favorites_page.dart';
import 'package:app_development/pages/pick2_from_favorites.dart';
import 'package:app_development/pages/pick1_from_favorites.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SelectedIds {
  static int? savedId1;
  static int? savedId2;
}

class ComparePage extends StatefulWidget {
  final String propertyId1;
  final String propertyId2;

  ComparePage({required this.propertyId1, required this.propertyId2});

  @override
  State<ComparePage> createState() => _ComparePageState();
}

class _ComparePageState extends State<ComparePage> {
  int? id1;
  int? id2;

  List<dynamic> comparePropertyData = [];

  @override
  void initState() {
    super.initState();
    comparePropertyData = [];

    //id1 = savedId1;
    ///id2 = savedId2;
    print("======THIS IS BEFORE ASSIGNED===");
    print("id1 : ${widget.propertyId1 ?? 'null'}");
    print("id2 : ${widget.propertyId2 ?? 'null'}");
    print("savedId1 : ${SelectedIds.savedId1 ?? 'null'}");
    print("savedId2 : ${SelectedIds.savedId2 ?? 'null'}");

    if (widget.propertyId1 != "") {
      print("id1 is not empty");
      id1 = int.tryParse(widget.propertyId1);
      SelectedIds.savedId1 = id1;
      //id2 = savedId2;
    } else {
      print("id1 is empty");
      id1 = SelectedIds.savedId1;
    }

    if (widget.propertyId2 != "") {
      print("id2 is not empty");
      id2 = int.tryParse(widget.propertyId2);
      SelectedIds.savedId2 = id2;
      //id1 = savedId1;
    } else {
      print("id2 is empty");
      id2 = SelectedIds.savedId2;
    }

    print("======THIS IS AFTER ASSIGNED===");
    print("id1 : ${id1 ?? 'null'}");
    print("id2 : ${id2 ?? 'null'}");
    print("savedId1 : ${SelectedIds.savedId1 ?? 'null'}");
    print("savedId2 : ${SelectedIds.savedId2 ?? 'null'}");

    fetchCompareProperty();
  }

  Future<void> fetchCompareProperty() async {
    final Uri url =
        Uri.https('hcihunianku--memories053.repl.co', 'compareProperty');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'id1': id1,
          'id2': id2,
        }),
      );

      if (response.statusCode == 200) {
        print('Data fetched successfully');
        setState(() {
          comparePropertyData = jsonDecode(response.body);
        });
      } else {
        print('Failed to fetch data. Status Code: ${response.statusCode}');
        print('Error Response: ${response.body}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  String nullCheck(var value) {
    if (value == null || value == "" || value == "null") {
      return value = "-";
    } else {
      return value.toString();
    }
  }

  bool imageCheck(var value) {
    if (value == null || value == "" || value == "null") {
      return false;
    } else {
      return true;
    }
  }

  String priceHandler(var value) {
    if (value == null || value == "" || value == "null") {
      return "-";
    } else {
      String stringtValue = value.toString();
      double number = double.parse(stringtValue);
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

    if (comparePropertyData.length > 0) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 58, 58, 58),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios_new_rounded),
                          color: Color.fromARGB(255, 205, 166, 122),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FavoritesPage()));
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 14),
                          child: Text(
                            'Perbandingan Properti',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 205, 166, 122)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color.fromARGB(255, 184, 184, 184),
                thickness: 1.0,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.0, left: 20.0),
                      child: Container(
                        width: screenWidth,
                        // height: screenHeight / 2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, top: 20.0, bottom: 20),
                              child: Column(
                                children: [
                                  Container(
                                    width: 150,
                                    height: 80,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: imageCheck(
                                        comparePropertyData[0][13],
                                      )
                                          ? Image.memory(
                                              Base64Codec().decode(
                                                comparePropertyData[0][13],
                                              ),
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset(
                                              'assets/noImageAvailable.png',
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Text('RP'),
                                        SizedBox(width: 5),
                                        Text(
                                          priceHandler(
                                            comparePropertyData[0][5],
                                          ),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Wrap(
                                    children: [
                                      Container(
                                        child: Text(
                                          nullCheck(comparePropertyData[0][4]),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    nullCheck(comparePropertyData[0][3]) +
                                        nullCheck(comparePropertyData[0][2]),
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Column(
                                            children: [
                                              Icon(Icons.layers_rounded),
                                              Icon(Icons.bed),
                                              Icon(Icons.shower_rounded),
                                              Icon(Icons.bathtub_rounded),
                                              Icon(Icons.wc_rounded),
                                              Icon(Icons.expand),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(),
                                              child: Text(
                                                nullCheck(
                                                  comparePropertyData[0][6],
                                                ),
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(
                                                nullCheck(
                                                  comparePropertyData[0][7],
                                                ),
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(
                                                nullCheck(
                                                  comparePropertyData[0][8],
                                                ),
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(
                                                nullCheck(
                                                  comparePropertyData[0][9],
                                                ),
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(),
                                              child: Text(
                                                nullCheck(
                                                  comparePropertyData[0][10],
                                                ),
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(
                                                nullCheck(
                                                  comparePropertyData[0][11],
                                                ),
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Center(
                                      child: Container(
                                        width: screenWidth / 3,
                                        child: ElevatedButton(
                                          child: Text('Pilih Properti 1'),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                              Color.fromARGB(
                                                  255, 205, 166, 122),
                                            ),
                                          ),
                                          onPressed: () {
                                            //savedId1 = id1;
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Pick1FromFavoritesPage()));
                                          },
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 20.0, right: 10, bottom: 20),
                              child: Column(
                                children: [
                                  Container(
                                    width: 150,
                                    height: 80,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: imageCheck(
                                        comparePropertyData[1][13],
                                      )
                                          ? Image.memory(
                                              Base64Codec().decode(
                                                comparePropertyData[1][13],
                                              ),
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset(
                                              'assets/noImageAvailable.png',
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Text('RP'),
                                        SizedBox(width: 5),
                                        Text(
                                          priceHandler(
                                            comparePropertyData[1][5],
                                          ),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    nullCheck(comparePropertyData[0][4]),
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    nullCheck(comparePropertyData[1][3]) +
                                        nullCheck(comparePropertyData[1][2]),
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Column(
                                            children: [
                                              Icon(Icons.layers_rounded),
                                              Icon(Icons.bed),
                                              Icon(Icons.shower_rounded),
                                              Icon(Icons.bathtub_rounded),
                                              Icon(Icons.wc_rounded),
                                              Icon(Icons.expand),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(),
                                              child: Text(
                                                nullCheck(
                                                  comparePropertyData[1][6],
                                                ),
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(
                                                nullCheck(
                                                  comparePropertyData[1][7],
                                                ),
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(
                                                nullCheck(
                                                  comparePropertyData[1][8],
                                                ),
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(
                                                nullCheck(
                                                  comparePropertyData[1][9],
                                                ),
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(),
                                              child: Text(
                                                nullCheck(
                                                  comparePropertyData[1][10],
                                                ),
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(
                                                nullCheck(
                                                  comparePropertyData[1][11],
                                                ),
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Center(
                                      child: Container(
                                        width: screenWidth / 3,
                                        child: ElevatedButton(
                                          child: Text('Pilih Properti 2'),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                              Color.fromARGB(
                                                  255, 205, 166, 122),
                                            ),
                                          ),
                                          onPressed: () {
                                            //savedId2 = id2;
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Pick2FromFavoritesPage()));
                                          },
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //                   Padding(
                    //   padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    //   child: Container(
                    //     width: screenWidth,
                    //     child: ElevatedButton(
                    //       child: Text('Perbandingan Lainnya'),
                    //       style: ButtonStyle(
                    //         backgroundColor: MaterialStateProperty.all<Color>(
                    //           Color.fromARGB(255, 205, 166, 122),
                    //         ),
                    //       ),
                    //       onPressed: () {},
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
