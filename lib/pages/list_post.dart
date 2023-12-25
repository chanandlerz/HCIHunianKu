import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class ListPost extends StatefulWidget {
  const ListPost({super.key});

  @override
  State<ListPost> createState() => _ListPostState();
}

class _ListPostState extends State<ListPost> {
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
          title: Text('List Post'),
        ),
        backgroundColor: Color.fromARGB(255, 58, 58, 58),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                  child: GridView.count(
                    shrinkWrap: true,
                    childAspectRatio: 1.0,
                    crossAxisCount: 3,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      for (int i = 1; i < 30; i++)
                        Container(
                          // padding: EdgeInsets.only(left: 5, right: 10, top: 5),
                          margin:
                              EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                          decoration: BoxDecoration(color: Colors.white),
                          child: InkWell(
                            onTap: () {},
                            child: Image.asset(
                              'assets/property 1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
