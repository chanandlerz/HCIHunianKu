import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:app_development/pages/listing_saya_page.dart';
import 'package:app_development/pages/pasang_iklan_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_udid/flutter_udid.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';

// Jual Komersil
class JualKomersil extends StatefulWidget {
  const JualKomersil({super.key});

  @override
  State<JualKomersil> createState() => _JualKomersilState();
}

class _JualKomersilState extends State<JualKomersil> {
  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController luasController = TextEditingController();
  final TextEditingController jumlahKamarTidurController =
      TextEditingController();
  final TextEditingController jumlahKamarMandiController =
      TextEditingController();
  final TextEditingController ketinggianController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();

  File? image;
  final picker = ImagePicker();
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

  // void updateFileName() {
  //   if (image != null) {
  //     Uri uri = Uri.file(image!.path);
  //     imageFileName = utf8.decode(uri.pathSegments.last.codeUnits);
  //     setState(() {});
  //   }
  // }

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

  String udid = '';
  Future postPropertyToServer() async {
    final Uri url = Uri.https('debug.lubisputri16.repl.co', 'property');
    udid = await FlutterUdid.udid;

    int timestamp = DateTime.now().millisecondsSinceEpoch;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String formattedDate =
        "${dateTime.year}-${_addLeadingZero(dateTime.month)}-${_addLeadingZero(dateTime.day)} "
        "${_addLeadingZero(dateTime.hour)}:${_addLeadingZero(dateTime.minute)}:${_addLeadingZero(dateTime.second)}";

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'udid': udid,
        'action': "Jual",
        'type': "Komersial",
        'lokasi': lokasiController.text,
        'harga': hargaController.text,
        'area': luasController.text,
        'kTidur': jumlahKamarTidurController.text,
        'kMandi': jumlahKamarMandiController.text,
        'image': base64string,
        'date': formattedDate,
        'status': "Ready",
        'deskripsi': deskripsiController.text,
      }),
    );

    if (response.statusCode == 200) {
      print('Property added successfuly');
    } else {
      print('Failed to add property. Status Code: ${response.statusCode}');
      print('Error Response: ${response.body}');
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

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  String _addLeadingZero(int number) {
    return number < 10 ? '0$number' : '$number';
  }

  final formField = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Color.fromARGB(255, 205, 166, 122),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FilterPasangIklan()));
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Form(
            key: formField,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
              child: TextFormField(
                controller: lokasiController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Masukkan lokasi properti";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 205, 166, 122)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  hintText: 'Lokasi Properti',
                  // suffixIcon: Icon(Icons.search_rounded),
                ),
              ),
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Kisaran Harga (Rp)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0, left: 10.0, top: 18.0, right: 10),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 205.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: hargaController,
                      // autovalidateMode:
                      //     AutovalidateMode.onUserInteraction,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Masukkan harga properti";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Luas Area (meter persegi)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0, left: 10.0, top: 18.0, right: 10),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 147.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: luasController,
                      // autovalidateMode:
                      //     AutovalidateMode.onUserInteraction,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Masukkan rentang area properti";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 10.0),
                child: Text(
                  'Jumlah Kamar Tidur',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0, top: 10.0),
                child: Text(
                  'Jumlah Kamar Mandi',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, top: 10.0, bottom: 15),
                  child: SizedBox(
                    width: 100.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: jumlahKamarTidurController,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Masukkan jumlah kamar tidur";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ),
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 25.0, top: 10.0, bottom: 15.0),
                  child: SizedBox(
                    width: 100.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: jumlahKamarMandiController,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Masukkan jumlah kamar mandi";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(
                    'Deskripsi Produk',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    controller: deskripsiController,
                    obscureText: false,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122)))),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Foto Properti',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: showOptions,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 205, 166, 122)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 205, 166, 122))))),
                      child: const Text('Select Image'),
                    ),
                  ),
                )
              ],
            ),
          ),
          image != null
              ? Container(
                  height: 180,
                  child: Image.file(
                    image!,
                  ),
                )
              : Text(''),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
            child: ElevatedButton(
              onPressed: () async {
                await postPropertyToServer();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListingPage(udid: udid)));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 205, 166, 122)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122))))),
              child: const Text('Pasang Iklan'),
            ),
          )
        ],
      ),
    );
  }
}

// Jual Rumah
class JualRumah extends StatefulWidget {
  const JualRumah({super.key});

