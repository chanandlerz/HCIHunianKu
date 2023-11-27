import 'dart:convert';

import 'package:app_development/components/text_field_register.dart';
import 'package:app_development/main.dart';
import 'package:app_development/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class User {
  final String password;

  User({required this.password});
}

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // late String publicKeyString;

  Future<String> fetchPubKey(Uri url) async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      String publicKey = data['publicKey'];
      return publicKey;
    } else {
      throw Exception('Failed to load public key');
    }
  }

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
                height: 200,
              ),
              RegisterTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),
              SizedBox(
                height: 10,
              ),
              RegisterTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: false,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: 340,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 205, 166, 122),
                    ),
                    onPressed: () async {
                      final Uri url2 =
                          Uri.https('debug.lubisputri16.repl.co', 'pubkey');

                      String publicKeyString = await fetchPubKey(url2);
                      await savePubKey(publicKeyString);
                      print(publicKeyString);
                      // String storedPublicKey = await getPublicKey();

                      //@moris ini udah dapet publicKeyString nya, tinggal simpen ke local make shared preference, trs di login panggil pubkeynya

                      String udid = await FlutterUdid.udid;
                      await AuthUtils.login();

                      User user = User(
                        password: passwordController.text,
                      );

                      await saveUser(user);

//                       String publicKey =
//                           """
//                       -----BEGIN PUBLIC KEY-----
// MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtwf65V5XpI9r9YUgooDV
// cbfz13AyMm4tpljTpSRKzi4Llwz7LrzqgZQIFGW0E5I6szluzRUdAwM8EzxMOREq
// bjF+DfNpjLeZAzVmucI95riKzzrnqctaU+GXTZ5gtbnnHCBFQgI+3GDdHjNkgQ8i
// zXSJmvh5VU5r+t3ZyUv8w6dgqG5eal5DYArwX6bOkm/E9Wn0rIvzT2EHiPj0eZcf
// FlZgruoX/GdcZxza7/A1zJngkWXz1cHA332NI0HveyAzuuE6NnYbxVLdLRpyO247
// Iiem0UxPkyKPIYt2M+qyyAA78KsjyUkb8h3PgzbWp7hnGsIHCq7J9WW7tiD3pLTd
// AwIDAQAB
// -----END PUBLIC KEY-----
//                       """;

                      final Uri url =
                          Uri.https('debug.lubisputri16.repl.co', 'users');

                      final response = await http.post(
                        url,
                        headers: {'Content-Type': 'application/json'},
                        body: jsonEncode({
                          'udid': udid,
                          'username': usernameController.text,
                          'password': passwordController.text,
                        }),
                      );

                      if (response.statusCode == 200) {
                        print('User registered successfuly');
                      } else {
                        print(
                            'Failed to register the user. Status Code: ${response.statusCode}');
                        print('Error Response: ${response.body}');
                      }

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage(udid: udid,)));
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => LoginPage(udid: udid)));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 4,
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => LoginPage(
                                    udid: '',
                                  )));
                    },
                    child: new Text(
                      "Login now",
                      style:
                          TextStyle(color: Color.fromARGB(255, 205, 166, 122)),
                    ),
                  )

                  // Text(
                  //   "Login now",
                  //   style: TextStyle(
                  //       color: Color.fromARGB(255, 205, 166, 122), fontWeight: FontWeight.bold),
                  // )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('password', user.password);
  }

  savePubKey(String publicKeyString) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('publicKeyString', publicKeyString);
  }

  // Future<String> getPublicKey() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? storedPublicKey = prefs.getString('publicKeyString');
  //   return storedPublicKey ?? '';
  // }
}
