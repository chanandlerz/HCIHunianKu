import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:app_development/pages/detailed_edit_profile_page.dart';
import 'package:app_development/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class User {
  static String username = "";
  static String email = "";
  static String phone = "";
  static String password = "";
}

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final formField = GlobalKey<FormState>();

  String udid = "";
  List<dynamic> myProfileData = [];
  //String username = myProfileData[0]1];

  @override
  void initState() {
    super.initState();
    // getUdid();
    fetchProfileDataFromServer();
    initializeProfileData();
  }

  Future<void> initializeProfileData() async {
    await fetchProfileDataFromServer();
    setState(() {
      User.username = myProfileData.isNotEmpty ? myProfileData[0][1] : "";
      User.email = myProfileData.isNotEmpty ? myProfileData[0][4] : "";
      User.phone = myProfileData.isNotEmpty ? myProfileData[0][3] : "";
      User.password = myProfileData.isNotEmpty ? myProfileData[0][2] : "";
    });
  }

  // Future<void> getUdid() async {
  //   udid = await FlutterUdid.udid;
  // }

  Future fetchProfileDataFromServer() async {
    //current work
    //getUdid();
    final Uri url = Uri.https('hunianku.juanfredoalexiu.repl.co', 'profile');

    udid = await FlutterUdid.udid;

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

  Future postProfileToServer() async {
    final Uri url =
        Uri.https('hunianku.juanfredoalexiu.repl.co', 'editProfileInfo');
    String udid = await FlutterUdid.udid;
    print(udid);
    print(User.username);
    print(User.email);
    print(User.phone);
    print(User.password);
    //print(udid);

    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'udid': udid,
          'username': User.username,
          'email': User.email,
          'phone': User.phone,
          'password': User.password,
          'image': base64string
        }));

    if (response.statusCode == 200) {
      print('Data updated successfuly');
    } else {
      print('Failed to update data. Status Code: ${response.statusCode}');
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

  File? image;
  final picker = ImagePicker();
  String base64string = '';

  // Future updateProfile() async {
  //   final Uri url =
  //       Uri.https('hunianku.juanfredoalexiu.repl.co', 'updateProfile');
  //   String udid = myProfileData[0]0];
  //   print(base64string);

  //   final response = await http.post(url,
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode({
  //         'udid': udid,
  //         'image': base64string,
  //       }));
  //   if (response.statusCode == 200) {
  //     print('Profile picture updated successfuly');
  //   } else {
  //     print(
  //         'Failed to update profile picture. Status Code: ${response.statusCode}');
  //     print('Error Response: ${response.body}');
  //   }
  // }

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

    //await updateProfile();
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
    //await updateProfile();
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
    if (myProfileData.length > 0) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 58, 58, 58),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 58, 58, 58),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded),
              color: Color.fromARGB(255, 205, 166, 122),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/feeds');
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => BottomNavBar()));
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
                          child:
                              // Image.asset(
                              //   'assets/profile1.jpg',
                              //   width: 100.0,
                              //   height: 100.0,
                              //   fit: BoxFit.cover,
                              // ),
                              image != null
                                  ? Image.file(
                                      image!,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    )
                                  : imageCheck(myProfileData[0][5])
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
                  ),
                  TextButton(
                    child: Text(
                      'Ubah Foto Profil',
                      style:
                          TextStyle(color: Color.fromARGB(255, 205, 166, 122)),
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
                                    //'memories',
                                    nullCheck(User.username),
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
                                onPressed: () async {
                                  final result =
                                      await 
                                      // Navigator.pushReplacementNamed(
                                      //     context, '/editusername',
                                      //     arguments: {User.username});
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditUsername(
                                                  username:
                                                      User.username)));
                                  if (result != null) {
                                    setState(() {
                                      User.username = result.toString();
                                    });
                                  }
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
                                    nullCheck(User.email),
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
                                onPressed: () async {
                                  final result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditEmail(email: User.email)));
                                  if (result != null) {
                                    setState(() {
                                      User.email = result.toString();
                                    });
                                  }
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
                                    nullCheck(User.phone),
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
                                onPressed: () async {
                                  final result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditNoTelp(phone: User.phone)));
                                  if (result != null) {
                                    setState(() {
                                      User.phone = result.toString();
                                    });
                                  }
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
                  onPressed: () async {
                    final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EditPassword(password: User.password)));
                    if (result != null) {
                      setState(() {
                        User.password = result.toString();
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                child: ElevatedButton(
                  child: Text('Simpan Perubahan'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 205, 166, 122))),
                  onPressed: () async {
                    postProfileToServer();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavBar()));
                  },
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
