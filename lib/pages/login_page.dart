//flutter
import 'package:flutter/material.dart';

//backend
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:pointycastle/api.dart' as pointy;
import 'package:http/http.dart' as http;
import 'package:pointycastle/asymmetric/api.dart';
import 'package:pointycastle/asymmetric/oaep.dart';
import 'package:pointycastle/asymmetric/rsa.dart';
import 'package:pointycastle/key_generators/rsa_key_generator.dart';
import 'package:pointycastle/random/fortuna_random.dart';

//page & components
import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:app_development/components/text_field_login.dart';
import 'package:app_development/main.dart';
import 'package:app_development/pages/feeds_page.dart';
import 'package:app_development/pages/register_page.dart';

class User {
  final String password;

  User({required this.password});
}

class LoginPage extends StatefulWidget {
  // final String deviceId;
  final String udid;
  // final String publicKeyString;
  LoginPage({Key? key, required this.udid});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String publicKeyString = '';

  String encryptMessage(String message, RSAPublicKey publicKey) {
    final encryptor = OAEPEncoding.withSHA256(RSAEngine())
      ..init(true, pointy.PublicKeyParameter<RSAPublicKey>(publicKey));

    final Uint8List encryptedBytes =
        encryptor.process(Uint8List.fromList(utf8.encode(message)));
    final String ciphertext = base64.encode(encryptedBytes);

    return ciphertext;
  }

  String decryptMessage(String ciphertext, RSAPrivateKey privateKey) {
    final decryptor = OAEPEncoding(RSAEngine())
      ..init(false, pointy.PrivateKeyParameter<RSAPrivateKey>(privateKey));

    final Uint8List decryptedBytes =
        decryptor.process(base64.decode(ciphertext));
    final String plaintext = utf8.decode(decryptedBytes);

    return plaintext;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPublicKey();
  }

  //@moris nnti panggil pubkey yang udah disimpen pake variabel yg dibawah ini yh
//   String publicKeyString = """-----BEGIN PUBLIC KEY-----
// MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuRKe7M6S0IKo/JfiVs5e
// RarIExbNh+iF4Ey0iYTg9wL33Yijkys1/5FJbLZmk3yBTVxNz3hhccHoHAW5LLRB
// p+JKA0kA6f993coB+6geJbc1kETERppWufiw+YcJnUE8QfDHaA080fhj+Ee7OK3V
// G8J+oTAx9vMVoD6YUwKTgyTo1IYd2Ch3+KHEEHO6D5tEv+BlKwiQqjHQk3fN+IfM
// vbS/vjwInssCBN+I7OQPu0RxoTbWU5hYjILYv+ixSwhvsZLBXXao9Hz7alk5EFvR
// sYH1hMR1TOs/Iz1kj3g9x8xQw//cL2EfeCNj9ED3vjzeR9cgBSc2HlPvi+xE9Zes
// iwIDAQAB
// -----END PUBLIC KEY-----
// """;

//yg diatas ini buat ngetes doang soalnya pubkeynya blm disimpen ke local
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 58, 58, 58),
      body: ListView(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // username text field
            SizedBox(
              height: 150,
            ),

            // ElevatedButton(
            //   onPressed: () {
            //     getPublicKey();
            //   },
            //   child: Text("Pubkey"),
            // ),

            Text('Udid: ${widget.udid}'),
            Text('Pubkey: $publicKeyString'),

            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back!",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 5,
            ),

            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "You've been missed :)",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 30,
            ),

            LoginTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: false,
              icon: Icons.remove_red_eye,
            ),

            SizedBox(
              height: 10,
            ),

            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 25,
            ),

            // LoginButton(
            //   onTap: signUserIn,
            // ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text("Log In"),
            // ),

            Container(
              height: 50,
              width: 335,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 205, 166, 122),
                  ),
                  onPressed: () async {
                    // final File publicKeyFile = File('./public_key.pem');

                    // final String publicKeyString =
                    //     publicKeyFile.readAsStringSync();

                    final encrypt.RSAKeyParser parser = encrypt.RSAKeyParser();
                    final RSAPublicKey publicKey =
                        parser.parse(publicKeyString) as RSAPublicKey;

                    final String encryptedPassword =
                        encryptMessage(passwordController.text, publicKey);

                    Map<String, dynamic> requestData = {
                      'encryptedData': encryptedPassword,
                      'udid': widget.udid,
                    };

                    final Uri url =
                        Uri.https('debug.lubisputri16.repl.co', 'verify');
                    var response = await http.post(
                      url,
                      headers: {'Content-Type': 'application/json'},
                      body: jsonEncode(requestData),
                    );

                    if (response.statusCode == 200) {
                      Map<String, dynamic> responseBody =
                          jsonDecode(response.body);

                      if (responseBody['status'] == 'success') {
                        print('Login Successful');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => BottomNavBar()),
                        );
                      } else {
                        print('Login Failed');
                        //@moris nanti disini bikin buat reload page kalau login failed
                      }
                    } else {
                      print('Error: ${response.statusCode}');
                    }
                  },
                  child: Text(
                    "Log in",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),

            SizedBox(
              height: 20,
            ),

            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Color.fromARGB(255, 58, 58, 58),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Or continue with",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Color.fromARGB(255, 58, 58, 58),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 40,
            ),

            SizedBox(
              height: 30,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 4,
                ),
                new GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => RegisterPage()));
                  },
                  child: new Text(
                    "Register now",
                    style: TextStyle(color: Color.fromARGB(255, 205, 166, 122)),
                  ),
                )
              ],
            ),

            SizedBox(
              height: 50,
            )
          ],
        ),
      ]),
    );
  }

  getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final password = prefs.getString('password') ?? '';
    return User(password: password);
  }

  getPublicKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      publicKeyString = prefs.getString('publicKeyString') ?? '';
    });
  }
}
