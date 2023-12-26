import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:app_development/pages/comment_page.dart';
import 'package:app_development/pages/filter_property_page.dart';

class ListPost extends StatefulWidget {
  final String? udid;
  const ListPost({Key? key, required this.udid}) : super(key: key);

  @override
  State<ListPost> createState() => _ListPostState();
}

class _ListPostState extends State<ListPost> {
  List<dynamic> myListingForum = [];
  bool favorite = false;

  @override
  void initState() {
    super.initState();
    fetchListingForumFromServer();
  }

  void activeFavorite() {
    setState(() {
      favorite = !favorite;
    });
  }

  bool imageCheck(String? value) {
    return value != null && value.isNotEmpty;
  }

  Future<void> fetchListingForumFromServer() async {
    final Uri url = Uri.https('hunianku.juanfredoalexiu.repl.co', 'listForum');
    print(widget.udid);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'udid': widget.udid}),
    );

    if (response.statusCode == 200) {
      print('Data fetched successfuly');
      setState(() {
        myListingForum = jsonDecode(response.body);
        print(myListingForum);
      });
    } else {
      print('Failed to fetch data. Status Code: ${response.statusCode}');
      print('Error Response: ${response.body}');
    }
  }

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
          children: <Widget>[
            Column(
              children: [
                for (int i = 0; i < myListingForum.length; i++)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      width: double.infinity,
                      // height: 420.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
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
                                        width: 60.0,
                                        height: 60.0,
                                        fit: BoxFit.cover,
                                      )),
                                    ),
                                  ),
                                  title: Text(
                                    myListingForum[i][2],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    myListingForum[i][5],
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.more_horiz),
                                    color: Colors.black,
                                    onPressed: () {},
                                  ),
                                ),
                                // Wrap(
                                //   alignment: WrapAlignment.start,
                                //   children: [
                                //     Text(
                                //       posts[i].caption ?? '',
                                //       textAlign: TextAlign.start,
                                //     )
                                //   ],
                                // ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 10),
                                  child: Wrap(
                                    alignment: WrapAlignment.start,
                                    children: [
                                      Text(
                                        myListingForum[i][3],
                                        textAlign: TextAlign.start,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  width: double.infinity,
                                  height: imageCheck(myListingForum[i][6]) &&
                                          (myListingForum[i][6] != null)
                                      ? 200.0
                                      : 0.0,
                                  child: Visibility(
                                    visible: imageCheck(myListingForum[i][6]) &&
                                        (myListingForum[i][6] != null),
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        image: imageCheck(myListingForum[i][6])
                                            ? DecorationImage(
                                                image: MemoryImage(base64Decode(
                                                    myListingForum[i][6])),
                                                fit: BoxFit.fitWidth,
                                              )
                                            : null,
                                      ),
                                    ),
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
            ),
          ],
        ),
      ),
    );
  }
}
