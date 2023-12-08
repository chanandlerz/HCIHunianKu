import 'dart:convert';

import 'package:app_development/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class User {
  final String password;

  User({required this.password});
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formField = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  bool passwordToggle = true;

  final logicRegister _logicRegister = logicRegister();
  // late String publicKeyString;

  // Future<String> fetchPubKey(Uri url) async {
  //   http.Response response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> data = json.decode(response.body);
  //     String publicKey = data['publicKey'];
  //     return publicKey;
  //   } else {
  //     throw Exception('Failed to load public key');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 58, 58, 58),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: formField,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // --- username ---
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
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          hintText: 'Username',
                        ),
                      ),
                    ),

                    // --- email ---
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
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          hintText: 'Email',
                        ),
                        // contentPadding:
                        //     EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        // hintText: widget.hintText,
                      ),
                    ),

                    // --- password ---
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
                              RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{1,}$")
                                  .hasMatch(value);
                          if (emailValid == false) {
                            return "Password must have combination of number and letter";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
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
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          hintText: 'Password',
                        ),
                        // contentPadding:
                        //     EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        // hintText: widget.hintText,
                      ),
                    ),

                    // --- phone number ---
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
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
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
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: 340,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 205, 166, 122),
                    ),
                    onPressed: () async {
                      // if (formField.currentState!.validate()) {
                      //   print('Register Success, congrats!');
                      //   Routes('Login', context);
                      // } else {
                      //   print('Register Failed, please check your data');
                      // }

                      final Uri url2 =
                          Uri.https('debug.lubisputri16.repl.co', 'pubkey');

                      String publicKeyString = await _logicRegister.fetchPubKey(url2);
                      await _logicRegister.savePubKey(publicKeyString);
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
                          'email': emailController.text,
                          'phone': numberController.text
                        }),
                      );

                      if (response.statusCode == 200) {
                        print('User registered successfuly');
                      } else {
                        print(
                            'Failed to register the user. Status Code: ${response.statusCode}');
                        print('Error Response: ${response.body}');
                      }

                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => LoginPage(
                      //               udid: udid,
                      //             )));

                      Navigator.pushReplacementNamed(context, '/login',
                          arguments: {'udid': udid});

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => LoginPage(udid: udid)));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 4,
                  ),

                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (_) => LoginPage(
                      //               udid: '',
                      //             )));

                      Navigator.pushReplacementNamed(context, '/login',
                          arguments: {'udid': ''});
                    },
                    child: const Text(
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

  // savePubKey(String publicKeyString) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('publicKeyString', publicKeyString);
  // }

  // Future<String> getPublicKey() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? storedPublicKey = prefs.getString('publicKeyString');
  //   return storedPublicKey ?? '';
  // }
}

class logicRegister {
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

  savePubKey(String publicKeyString) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('publicKeyString', publicKeyString);
  }
}

// class Routes {
//   static void toLogin(BuildContext context) {
//     Route route = MaterialPageRoute(builder: (context) => LoginPage(udid: udid));
//     Navigator.pushReplacement(context, route);
//   }

//   Routes(String routeName, BuildContext context) {
//     if (routeName == 'Login') {
//       toLogin(context);
//     }
//   }
// }