  @override
  State<JualRumah> createState() => _JualRumahState();
}

class _JualRumahState extends State<JualRumah> {
  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController luasController = TextEditingController();
  final TextEditingController jumlahKamarTidurController =
      TextEditingController();
  final TextEditingController jumlahKamarMandiController =
      TextEditingController();
  final TextEditingController ketinggianController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();

  File? image;
  final picker = ImagePicker();
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

  // void updateFileName() {
  //   if (image != null) {
  //     Uri uri = Uri.file(image!.path);
  //     imageFileName = utf8.decode(uri.pathSegments.last.codeUnits);
  //     setState(() {});
  //   }
  // }

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

  String udid = '';
  Future postPropertyToServer() async {
    final Uri url = Uri.https('debug.lubisputri16.repl.co', 'property');
    udid = await FlutterUdid.udid;

    int timestamp = DateTime.now().millisecondsSinceEpoch;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String formattedDate =
        "${dateTime.year}-${_addLeadingZero(dateTime.month)}-${_addLeadingZero(dateTime.day)} "
        "${_addLeadingZero(dateTime.hour)}:${_addLeadingZero(dateTime.minute)}:${_addLeadingZero(dateTime.second)}";

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'udid': udid,
        'action': "Jual",
        'type': "Rumah",
        'lokasi': lokasiController.text,
        'harga': hargaController.text,
        'area': luasController.text,
        'kTidur': jumlahKamarTidurController.text,
        'kMandi': jumlahKamarMandiController.text,
        'image': base64string,
        'date': formattedDate,
        'status': "Ready",
        'deskripsi': deskripsiController.text,
      }),
    );

    if (response.statusCode == 200) {
      print('Property added successfuly');
    } else {
      print('Failed to add property. Status Code: ${response.statusCode}');
      print('Error Response: ${response.body}');
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

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  String _addLeadingZero(int number) {
    return number < 10 ? '0$number' : '$number';
  }

  final formField = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Color.fromARGB(255, 205, 166, 122),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FilterPasangIklan()));
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Form(
            key: formField,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
              child: TextFormField(
                controller: lokasiController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Masukkan lokasi rumah";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 205, 166, 122)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  hintText: 'Lokasi Rumah',
                  // suffixIcon: Icon(Icons.search_rounded),
                ),
              ),
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Kisaran Harga (Rp)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0, left: 10.0, top: 18.0, right: 10),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 205.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: hargaController,
                      // autovalidateMode:
                      //     AutovalidateMode.onUserInteraction,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Masukkan harga properti";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Luas Area (meter persegi)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0, left: 10.0, top: 18.0, right: 10),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 147.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: luasController,
                      // autovalidateMode:
                      //     AutovalidateMode.onUserInteraction,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Masukkan rentang area properti";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 10.0),
                child: Text(
                  'Jumlah Kamar Tidur',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0, top: 10.0),
                child: Text(
                  'Jumlah Kamar Mandi',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, top: 10.0, bottom: 15),
                  child: SizedBox(
                    width: 100.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: jumlahKamarTidurController,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Masukkan jumlah kamar tidur";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ),
              ),
              Form(
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 25.0, top: 10.0, bottom: 15),
                  child: SizedBox(
                    width: 100.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: jumlahKamarMandiController,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Masukkan jumlah kamar mandi";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(
                    'Deskripsi Produk',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    controller: deskripsiController,
                    obscureText: false,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122)))),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Foto Properti',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: showOptions,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 205, 166, 122)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 205, 166, 122))))),
                      child: const Text('Select Image'),
                    ),
                  ),
                )
              ],
            ),
          ),
          image != null
              ? Container(
                  height: 180,
                  child: Image.file(
                    image!,
                  ),
                )
              : Text(''),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: ElevatedButton(
              onPressed: () async {
                await postPropertyToServer();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListingPage(udid: udid)));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 205, 166, 122)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122))))),
              child: const Text('Pasang Iklan'),
            ),
          )
        ],
      ),
    );
  }
}

// Jual Apartement
class JualApartement extends StatefulWidget {
  const JualApartement({super.key});

  @override
  State<JualApartement> createState() => _JualApartementState();
}

class _JualApartementState extends State<JualApartement> {
  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController luasController = TextEditingController();
  final TextEditingController jumlahKamarTidurController =
      TextEditingController();
  final TextEditingController jumlahKamarMandiController =
      TextEditingController();
  final TextEditingController ketinggianController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();

