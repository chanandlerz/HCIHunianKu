import 'package:app_development/components/text_field_searchbar_feeds.dart';
import 'package:flutter/material.dart';

class FeedsPage extends StatefulWidget {
  FeedsPage({super.key});

  @override
  State<FeedsPage> createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  final searchbarController = TextEditingController();

  // void performSearch(String query) {
  //   Navigator.pushNamed(context, '/result', arguments: query);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 58, 58, 58),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SearchTextFieldFeedsPage(
                controller: searchbarController,
                hintText: 'Find Property, Land, and more...',
                obscureText: false,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 20,
              ),
              for (int i = 1; i < 5; i++)
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Container(
                    width: double.infinity,
                    height: 430.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
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
                                      width: 60.0,
                                      height: 60.0,
                                      fit: BoxFit.cover,
                                    )),
                                  ),
                                ),
                                title: Text(
                                  'Bambang',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text('10 jam yang lalu'),
                                trailing: IconButton(
                                  icon: Icon(Icons.more_horiz),
                                  color: Colors.black,
                                  onPressed: () {},
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10.0),
                                child: Text(
                                    'Dicari rumah seperti dibawah ini (ga terlalu mirip gapapa) wilayah JABODETABEK.'),
                              ),
                              Container(
                                margin: EdgeInsets.all(10.0),
                                width: double.infinity,
                                height: 200.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/property 1.png'),
                                      fit: BoxFit.fitWidth,
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 55.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            IconButton(
                                              icon: Icon(Icons.favorite_border),
                                              iconSize: 35.0,
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 150,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            IconButton(
                                              icon: Icon(Icons.chat),
                                              iconSize: 35.0,
                                              onPressed: () {},
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
