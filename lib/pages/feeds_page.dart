import 'package:app_development/components/filter_property_beli.dart';
import 'package:app_development/components/filter_property_sewa.dart';
import 'package:app_development/pages/create_post_page.dart';
import 'package:app_development/pages/favorites_page.dart';
import 'package:app_development/pages/filter_property_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Forum {
  String? username;
  String? caption;
  String? date;
  int? id;
  String? udid;
  String? image;

  Forum(
      {this.username, this.caption, this.date, this.id, this.udid, this.image});

  Forum.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    caption = json['caption'];
    date = json['date'];
    id = json['id'];
    udid = json['udid'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['caption'] = this.caption;
    data['date'] = this.date;
    data['id'] = this.id;
    data['udid'] = this.udid;
    data['image'] = this.image;
    return data;
  }
}

class Post {
  String? username;
  String? caption;
  String? date;
  int? id;
  String? udid;
  String? image;

  Post(
      {this.username, this.caption, this.date, this.id, this.udid, this.image});

  factory Post.fromForum(Forum forum) {
    return Post(
      username: forum.username,
      caption: forum.caption,
      date: forum.date,
      id: forum.id,
      udid: forum.udid,
      image: forum.image,
    );
  }

  @override
  String toString() {
    return 'Post{username: $username, caption: $caption, date: $date, id: $id, udid: $udid, image: $image}';
  }
}

Future<List<Forum>> fetchPostsFromServer() async {
  final Uri url = Uri.https('debug.lubisputri16.repl.co', 'postForum');
  final response = await http.get(
    url,
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (responseData.containsKey('Forum')) {
      List<dynamic> forumData = responseData['Forum'];
      List<Forum> posts =
          forumData.map((data) => Forum.fromJson(data)).toList();
      return posts;
    } else {
      throw Exception('Malformed response: Missing key "Forum"');
    }
  } else {
    throw Exception(
        'Failed to load posts. Status code: ${response.statusCode}');
  }
}

class FeedsPage extends StatefulWidget {
  const FeedsPage({super.key});

  @override
  State<FeedsPage> createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  final searchbarController = TextEditingController();
  bool favorite = false;
  List<Post> posts = [];

  void activeFavorite() {
    setState(() {
      if (favorite) {
        favorite = false;
      } else {
        favorite = true;
      }
    });
  }

  bool imageCheck(var value) {
    if (value == null || value == "") {
      return false;
    } else {
      return true;
    }
  }

  // void performSearch(String query) {
  //   Navigator.pushNamed(context, '/result', arguments: query);
  // }

  @override
  void initState() {
    super.initState();
    fetchDataFromLocal();
    fetchDataFromServer();
  }

  Future<void> fetchDataFromLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? postsJson = prefs.getString('posts');

    if (postsJson != null) {
      List<dynamic> forumData = json.decode(postsJson);
      setState(() {
        posts = forumData
            .map((forum) => Post.fromForum(Forum.fromJson(forum)))
            .toList();
      });
    }
  }

  Future<void> fetchDataFromServer() async {
    try {
      List<Forum> forumData = await fetchPostsFromServer();
      setState(() {
        posts = forumData.map((forum) => Post.fromForum(forum)).toList();
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('posts', json.encode(forumData));
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 58, 58, 58),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'HunianKu',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Wrap(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications),
                        onPressed: () {},
                        color: const Color.fromARGB(255, 205, 166, 122),
                      ),
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FilterProperty()));
                        },
                        color: Color.fromARGB(255, 205, 166, 122),
                      )
                    ],
                  )
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     // buildButton(
              //     //   text: 'testing',
              //     //   onClicked: () => showModalBottomSheet(
              //     //     isScrollControlled: true,
              //     //     backgroundColor: Colors.transparent,
              //     //     context: context,
              //     //     builder: (context) => buildSheet(),
              //     //   ),
              //     // )

              //     IconButton(
              //       icon: Icon(Icons.filter_alt),
              //       onPressed: () {},
              //     )
              //   ],
              // ),

              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              for (int i = 0; i < posts.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
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
                                  posts[i].username ?? '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(posts[i].date ?? ''),
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
                                      posts[i].caption ?? '',
                                      textAlign: TextAlign.start,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                width: double.infinity,
                                height: imageCheck(posts[i].image) &&
                                        (posts[i].caption != null)
                                    ? 200.0
                                    : 0.0,
                                child: Visibility(
                                  visible: imageCheck(posts[i].image) &&
                                      (posts[i].caption != null),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: imageCheck(posts[i].image)
                                          ? DecorationImage(
                                              image: MemoryImage(base64Decode(
                                                  posts[i].image!)),
                                              fit: BoxFit.fitWidth,
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(favorite
                                          ? Icons.favorite_border
                                          : Icons.favorite),
                                      color:
                                          favorite ? Colors.black : Colors.pink,
                                      iconSize: 35.0,
                                      onPressed: activeFavorite,
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.chat),
                                      iconSize: 35.0,
                                      onPressed: () {},
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