  File? image;
  final picker = ImagePicker();
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

  // void updateFileName() {
  //   if (image != null) {
  //     Uri uri = Uri.file(image!.path);
  //     imageFileName = utf8.decode(uri.pathSegments.last.codeUnits);
  //     setState(() {});
  //   }
  // }

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

  String udid = '';
  Future postPropertyToServer() async {
    final Uri url = Uri.https('debug.lubisputri16.repl.co', 'property');
    udid = await FlutterUdid.udid;

    int timestamp = DateTime.now().millisecondsSinceEpoch;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String formattedDate =
        "${dateTime.year}-${_addLeadingZero(dateTime.month)}-${_addLeadingZero(dateTime.day)} "
        "${_addLeadingZero(dateTime.hour)}:${_addLeadingZero(dateTime.minute)}:${_addLeadingZero(dateTime.second)}";

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'udid': udid,
        'action': "Jual",
        'type': "Apartement",
        'lokasi': lokasiController.text,
        'harga': hargaController.text,
        'area': luasController.text,
        'kTidur': jumlahKamarTidurController.text,
        'kMandi': jumlahKamarMandiController.text,
        'image': base64string,
        'date': formattedDate,
        'status': "Ready",
        'deskripsi': deskripsiController.text,
      }),
    );

    if (response.statusCode == 200) {
      print('Property added successfuly');
    } else {
      print('Failed to add property. Status Code: ${response.statusCode}');
      print('Error Response: ${response.body}');
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

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  String _addLeadingZero(int number) {
    return number < 10 ? '0$number' : '$number';
  }

  final formField = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Color.fromARGB(255, 205, 166, 122),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FilterPasangIklan()));
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Form(
            key: formField,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
              child: TextFormField(
                controller: lokasiController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Masukkan lokasi apartement";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 205, 166, 122)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  hintText: 'Lokasi apartement',
                  // suffixIcon: Icon(Icons.search_rounded),
                ),
              ),
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Kisaran Harga (Rp)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0, left: 10.0, top: 18.0, right: 10),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 205.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: hargaController,
                      // autovalidateMode:
                      //     AutovalidateMode.onUserInteraction,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Masukkan harga properti";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Luas Area (meter persegi)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0, left: 10.0, top: 18.0, right: 10),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 147.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: luasController,
                      // autovalidateMode:
                      //     AutovalidateMode.onUserInteraction,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Masukkan rentang area properti";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 10.0),
                child: Text(
                  'Jumlah Kamar Tidur',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0, top: 10.0),
                child: Text(
                  'Jumlah Kamar Mandi',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, top: 10.0, bottom: 15),
                  child: SizedBox(
                    width: 100.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: jumlahKamarTidurController,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Masukkan jumlah kamar tidur";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ),
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 25.0,
                    top: 10.0,
                    bottom: 15,
                  ),
                  child: SizedBox(
                    width: 100.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: jumlahKamarMandiController,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Masukkan jumlah kamar mandi";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(
                    'Deskripsi Produk',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    controller: deskripsiController,
                    obscureText: false,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122)))),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Foto Properti',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: showOptions,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 205, 166, 122)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 205, 166, 122))))),
                      child: const Text('Select Image'),
                    ),
                  ),
                )
              ],
            ),
          ),
          image != null
              ? Container(
                  height: 180,
                  child: Image.file(
                    image!,
                  ),
                )
              : Text(''),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: ElevatedButton(
              onPressed: () async {
                await postPropertyToServer();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListingPage(udid: udid)));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 205, 166, 122)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122))))),
              child: const Text('Pasang Iklan'),
            ),
          )
        ],
      ),
    );
  }
}

// Jual Apartement
class JualKost extends StatefulWidget {
  const JualKost({super.key});

  @override
  State<JualKost> createState() => _JualKostState();
}

class _JualKostState extends State<JualKost> {
  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController luasController = TextEditingController();
  final TextEditingController jumlahKamarTidurController =
      TextEditingController();
  final TextEditingController jumlahKamarMandiController =
      TextEditingController();
  final TextEditingController ketinggianController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();

