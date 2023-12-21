import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:app_development/pages/detailed_edit_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final formField = GlobalKey<FormState>();

  File? image;
  final picker = ImagePicker();
  String base64string = '';

  String udid = '';
  Future updateProfilePicture() async {
    final Uri url = Uri.https('debug.lubisputri16.repl.co', 'profilePicture');
    udid = await FlutterUdid.udid;
    print(base64string);

    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'udid': udid,
          'image': base64string,
        }));
    if (response.statusCode == 200) {
      print('Profile picture updated successfuly');
    } else {
      print(
          'Failed to update profile picture. Status Code: ${response.statusCode}');
      print('Error Response: ${response.body}');
    }
  }

  Future<void> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);

      ///File imagefile = File(imagepath); //convert Path to File
      Future<Uint8List> imagebytes = image!.readAsBytes(); //convert to bytes
      Uint8List bytes = await imagebytes;

      base64string = base64.encode(bytes); //convert bytes to base64 string
      setState(() {
        // print(base64string);
      });
    }

    await updateProfilePicture();
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);

      Future<Uint8List> imagebytes = image!.readAsBytes(); //convert to bytes
      Uint8List bytes = await imagebytes;

      base64string = base64.encode(bytes);
      setState(() {
        // print(base64string);
      });
    }
    await updateProfilePicture();
  }

  Future showOptions() async {
    showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                  child: const Text('Photo Gallery'),
                  onPressed: () {
                    Navigator.of(context).pop();

                    getImageFromGallery();
                  },
                ),
                CupertinoActionSheetAction(
                  child: const Text('Camera'),
                  onPressed: () {
                    Navigator.of(context).pop();

                    getImageFromCamera();
                  },
                )
              ],
            ));
    // updateProfilePicture();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 58, 58, 58),
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
        ),
        body: ListView(
          children: [
            Center(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 10),
                  child: SizedBox(
                    width: 90.0,
                    height: 90.0,
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
                ),
                TextButton(
                  child: Text(
                    'Ubah Foto Profil',
                    style: TextStyle(color: Color.fromARGB(255, 205, 166, 122)),
                  ),
                  onPressed: () async {
                    showOptions();
                    // await updateProfilePicture();
                  },
                )
              ],
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: formField,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 50),
                        child: Text(
                          'Info Profil',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              children: [
                                Container(
                                  width: 120,
                                  child: Text(
                                    'Username',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                ),
                                Text(
                                  'memories',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward_ios_rounded),
                              iconSize: 15,
                              color: Color.fromARGB(255, 205, 166, 122),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditUsername()));
                              },
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              children: [
                                Container(
                                  width: 120,
                                  child: Text(
                                    'E-mail',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                ),
                                Text(
                                  'ditamapersada51@gmail.com',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward_ios_rounded),
                              iconSize: 15,
                              color: Color.fromARGB(255, 205, 166, 122),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditEmail()));
                              },
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              children: [
                                Container(
                                  width: 120,
                                  child: Text(
                                    'Nomor Telepon',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                ),
                                Text(
                                  '087771895606',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward_ios_rounded),
                              iconSize: 15,
                              color: Color.fromARGB(255, 205, 166, 122),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditNoTelp()));
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 10, right: 10),
              child: ElevatedButton(
                child: Text('Ganti Password'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 205, 166, 122))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditPassword()));
                },
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            height: 50,
            color: Color.fromARGB(255, 58, 58, 58),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    'Hapus Akun',
                    style: TextStyle(color: Color.fromARGB(255, 205, 166, 122)),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
