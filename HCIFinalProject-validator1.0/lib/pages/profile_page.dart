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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.format_list_bulleted,
                      color: Color.fromARGB(255, 205, 166, 122),
                      size: 25.0,
                    )
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),

              IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () async {
                  String udid = await FlutterUdid.udid;

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => LoginPage(udid: udid)));

                  Navigator.pushReplacementNamed(context, '/login',
                      arguments: {'udid': ''});
                },
              )
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
