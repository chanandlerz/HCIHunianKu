import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ComparePage extends StatefulWidget {
  const ComparePage({super.key});

  @override
  State<ComparePage> createState() => _ComparePageState();
}

class _ComparePageState extends State<ComparePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 58, 58, 58),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
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
                          height: screenHeight / 2,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 15.0, top: 20.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 80,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: Image.asset(
                                            'assets/property 1.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Row(
                                          children: [
                                            Text('RP'),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '1,8 Juta',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text('Rawamangun, Jakarta Timur'),
                                      Text('Kost Disewakan'),
                                      Padding(
                                          padding: EdgeInsets.only(top: 20),
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 10),
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
                                                      '9',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(top: 5),
                                                    child: Text(
                                                      '1',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(top: 5),
                                                    child: Text(
                                                      '1',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(top: 5),
                                                    child: Text(
                                                      'dalam',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(),
                                                    child: Text(
                                                      'campur',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(top: 5),
                                                    child: Text(
                                                      '-',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )),
                                    ],
                                  )),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: 15.0, top: 20.0),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 80,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        child: Image.asset(
                                          'assets/property 1.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: [
                                          Text('RP'),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '3 Juta',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text('Pasar Rebo, Jakarta Timur'),
                                    Text('Kost Disewakan'),
                                    Padding(
                                        padding: EdgeInsets.only(top: 20),
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
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
                                                    '5',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5),
                                                  child: Text(
                                                    '2',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5),
                                                  child: Text(
                                                    '1',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5),
                                                  child: Text(
                                                    'luar',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(),
                                                  child: Text(
                                                    'pria',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5),
                                                  child: Text(
                                                    '-',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Container(
                        width: screenWidth,
                        child: ElevatedButton(
                          child: Text('Perbandingan Lainnya'),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 205, 166, 122))),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
