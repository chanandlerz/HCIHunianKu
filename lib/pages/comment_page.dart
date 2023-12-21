import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 58, 58, 58),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 58, 58, 58),
            leading: IconButton(
              icon: Icon(Icons.close),
              color: Color.fromARGB(255, 205, 166, 122),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BottomNavBar()));
              },
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 10, bottom: 30),
            child: ListView(
              children: [
                ListTile(
                  leading: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      child: ClipOval(
                          child: Image.asset(
                        'assets/profile1.jpg',
                        fit: BoxFit.cover,
                      )),
                    ),
                  ),
                  title: const Text(
                    'memories',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    '10 jam yang lalu',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.more_horiz),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 10, top: 20, bottom: 20),
                  child: Container(
                    child: Text(
                      'testing testing testing testing',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage('assets/property 1.png'))),
                    // child: Image.asset('assets/property 1.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 5),
                        child: IconButton(
                          icon: Icon(Icons.favorite_border_rounded),
                          color: Color.fromARGB(255, 205, 166, 122),
                          onPressed: () {},
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: Text(
                          '3 Likes',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: IconButton(
                          icon: Icon(Icons.comment),
                          color: Color.fromARGB(255, 205, 166, 122),
                          onPressed: () {},
                        ),
                      ),
                      Text(
                        '5 Comments',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 10, left: 10),
                  child: Text(
                    'Comments',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // SizedBox(
                          //   width: 5,
                          // ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Column(children: [
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: CircleAvatar(
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/profile1.jpg',
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),

                          //   ],
                          // ),
                          Column(children: [
                            Container(
                              height: 55,
                              // width: 100,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      'memories',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text('test test test test'),
                                  )
                                ],
                              ),
                            )
                          ]),

                          // SizedBox(
                          //   width: 15.0,
                          // )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // SizedBox(
                          //   width: 5,
                          // ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Column(children: [
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: CircleAvatar(
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/profile1.jpg',
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),

                          //   ],
                          // ),
                          Column(children: [
                            Container(
                              height: 55,
                              // width: 200,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      'memories',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text('testing')
                                ],
                              ),
                            )
                          ]),

                          // SizedBox(
                          //   width: 15.0,
                          // )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Column(
                    children: [
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(children: [
                            Container(
                              // height: 55,
                              // width: 200,

                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      'memories',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    'adalah benar hehehehehehehehe',
                                    softWrap: true,
                                  )
                                ],
                              ),
                            )
                          ]),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(children: [
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: CircleAvatar(
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/profile1.jpg',
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),

                          // SizedBox(
                          //   width: 15.0,
                          // )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
