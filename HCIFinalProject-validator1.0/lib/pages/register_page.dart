import 'dart:convert';

import 'package:app_development/components/text_field_register_username.dart';
import 'package:app_development/components/text_field_register_password.dart';
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
  final formFieldUsername = GlobalKey<FormState>();
  final formFieldPassword = GlobalKey<FormState>();
  final formFieldEmail = GlobalKey<FormState>();
  final formFieldNumber = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  bool passwordToggle = true;
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

              SizedBox(
                height: 10,
              ),

              Form(
                key: formFieldUsername,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: TextFormField(
                        controller: usernameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter username";
                          }
                          if (usernameController.text.length < 6) {
                            return "Username Length should not be less than 6 character";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          hintText: 'Username',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //email
              Form(
                key: formFieldEmail,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: TextFormField(
                        controller: emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter email";
                          }
                          if (!value.contains('@gmail.com')) {
                            return "use @gmail.com format";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          hintText: 'Email',
                        ),
                        // contentPadding:
                        //     EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        // hintText: widget.hintText,
                      ),
                    ),
                  ],
                ),
              ),

              // password
              Form(
                key: formFieldPassword,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: TextFormField(
                        controller: passwordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter password";
                          }
                          bool emailValid =
                              RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[A-Z])[A-Za-z\d]{1,}$")
                                  .hasMatch(value);
                          if (emailValid == false) {
                            return "Combination of uppercase letter, number, and letter";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          // prefix: Icon(Icons.lock, color: Colors.black),
                          suffix: InkWell(
                            onTap: () {
                              setState(() {
                                passwordToggle = !passwordToggle;
                              });
                            },
                            child: Icon(passwordToggle
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          hintText: 'Password',
                        ),
                        // contentPadding:
                        //     EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        // hintText: widget.hintText,
                      ),
                    ),
                  ],
                ),
              ),

              //phone
              Form(
                key: formFieldNumber,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: TextFormField(
                        controller: numberController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter phone number";
                          }

                          bool numberValid =
                              RegExp(r"^[0-9]*$").hasMatch(value);
                          if (numberValid == false) {
                            return "Phone number must a numeric";
                          }

                          if (numberController.text.length < 11) {
                            return "Phone number should not be less than 10 number";
                          }

                          if (numberController.text.length > 13) {
                            return "Phone number should not be more than 13 number";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          hintText: 'Phone Number',
                        ),

                        // contentPadding:
                        //     EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        // hintText: widget.hintText,
                      ),
                    ),
                  ],
                ),
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
                      // if (formField.currentState!.validate()) {
                      //   print('Success');
                      //   usernameController.clear();
                      //   passwordController.clear();
                      // }

                      final Uri url2 =
                          Uri.https('debug.lubisputri16.repl.co', 'pubkey');

                      String publicKeyString = await fetchPubKey(url2);
                      await savePubKey(publicKeyString);
                      print(publicKeyString);

                      String udid = await FlutterUdid.udid;
                      await AuthUtils.login();

                      User user = User(
                        password: passwordController.text,
                      );

                      await saveUser(user);

                      final Uri url =
                          Uri.https('debug.lubisputri16.repl.co', 'users');

                      final response = await http.post(
                        url,
                        headers: {'Content-Type': 'application/json'},
                        body: jsonEncode({
                          'udid': udid,
                          'username': usernameController.text,
                          'password': passwordController.text,
                          'email': emailController.text,
                          'phone': numberController.text
                        }),
                      );

                      if (response.statusCode == 200) {
                        Navigator.pushReplacementNamed(context, '/login', arguments: {'udid' : ''});
                        print('User registered successfuly');
                      } else if (response.statusCode == 400){
                        final snackBar = SnackBar(
                          content: Text('Username has already been registered.'),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        print('Username has already been registered');
                      }
                      else {
                        print(
                            'Failed to register the user. Status Code: ${response.statusCode}');
                        print('Error Response: ${response.body}');
                      }

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
                      Navigator.pushReplacementNamed(context, '/login', arguments: {'udid' : ''});
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