  bool isPressedJualTipeKamarMandiDalam = false;
  bool isPressedJualTipeKamarMandiLuar = false;
  bool isPressedJualTipeKostPutra = false;
  bool isPressedJualTipeKostPutri = false;
  bool isPressedJualTipeKostCampur = false;

  void activeKamarMandiDalam() {
    setState(() {
      if (isPressedJualTipeKamarMandiDalam) {
        isPressedJualTipeKamarMandiDalam = false;
      } else {
        isPressedJualTipeKamarMandiDalam = true;
        isPressedJualTipeKamarMandiLuar = false;
      }
    });
  }

  void activeKamarMandiLuar() {
    setState(() {
      if (isPressedJualTipeKamarMandiLuar) {
        isPressedJualTipeKamarMandiLuar = false;
      } else {
        isPressedJualTipeKamarMandiDalam = false;
        isPressedJualTipeKamarMandiLuar = true;
      }
    });
  }

  void activeTipeKostPutra() {
    setState(() {
      if (isPressedJualTipeKostPutra) {
        isPressedJualTipeKostPutra = false;
      } else {
        isPressedJualTipeKostPutra = true;
        isPressedJualTipeKostPutri = false;
        isPressedJualTipeKostCampur = false;
      }
    });
  }

  void activeTipeKostPutri() {
    setState(() {
      if (isPressedJualTipeKostPutri) {
        isPressedJualTipeKostPutri = false;
      } else {
        isPressedJualTipeKostPutra = false;
        isPressedJualTipeKostPutri = true;
        isPressedJualTipeKostCampur = false;
      }
    });
  }

  void activeTipeKostCampur() {
    setState(() {
      if (isPressedJualTipeKostCampur) {
        isPressedJualTipeKostCampur = false;
      } else {
        isPressedJualTipeKostPutra = false;
        isPressedJualTipeKostPutri = false;
        isPressedJualTipeKostCampur = true;
      }
    });
  }

  File? image;
  String? imageFileName;
  final picker = ImagePicker();
  String base64string = '';

