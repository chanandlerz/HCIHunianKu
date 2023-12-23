import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  late List<dynamic> comparePropertyData;

  @override
  void initState() {
    super.initState();
    comparePropertyData = [];

    if (widget.propertyId1.isNotEmpty) {
      id1 = int.tryParse(widget.propertyId1);
    }

    if (widget.propertyId2.isNotEmpty) {
      id2 = int.tryParse(widget.propertyId2);
    }

    fetchCompareProperty();
  }

  Future<void> fetchCompareProperty() async {
    final Uri url =
        Uri.https('hunianku.juanfredoalexiu.repl.co', 'compareProperty');
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
    return value?.isEmpty ?? true ? "-" : value.toString();
  }

  bool imageCheck(var value) {
    return value?.isEmpty ?? true ? false : true;
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
                        onPressed: () {},
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
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15.0, top: 20.0),
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
                                Text(nullCheck(comparePropertyData[0][5])),
                                Text(
                                  nullCheck(comparePropertyData[0][3]) +
                                      nullCheck(comparePropertyData[0][2]),
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
                                Center(
                                  child: Container(
                                    width: screenWidth,
                                    child: ElevatedButton(
                                      child: Text('Pilih Properti 1'),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          Color.fromARGB(255, 205, 166, 122),
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0, top: 20.0),
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
                                Text(nullCheck(comparePropertyData[1][5])),
                                Text(
                                  nullCheck(comparePropertyData[1][3]) +
                                      nullCheck(comparePropertyData[1][2]),
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
                                Center(
                                  child: Container(
                                    width: screenWidth,
                                    child: ElevatedButton(
                                      child: Text('Pilih Properti 2'),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          Color.fromARGB(255, 205, 166, 122),
                                        ),
                                      ),
                                      onPressed: () {},
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
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Container(
                      width: screenWidth,
                      child: ElevatedButton(
                        child: Text('Perbandingan Lainnya'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 205, 166, 122),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
