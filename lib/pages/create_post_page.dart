import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:app_development/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:http/http.dart' as http;
import 'package:app_development/connection.dart';

Connection connection = Connection();

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final TextEditingController captionController = TextEditingController();
  final picker = ImagePicker();
  bool hintVisible = true;
  File? image;
  String _addLeadingZero(int number) {
    return number < 10 ? '0$number' : '$number';
  }

  String? imageFileName;

  String base64string = '';

  Future<void> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);

      ///File imagefile = File(imagepath); //convert Path to File
      Future<Uint8List> imagebytes = image!.readAsBytes(); //convert to bytes
      Uint8List bytes = await imagebytes;

      base64string = base64.encode(bytes); //convert bytes to base64 string
      setState(() {
        print(base64string);
      });
    }

    // updateFileName();
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);

      Future<Uint8List> imagebytes = image!.readAsBytes(); //convert to bytes
      Uint8List bytes = await imagebytes;

      base64string = base64.encode(bytes);
      setState(() {
        print(base64string);
      });

      // updateFileName();
    }
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
  }

  Future postForumToServer() async {
    String udid = await FlutterUdid.udid;

    int timestamp = DateTime.now().millisecondsSinceEpoch;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String formattedDate =
        "${dateTime.year}-${_addLeadingZero(dateTime.month)}-${_addLeadingZero(dateTime.day)} "
        "${_addLeadingZero(dateTime.hour)}:${_addLeadingZero(dateTime.minute)}:${_addLeadingZero(dateTime.second)}";

    Map<String, dynamic> requestData = {
      'udid': udid,
      'caption': captionController.text,
      'date': formattedDate,
      'image': base64string,
    };

    final Uri url = Uri.http(connection.url, 'postForum');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestData),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      print('User create Post Successfuly');
      print('Formatted Date: $formattedDate');
      Navigator.pushReplacementNamed(context, '/feeds');
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => BottomNavBar()));
    } else {
      print('error response: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 58, 58, 58),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
            child: ElevatedButton(
              onPressed: () async {
                await postForumToServer();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 205, 166, 122)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122))))),
              child: const Text('Post'),
            ),
          )
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 58, 58, 58),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          // SizedBox(
          //   height: 10,
          // ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10, right: 15),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SizedBox(
                    //   width: 5,
                    // ),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Column(children: [
                        SizedBox(
                          width: 50,
                          height: 50,
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
                      ]),
                    ),

                    //   ],
                    // ),
                    Column(children: [
                      SizedBox(
                        height: 500,
                        width: 300,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter some text.";
                            }
                            return null;
                          },
                          onTap: () {
                            setState(() {
                              hintVisible = false;
                            });
                          },
                          maxLines: null,
                          expands: true,
                          keyboardType: TextInputType.multiline,
                          controller: captionController,
                          textAlignVertical: TextAlignVertical.top,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          // autovalidateMode:
                          //     AutovalidateMode.onUserInteraction,
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return "Masukkan lokasi properti";
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            fillColor: Colors.transparent,
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 0.0),
                            hintText: hintVisible ? 'What\'s happening?' : '',
                            hintStyle:
                                TextStyle(fontSize: 20, color: Colors.white),

                            // hintStyle: TextStyle(height: 20)
                            // suffixIcon: Icon(Icons.search_rounded),
                          ),
                        ),
                      ),
                    ]),

                    // SizedBox(
                    //   width: 15.0,
                    // )
                  ],
                )
              ],
            ),
          ),

          SizedBox(
            height: 15,
          ),
          image != null
              ? Container(
                  height: 180,
                  child: Image.file(
                    image!,
                  ),
                )
              : Text('')
          // Text(
          //   _image != null ? '${_image?.path.split('/').last}' : '',
          //   style: TextStyle(color: Colors.white),
          // ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 58, 58, 58),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 10),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.photo_library_outlined),
                color: Color.fromARGB(255, 205, 166, 122),
                onPressed: showOptions,
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                icon: Icon(Icons.location_on_outlined),
                color: Color.fromARGB(255, 205, 166, 122),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    ));
  }
}