  String _addLeadingZero(int number) {
    return number < 10 ? '0$number' : '$number';
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
        print(base64string);
      });
    }
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);

      Future<Uint8List> imagebytes = image!.readAsBytes(); //convert to bytes
      Uint8List bytes = await imagebytes;

      base64string = base64.encode(bytes);
      setState(() {
        //print(base64string);
      });

      // updateFileName();
    }
  }

  String udid = '';
  Future postPropertyToServer() async {
    final Uri url = Uri.https('debug.lubisputri16.repl.co', 'property');
    udid = await FlutterUdid.udid;
    String kMandiKos = "";
    String tipeKost = "";

    int timestamp = DateTime.now().millisecondsSinceEpoch;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String formattedDate =
        "${dateTime.year}-${_addLeadingZero(dateTime.month)}-${_addLeadingZero(dateTime.day)} "
        "${_addLeadingZero(dateTime.hour)}:${_addLeadingZero(dateTime.minute)}:${_addLeadingZero(dateTime.second)}";

    if (isPressedJualTipeKamarMandiDalam == true) {
      kMandiKos = "Dalam";
    } else if (isPressedJualTipeKamarMandiLuar == true) {
      kMandiKos = "Luar";
    }

    if (isPressedJualTipeKostPutra == true) {
      tipeKost = "Putra";
    } else if (isPressedJualTipeKostPutri == true) {
      tipeKost = "Putri";
    } else if (isPressedJualTipeKostCampur == true) {
      tipeKost = "Campur";
    }

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'udid': udid,
        'action': "Jual",
        'type': "Kost",
        'lokasi': lokasiController.text,
        'harga': hargaController.text,
        'area': luasController.text,
        'kMandiKos': kMandiKos,
        'tipeKost': tipeKost,
        'kTidur': jumlahKamarTidurController.text,
        'kMandi': jumlahKamarMandiController.text,
        'image': base64string,
        'date': formattedDate,
        'status': "Ready",
        'deskripsi': deskripsiController.text,
      }),
    );

    if (response.statusCode == 200) {
      print('Property added successfuly');
    } else {
      print('Failed to add property. Status Code: ${response.statusCode}');
      print('Error Response: ${response.body}');
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

  final formField = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Color.fromARGB(255, 205, 166, 122),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FilterPasangIklan()));
          },
        ),
      ),
      body: ListView(
        children: [
          Form(
            key: formField,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
              child: TextFormField(
                controller: lokasiController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Masukkan lokasi kost";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 205, 166, 122)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  hintText: 'Lokasi Kost',
                  // suffixIcon: Icon(Icons.search_rounded),
                ),
              ),
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Kisaran Harga (Rp)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0, left: 10.0, top: 18.0, right: 10),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 205.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: hargaController,
                      // autovalidateMode:
                      //     AutovalidateMode.onUserInteraction,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Masukkan harga properti";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Luas Area (meter persegi)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0, left: 10.0, top: 18.0, right: 10),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 148.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: luasController,
                      // autovalidateMode:
                      //     AutovalidateMode.onUserInteraction,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Masukkan rentang area properti";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Kamar Mandi',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Wrap(
                  children: [
                    ElevatedButton(
                      onPressed: activeKamarMandiDalam,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              isPressedJualTipeKamarMandiDalam
                                  ? Color.fromARGB(255, 205, 166, 122)
                                  : Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                          color:
                                              isPressedJualTipeKamarMandiDalam
                                                  ? Colors.transparent
                                                  : Color.fromARGB(
                                                      255, 205, 166, 122))))),
                      child: Text('dalam',
                          style: TextStyle(
                              color: isPressedJualTipeKamarMandiDalam
                                  ? Colors.white
                                  : Color.fromARGB(255, 121, 121, 121))),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: activeKamarMandiLuar,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              isPressedJualTipeKamarMandiLuar
                                  ? Color.fromARGB(255, 205, 166, 122)
                                  : Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                          color: isPressedJualTipeKamarMandiLuar
                                              ? Colors.transparent
                                              : Color.fromARGB(
                                                  255, 205, 166, 122))))),
                      child: Text('luar',
                          style: TextStyle(
                              color: isPressedJualTipeKamarMandiLuar
                                  ? Colors.white
                                  : Color.fromARGB(255, 121, 121, 121))),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Tipe Kost',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Wrap(
                  children: [
                    ElevatedButton(
                      onPressed: activeTipeKostPutra,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              isPressedJualTipeKostPutra
                                  ? Color.fromARGB(255, 205, 166, 122)
                                  : Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                          color: isPressedJualTipeKostPutra
                                              ? Colors.transparent
                                              : Color.fromARGB(
                                                  255, 205, 166, 122))))),
                      child: Text('putra',
                          style: TextStyle(
                              color: isPressedJualTipeKostPutra
                                  ? Colors.white
                                  : Color.fromARGB(255, 121, 121, 121))),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: activeTipeKostPutri,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              isPressedJualTipeKostPutri
                                  ? Color.fromARGB(255, 205, 166, 122)
                                  : Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                          color: isPressedJualTipeKostPutri
                                              ? Colors.transparent
                                              : Color.fromARGB(
                                                  255, 205, 166, 122))))),
                      child: Text('putri',
                          style: TextStyle(
                              color: isPressedJualTipeKostPutri
                                  ? Colors.white
                                  : Color.fromARGB(255, 121, 121, 121))),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: activeTipeKostCampur,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              isPressedJualTipeKostCampur
                                  ? Color.fromARGB(255, 205, 166, 122)
                                  : Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                          color: isPressedJualTipeKostCampur
                                              ? Colors.transparent
                                              : Color.fromARGB(
                                                  255, 205, 166, 122))))),
                      child: Text('campur',
                          style: TextStyle(
                              color: isPressedJualTipeKostCampur
                                  ? Colors.white
                                  : Color.fromARGB(255, 121, 121, 121))),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 10.0),
                child: Text(
                  'Jumlah Kamar Tidur',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0, top: 10.0),
                child: Text(
                  'Jumlah Kamar Mandi',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, top: 10.0, bottom: 15),
                  child: SizedBox(
                    width: 100.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: jumlahKamarTidurController,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Masukkan jumlah kamar tidur";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ),
              ),
              Form(
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 25.0, top: 10.0, bottom: 15),
                  child: SizedBox(
                    width: 100.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: jumlahKamarMandiController,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Masukkan jumlah kamar mandi";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(
                    'Deskripsi Produk',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    controller: deskripsiController,
                    obscureText: false,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122)))),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Foto Properti',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: showOptions,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 205, 166, 122)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 205, 166, 122))))),
                      child: const Text('Select Image'),
                    ),
                  ),
                )
              ],
            ),
          ),
          image != null
              ? Container(
                  height: 180,
                  child: Image.file(
                    image!,
                  ),
                )
              : Text(''),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 20, top: 20, right: 10, left: 10),
            child: ElevatedButton(
              onPressed: () async {
                await postPropertyToServer();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListingPage(udid: udid)));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 205, 166, 122)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122))))),
              child: const Text('Pasang Iklan'),
            ),
          )
        ],
      ),
    );
  }
}

