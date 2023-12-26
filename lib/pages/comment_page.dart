import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:app_development/pages/feeds_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_udid/flutter_udid.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class CommentPage extends StatefulWidget {
  final String? udid;

  final Post post;
  CommentPage({required this.post, Key? key, this.udid}) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final TextEditingController komenController = TextEditingController();

  List<dynamic> listKomen = [];

  bool imageCheck(var value) {
    if (value == null || value == "") {
      return false;
    } else {
      return true;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchComments();
  }

  Future<void> fetchComments() async {
    try {
      final Uri url =
          Uri.https('hunianku.juanfredoalexiu.repl.co', 'fetchComment');
      final response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'id': widget.post.id,
          }));

      if (response.statusCode == 200) {
        setState(() {
          listKomen = jsonDecode(response.body);
        });
      } else {
        print('Failed to fetch comments. Status Code: ${response.statusCode}');
        print('Error Response: ${response.body}');
      }
    } catch (error) {
      print('Error during comment fetching: $error');
    }
  }

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
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
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
            title: Text(
              widget.post.username ?? '',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              widget.post.date ?? '',
              style: TextStyle(color: Colors.white),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.more_horiz),
              color: Colors.white,
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 10, top: 20, bottom: 20),
            child: Container(
              child: Text(
                widget.post.caption ?? '',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: InstaImageViewer(
                child: Container(
                  width: double.infinity,
                  height: imageCheck(widget.post.image) &&
                          (widget.post.caption != null)
                      ? 200.0
                      : 0.0,
                  child: Visibility(
                    visible: imageCheck(widget.post.image) &&
                        (widget.post.caption != null),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: imageCheck(widget.post.image)
                            ? DecorationImage(
                                image: MemoryImage(
                                    base64Decode(widget.post.image!)),
                                fit: BoxFit.fitWidth,
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                // Padding(
                //   padding: EdgeInsets.only(right: 30),
                //   child: Text(
                //     '3 Likes',
                //     style: TextStyle(color: Colors.white),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: IconButton(
                    icon: Icon(Icons.comment),
                    color: Color.fromARGB(255, 205, 166, 122),
                    onPressed: () {},
                  ),
                ),
                Text(
                  listKomen.length.toString() + ' Comments',
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
                  children: [],
                )
              ],
            ),
          ),
          for (int i = 0; i < listKomen.length; i++)
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Wrap(
                          children: [
                            Column(children: [
                              Container(
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
                                        listKomen.isNotEmpty
                                            ? listKomen[i][2]
                                            : '',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Wrap(
                                      children: [
                                        Container(
                                          child: Text(listKomen.isNotEmpty
                                              ? listKomen[i][3]
                                              : ''),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ]),
                          ],
                        ),
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
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 58, 58, 58),
        child: Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5, right: 20, left: 20),
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: TextFormField(
              controller: komenController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    color: Color.fromARGB(255, 205, 166, 122),
                    onPressed: () async {
                      String udid = await FlutterUdid.udid;
                      final Uri url = Uri.https(
                        'hunianku.juanfredoalexiu.repl.co',
                        'postKomen',
                      );

                      final response = await http.post(
                        url,
                        headers: {'Content-Type': 'application/json'},
                        body: jsonEncode({
                          'id': widget.post.id,
                          'udid': udid,
                          'komen': komenController.text,
                        }),
                      );

                      fetchComments();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommentPage(post: widget.post),
                        ),
                      );
                    },
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 205, 166, 122))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 205, 166, 122))),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 205, 166, 122))),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 205, 166, 122))),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  hintText: 'Komen'),
            ),
          ),
        ),
      ),
    ));
  }
}
