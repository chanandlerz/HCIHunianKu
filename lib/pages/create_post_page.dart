import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final TextEditingController createPost = TextEditingController();
  File? _image;

  Future getImageGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile == null) return;
      _image = File(pickedFile.path);
    });
  }

  Future getImageCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile == null) return;
      _image = File(pickedFile.path);
    });
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

                    getImageGallery();
                  },
                ),
                CupertinoActionSheetAction(
                  child: const Text('Camera'),
                  onPressed: () {
                    Navigator.of(context).pop();

                    getImageCamera();
                  },
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 58, 58, 58),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      color: const Color.fromARGB(255, 205, 166, 122),
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 30,
                      width: 70,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 205, 166, 122)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: const BorderSide(
                                        color: Color.fromARGB(
                                            255, 205, 166, 122))))),
                        child: const Text('Post'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Column(children: [
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
                  SizedBox(
                    width: 5,
                  ),

                  //   ],
                  // ),
                  Column(children: [
                    SizedBox(
                      height: 500,
                      width: 300,
                      child: TextField(
                        maxLines: null,
                        expands: true,
                        keyboardType: TextInputType.multiline,
                        controller: createPost,
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
                          hintText: 'What\'s happening?',
                          hintStyle:
                              TextStyle(fontSize: 20, color: Colors.white),

                          // hintStyle: TextStyle(height: 20)
                          // suffixIcon: Icon(Icons.search_rounded),
                        ),
                      ),
                    ),
                  ]),

                  SizedBox(
                    width: 15.0,
                  )
                ],
              )
            ],
          ),
          // SizedBox(
          //   height: 30,
          // ),
          // _image != null
          //     ? Image.file(
          //         _image!,
          //         width: 100,
          //         height: 100,
          //       )
          //     : Text('test'),
          SizedBox(
            height: 200,
          ),
          Divider(
            color: Color.fromARGB(255, 205, 166, 122),
            thickness: 1.0,
          ),
          // SizedBox(
          //   height: 5.0,
          // ),
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
