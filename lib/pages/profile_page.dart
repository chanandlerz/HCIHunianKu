import 'package:app_development/pages/edit_profile_page.dart';
import 'package:app_development/pages/favorites_page.dart';
import 'package:app_development/pages/listing_saya_page.dart';
import 'package:app_development/pages/list_post.dart';
import 'package:app_development/pages/login_page.dart';
import 'package:app_development/pages/pasang_iklan_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_share/whatsapp_share.dart';
import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String udid;
  List<dynamic> myProfileData = [];

  @override
  void initState() {
    super.initState();
    getUdid();
    fetchProfileDataFromServer();
  }

  Future<void> getUdid() async {
    udid = await FlutterUdid.udid;
  }

  Future fetchProfileDataFromServer() async {
    //current work
    //getUdid();
    String udid = await FlutterUdid.udid;
    final Uri url = Uri.https('hunianku.juanfredoalexiu.repl.co', 'profile');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'udid': udid,
      }),
    );

    if (response.statusCode == 200) {
      print('Data fetched successfuly');
      setState(() {
        myProfileData = jsonDecode(response.body);
        print(myProfileData);
      });
    } else {
      print('Failed to fetch data. Status Code: ${response.statusCode}');
      print('Error Response: ${response.body}');
    }
  }

  String nullCheck(var value) {
    if (value == null || value == "") {
      return value = "-";
    } else {
      return value.toString();
    }
  }

  bool imageCheck(var value) {
    if (value == null || value == "") {
      return false;
    } else {
      return true;
    }
  }

  _launchURL() async {
    String whatsAppLink = 'https://wa.me/+6287771895606';
    print(whatsAppLink);
    Uri _url = Uri.parse(whatsAppLink);
    if (await launchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (myProfileData.length > 0) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 58, 58, 58),
        body: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(
                        children: [
                          SizedBox(
                            width: 70.0,
                            height: 70.0,
                            child: CircleAvatar(
                              child: ClipOval(
                                child:
                                    // Image.asset(
                                    //   'assets/profile1.jpg',
                                    //   width: 100.0,
                                    //   height: 100.0,
                                    //   fit: BoxFit.cover,
                                    // ),
                                    imageCheck(myProfileData[0][5])
                                        ? Image.memory(
                                            Base64Codec()
                                                .decode(myProfileData[0][5]),
                                            // height: 210,
                                            // width: 250,
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            'assets/noProfile.png',
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Text(
                                  '@' +
                                      //'@memories',
                                      nullCheck(myProfileData[0][1]),
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 205, 166, 122),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: IconButton(
                          icon: Icon(Icons.favorite),
                          color: Color.fromARGB(255, 205, 166, 122),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FavoritesPage()));
                          },
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 5.0),
                  child: Container(
                    width: double.infinity,
                    height: 90.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // SizedBox(
                            //   width: 30,
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: IconButton(
                                icon: const Icon(Icons.settings),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditProfile()));
                                },
                                color: const Color.fromARGB(255, 205, 166, 122),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: IconButton(
                                icon: const Icon(Icons.info),
                                onPressed: () {},
                                color: const Color.fromARGB(255, 205, 166, 122),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: IconButton(
                                icon:
                                    const Icon(Icons.my_library_books_rounded),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ListPost(udid: udid)));
                                },
                                color: const Color.fromARGB(255, 205, 166, 122),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: IconButton(
                                icon: const Icon(Icons.home),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ListingPage(udid: udid)));
                                },
                                color: const Color.fromARGB(255, 205, 166, 122),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(),
                                  child: Text(
                                    'Pengaturan\nProfil',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 205, 166, 122)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(),
                                  child: Text(
                                    'Info\nLangganan',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 205, 166, 122)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(),
                                  child: Text(
                                    'Postingan\nSaya',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 205, 166, 122)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(),
                                  child: Text(
                                    'Listing\nSaya',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 205, 166, 122)),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 5.0),
                  child: Container(
                    width: double.infinity,
                    height: 190,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0, top: 20.0),
                              child: Text(
                                'Ingin menjual atau menyewakan\nproperty anda?',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0, top: 5.0),
                              child: Text(
                                'Tayangkan iklan dengan\nbeberapa langkah\nmudah',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 157, 157, 157)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 15.0, bottom: 15.0),
                              child: SizedBox(
                                height: 50,
                                width: 120,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const FilterPasangIklan()),
                                    );
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color.fromARGB(
                                                  255, 51, 54, 63)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10.0)))),
                                  child: const Text(
                                    'Pasang Iklan',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 205, 166, 122)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, right: 20),
                              child: Image.asset(
                                'assets/profileprofile.png',
                                width: 110,
                                height: 110,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.call),
                          onPressed: () {},
                          color: const Color.fromARGB(255, 205, 166, 122),
                        ),
                        const Expanded(
                          child: Text(
                            'Hubungi Kami',
                            style: TextStyle(
                                color: Color.fromARGB(255, 205, 166, 122)),
                          ),
                        ),
                        // SizedBox(
                        //   width: 180,
                        // ),
                        IconButton(
                          icon: const Icon(Icons.keyboard_arrow_right_rounded),
                          color: const Color.fromARGB(255, 205, 166, 122),
                          onPressed: () {
                            _launchURL();
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 350,
                    child: Divider(
                      color: Color.fromARGB(255, 205, 166, 122),
                      thickness: 1.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.share),
                          onPressed: () {},
                          color: const Color.fromARGB(255, 205, 166, 122),
                        ),
                        const Expanded(
                          child: Text(
                            'Undang Rekan',
                            style: TextStyle(
                                color: Color.fromARGB(255, 205, 166, 122)),
                          ),
                        ),
                        // SizedBox(
                        //   width: 180,
                        // ),
                        IconButton(
                          icon: const Icon(Icons.keyboard_arrow_right_rounded),
                          color: const Color.fromARGB(255, 205, 166, 122),
                          onPressed: () {
                            // share();
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 350,
                    child: Divider(
                      color: Color.fromARGB(255, 205, 166, 122),
                      thickness: 1.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.sticky_note_2_rounded),
                          onPressed: () {},
                          color: const Color.fromARGB(255, 205, 166, 122),
                        ),
                        const Expanded(
                          child: Text(
                            'Syarat dan Kebijakan Privasi',
                            style: TextStyle(
                                color: Color.fromARGB(255, 205, 166, 122)),
                          ),
                        ),
                        // SizedBox(
                        //   width: 106,
                        // ),
                        IconButton(
                          icon: const Icon(Icons.keyboard_arrow_right_rounded),
                          color: const Color.fromARGB(255, 205, 166, 122),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 350,
                    child: Divider(
                      color: Color.fromARGB(255, 205, 166, 122),
                      thickness: 1.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.logout),
                          color: const Color.fromARGB(255, 205, 166, 122),
                          onPressed: () async {
                            String udid = await FlutterUdid.udid;

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => LoginPage(udid: udid)));

                            Navigator.pushReplacementNamed(context, '/login',
                                arguments: {'udid': ''});
                          },
                        ),
                        const Expanded(
                          child: Text(
                            'Keluar',
                            style: TextStyle(
                                color: Color.fromARGB(255, 205, 166, 122)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),

                // ElevatedButton(
                //   onPressed: () {
                //     logout(context);
                //   },
                //   child: Text('Logout'),
                // )
              ],
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
  // Future<void> logout(BuildContext context) async {
  //   // Clear user credentials from shared preferences
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('username');
  //   await prefs.remove('password');

  //   // Navigate to the login page
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => LoginPage(udid: '',)),
  //   );
  // }

  void _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);

    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const LoginPage(
        udid: '',
      ),
    ));
  }
}