// Jual Tanah
class JualTanah extends StatefulWidget {
  const JualTanah({super.key});

  @override
  State<JualTanah> createState() => _JualTanahState();
}

class _JualTanahState extends State<JualTanah> {
  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController luasController = TextEditingController();
  final TextEditingController jumlahKamarTidurController =
      TextEditingController();
  final TextEditingController jumlahKamarMandiController =
      TextEditingController();
  final TextEditingController ketinggianController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();

  String _addLeadingZero(int number) {
    return number < 10 ? '0$number' : '$number';
  }

  File? image;
  final picker = ImagePicker();
  String? imageFileName;

  String base64string = '';

  // void updateFileName() {
  //   if (image != null) {
  //     Uri uri = Uri.file(image!.path);
  //     imageFileName = utf8.decode(uri.pathSegments.last.codeUnits);
  //     setState(() {});
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
        print(base64string);
      });

      // updateFileName();
    }
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

  String udid = '';
  Future postPropertyToServer() async {
    final Uri url = Uri.https('debug.lubisputri16.repl.co', 'property');
    udid = await FlutterUdid.udid;

    int timestamp = DateTime.now().millisecondsSinceEpoch;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String formattedDate =
        "${dateTime.year}-${_addLeadingZero(dateTime.month)}-${_addLeadingZero(dateTime.day)} "
        "${_addLeadingZero(dateTime.hour)}:${_addLeadingZero(dateTime.minute)}:${_addLeadingZero(dateTime.second)}";

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'udid': udid,
        'action': "Jual",
        'type': "Tanah",
        'lokasi': lokasiController.text,
        'harga': hargaController.text,
        'area': luasController.text,
        //masi belum
        'ketinggian': ketinggianController.text,
        'image': base64string,
        'date': formattedDate,
        'status': "Ready",
        'deskripsi': deskripsiController.text,
      }),
    );

    if (response.statusCode == 200) {
      print('Property added successfuly');
    } else {
      print('Failed to add property. Status Code: ${response.statusCode}');
      print('Error Response: ${response.body}');
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

  final formField = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Color.fromARGB(255, 205, 166, 122),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FilterPasangIklan()));
          },
        ),
      ),
      body: ListView(
        children: [
          Form(
            key: formField,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
              child: TextFormField(
                controller: lokasiController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Masukkan lokasi tanah";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 205, 166, 122)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  hintText: 'Lokasi Tanah',
                  // suffixIcon: Icon(Icons.search_rounded),
                ),
              ),
            ),
          ),

          // Text('list1: $list_JualTanah.join("")'),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Kisaran Harga (Rp)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0, left: 10.0, top: 18.0, right: 10),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 205.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: hargaController,
                      // autovalidateMode:
                      //     AutovalidateMode.onUserInteraction,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Masukkan harga properti";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Luas Area (meter persegi)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0, left: 10.0, top: 18.0, right: 10),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 147.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: luasController,
                      // autovalidateMode:
                      //     AutovalidateMode.onUserInteraction,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Masukkan rentang area properti";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Ketinggian (mdpl)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0, left: 10.0, top: 18.0, right: 10),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 215.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: ketinggianController,
                      // autovalidateMode:
                      //     AutovalidateMode.onUserInteraction,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Masukkan rentang area properti";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(
                    'Deskripsi Produk',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    controller: deskripsiController,
                    obscureText: false,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122)))),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Foto Properti',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: showOptions,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 205, 166, 122)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 205, 166, 122))))),
                      child: const Text('Select Image'),
                    ),
                  ),
                )
              ],
            ),
          ),
          image != null
              ? Container(
                  height: 180,
                  child: Image.file(
                    image!,
                  ),
                )
              : Text(''),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: ElevatedButton(
              onPressed: () async {
                await postPropertyToServer();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListingPage(udid: udid)));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 205, 166, 122)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122))))),
              child: const Text('Pasang Iklan'),
            ),
          )
        ],
      ),
    );
  }
}
