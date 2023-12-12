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
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20.0, left: 20.0),
                  child: Container(
                      width: screenWidth,
                      height: 500.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)),
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
                                      child: Image.asset(
                                        'assets/property 1.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Row(
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
                                  Text('Rawamangun, Jakarta Timur'),
                                  Text('Kost Disewakan'),
                                  Row(
                                    children: <Widget>[
                                      Column(
                                        children: [
                                          Icon(Icons.layers_rounded),
                                          Icon(Icons.bed),
                                          Icon(Icons.shower_rounded),
                                          Icon(Icons.bathtub_rounded),
                                          Icon(Icons.wc_rounded),
                                          Icon(Icons.expand),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Text(
                                              '9',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                          Text(
                                            '9',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            '1',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            '1',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            'dalam',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            'campur',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            '-',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )),
                          Padding(
                            padding: EdgeInsets.only(right: 15.0, top: 20.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 150,
                                  height: 80,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: Image.asset(
                                      'assets/property 1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Row(
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
                                Text('Rawamangun, Jakarta Timur'),
                                Text('Kost Disewakan'),
                                Row(
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        Icon(Icons.layers_rounded),
                                        Icon(Icons.bed),
                                        Icon(Icons.shower_rounded),
                                        Icon(Icons.bathtub_rounded),
                                        Icon(Icons.wc_rounded),
                                        Icon(Icons.expand),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            '9',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        Text(
                                          '9',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          '1',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          '1',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          'dalam',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          'campur',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          '-',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
