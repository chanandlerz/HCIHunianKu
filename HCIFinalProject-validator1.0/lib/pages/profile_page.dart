import 'package:app_development/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 58, 58, 58),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Icon(
              //         Icons.format_list_bulleted,
              //         color: Color.fromARGB(255, 205, 166, 122),
              //         size: 25.0,
              //       )
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Row(
                  children: [
                    Container(
                      width: 70.0,
                      height: 70.0,
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
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: Color.fromARGB(255, 205, 166, 122),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'memories',
                          style: TextStyle(
                              color: Color.fromARGB(255, 205, 166, 122),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // SizedBox(
                          //   width: 30,
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(left: 26.0),
                            child: IconButton(
                              icon: Icon(Icons.settings),
                              onPressed: () {},
                              color: Color.fromARGB(255, 205, 166, 122),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: IconButton(
                              icon: Icon(Icons.info),
                              onPressed: () {},
                              color: Color.fromARGB(255, 205, 166, 122),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: IconButton(
                              icon: Icon(Icons.home),
                              onPressed: () {},
                              color: Color.fromARGB(255, 205, 166, 122),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              'Pengaturan\nProfil',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 205, 166, 122)),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 25.0),
                            child: Text(
                              'Info\nLangganan',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 205, 166, 122)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 23.0),
                            child: Text(
                              'Listing\nSaya',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 205, 166, 122)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Container(
                  width: double.infinity,
                  height: 190,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, top: 10.0),
                            child: Text(
                              'Ingin menjual atau menyewakan\nproperty anda?',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, top: 5.0),
                            child: Text(
                              'Tayangkan iklan dengan\nbeberapa langkah\nmudah',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 157, 157, 157)),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, top: 15.0),
                            child: SizedBox(
                              height: 50,
                              width: 120,
                              child: ElevatedButton(
                                child: Text(
                                  'Pasang Iklan',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromARGB(255, 51, 54, 63)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)))),
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
                            padding:
                                const EdgeInsets.only(bottom: 20.0, left: 50.0),
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

              SizedBox(
                height: 10,
              ),

              Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.call),
                        onPressed: () {},
                        color: Color.fromARGB(255, 205, 166, 122),
                      ),
                      Text(
                        'Hubungi Kami',
                        style: TextStyle(
                            color: Color.fromARGB(255, 205, 166, 122)),
                      ),
                      SizedBox(
                        width: 180,
                      ),
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_right_rounded),
                        color: Color.fromARGB(255, 205, 166, 122),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
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
                        icon: Icon(Icons.share),
                        onPressed: () {},
                        color: Color.fromARGB(255, 205, 166, 122),
                      ),
                      Text(
                        'Undang Rekan',
                        style: TextStyle(
                            color: Color.fromARGB(255, 205, 166, 122)),
                      ),
                      SizedBox(
                        width: 180,
                      ),
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_right_rounded),
                        color: Color.fromARGB(255, 205, 166, 122),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
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
                        icon: Icon(Icons.sticky_note_2_rounded),
                        onPressed: () {},
                        color: Color.fromARGB(255, 205, 166, 122),
                      ),
                      Text(
                        'Syarat dan Kebijakan Privasi',
                        style: TextStyle(
                            color: Color.fromARGB(255, 205, 166, 122)),
                      ),
                      SizedBox(
                        width: 95,
                      ),
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_right_rounded),
                        color: Color.fromARGB(255, 205, 166, 122),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
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
                        icon: Icon(Icons.logout),
                        color: Color.fromARGB(255, 205, 166, 122),
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
                      Text(
                        'Keluar',
                        style: TextStyle(
                            color: Color.fromARGB(255, 205, 166, 122)),
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
      builder: (context) => LoginPage(
        udid: '',
      ),
    ));
  }
}
