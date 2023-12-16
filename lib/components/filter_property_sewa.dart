import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'package:app_development/pages/filter_property_page.dart';
import 'package:app_development/pages/pasang_iklan_page.dart';
import 'package:app_development/pages/property_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_udid/flutter_udid.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';

// Sewa Rumah
class SewaRumah extends StatefulWidget {
  const SewaRumah({super.key});

  @override
  State<SewaRumah> createState() => _SewaRumahState();
}

class _SewaRumahState extends State<SewaRumah> {
  final formField = GlobalKey<FormState>();

  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController rentangHargaController = TextEditingController();
  final TextEditingController rentangAreaController = TextEditingController();
  final TextEditingController jumlahKamarTidurController =
      TextEditingController();
  final TextEditingController jumlahKamarMandiController =
      TextEditingController();
  final TextEditingController ketinggianController = TextEditingController();

  final TextEditingController rentangHarga1Controller = TextEditingController();
  final TextEditingController rentangHarga2Controller = TextEditingController();
  final TextEditingController rentangArea1Controller = TextEditingController();
  final TextEditingController rentangArea2Controller = TextEditingController();

  bool isPressedSewaRentangHarian = false;
  bool isPressedSewaRentangMingguan = false;
  bool isPressedSewaRentangBulanan = false;
  bool isPressedSewaRentang3Bulan = false;
  bool isPressedSewaRentang6Bulan = false;
  bool isPressedSewaRentangTahunan = false;
  bool isPressedSewaRentangSemua = false;

  void activeHarian() {
    setState(() {
      if (isPressedSewaRentangHarian) {
        isPressedSewaRentangHarian = false;
      } else {
        isPressedSewaRentangHarian = true;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void activeMingguan() {
    setState(() {
      if (isPressedSewaRentangMingguan) {
        isPressedSewaRentangMingguan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = true;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void activeBulanan() {
    setState(() {
      if (isPressedSewaRentangBulanan) {
        isPressedSewaRentangBulanan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = true;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void active3Bulan() {
    setState(() {
      if (isPressedSewaRentang3Bulan) {
        isPressedSewaRentang3Bulan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = true;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void active6Bulan() {
    setState(() {
      if (isPressedSewaRentang6Bulan) {
        isPressedSewaRentang6Bulan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = true;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void activeTahunan() {
    setState(() {
      if (isPressedSewaRentangTahunan) {
        isPressedSewaRentangTahunan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = true;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void activeSemua() {
    setState(() {
      if (isPressedSewaRentangSemua) {
        isPressedSewaRentangSemua = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = true;
      }
    });
  }

  File? image;
  final picker = ImagePicker();
  String? imageFileName;

  void updateFileName() {
    if (image != null) {
      Uri uri = Uri.file(image!.path);
      imageFileName = utf8.decode(uri.pathSegments.last.codeUnits);
      setState(() {});
    }
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });

    updateFileName();
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });

    updateFileName();
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
                MaterialPageRoute(builder: (context) => FilterProperty()));
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
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              'Rentang Sewa',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: activeHarian,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangHarian
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangHarian
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('harian',
                      style: TextStyle(
                          color: isPressedSewaRentangHarian
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: activeMingguan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangMingguan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangMingguan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('mingguan',
                      style: TextStyle(
                          color: isPressedSewaRentangMingguan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: activeBulanan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangBulanan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangBulanan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('bulanan',
                      style: TextStyle(
                          color: isPressedSewaRentangBulanan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: active3Bulan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentang3Bulan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentang3Bulan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('3 bulan',
                      style: TextStyle(
                          color: isPressedSewaRentang3Bulan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: active6Bulan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentang6Bulan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentang6Bulan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('6 bulan',
                      style: TextStyle(
                          color: isPressedSewaRentang6Bulan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: activeTahunan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangTahunan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangTahunan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('tahunan',
                      style: TextStyle(
                          color: isPressedSewaRentangTahunan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: activeSemua,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangSemua
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangSemua
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('semua',
                      style: TextStyle(
                          color: isPressedSewaRentangSemua
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              'Rentang Harga (Rp)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, left: 10.0, top: 15.0),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 160.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: rentangHarga1Controller,
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
                            vertical: 5.0, horizontal: 10.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Text(
                  'hingga',
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, right: 10.0, top: 15.0),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 160.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: rentangArea1Controller,
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
                            vertical: 5.0, horizontal: 10.0),
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
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              'Rentang Area (meter persegi)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, left: 10.0, top: 15.0),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 160.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: rentangArea2Controller,
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
                            vertical: 5.0, horizontal: 10.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Text(
                  'hingga',
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, right: 10.0, top: 15.0),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 160.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: rentangHarga2Controller,
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
                            vertical: 5.0, horizontal: 10.0),
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
                  padding: const EdgeInsets.only(left: 25.0, top: 10.0),
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
                  padding: const EdgeInsets.only(right: 25.0, top: 10.0),
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

          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PropertyPage()));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 205, 166, 122)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122))))),
              child: const Text('Cari Properti'),
            ),
          )
        ],
      ),
    );
  }
}

// Sewa Tanah
class SewaTanah extends StatefulWidget {
  const SewaTanah({super.key});

  @override
  State<SewaTanah> createState() => _SewaTanahState();
}

class _SewaTanahState extends State<SewaTanah> {
  final formField = GlobalKey<FormState>();

  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController rentangHargaController = TextEditingController();
  final TextEditingController rentangAreaController = TextEditingController();
  final TextEditingController jumlahKamarTidurController =
      TextEditingController();
  final TextEditingController jumlahKamarMandiController =
      TextEditingController();
  final TextEditingController ketinggianController = TextEditingController();

  final TextEditingController rentangHarga1Controller = TextEditingController();
  final TextEditingController rentangHarga2Controller = TextEditingController();
  final TextEditingController rentangArea1Controller = TextEditingController();
  final TextEditingController rentangArea2Controller = TextEditingController();

  bool isPressedSewaRentangHarian = false;
  bool isPressedSewaRentangMingguan = false;
  bool isPressedSewaRentangBulanan = false;
  bool isPressedSewaRentang3Bulan = false;
  bool isPressedSewaRentang6Bulan = false;
  bool isPressedSewaRentangTahunan = false;
  bool isPressedSewaRentangSemua = false;

  void activeHarian() {
    setState(() {
      if (isPressedSewaRentangHarian) {
        isPressedSewaRentangHarian = false;
      } else {
        isPressedSewaRentangHarian = true;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void activeMingguan() {
    setState(() {
      if (isPressedSewaRentangMingguan) {
        isPressedSewaRentangMingguan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = true;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void activeBulanan() {
    setState(() {
      if (isPressedSewaRentangBulanan) {
        isPressedSewaRentangBulanan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = true;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void active3Bulan() {
    setState(() {
      if (isPressedSewaRentang3Bulan) {
        isPressedSewaRentang3Bulan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = true;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void active6Bulan() {
    setState(() {
      if (isPressedSewaRentang6Bulan) {
        isPressedSewaRentang6Bulan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = true;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void activeTahunan() {
    setState(() {
      if (isPressedSewaRentangTahunan) {
        isPressedSewaRentangTahunan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = true;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void activeSemua() {
    setState(() {
      if (isPressedSewaRentangSemua) {
        isPressedSewaRentangSemua = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = true;
      }
    });
  }

  File? image;
  final picker = ImagePicker();
  String? imageFileName;

  void updateFileName() {
    if (image != null) {
      Uri uri = Uri.file(image!.path);
      imageFileName = utf8.decode(uri.pathSegments.last.codeUnits);
      setState(() {});
    }
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });

    updateFileName();
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });

    updateFileName();
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
                MaterialPageRoute(builder: (context) => FilterProperty()));
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
                  hintText: 'Lokasi Tanah',
                  // suffixIcon: Icon(Icons.search_rounded),
                ),
              ),
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              'Rentang Sewa',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: activeHarian,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangHarian
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangHarian
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('harian',
                      style: TextStyle(
                          color: isPressedSewaRentangHarian
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: activeMingguan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangMingguan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangMingguan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('mingguan',
                      style: TextStyle(
                          color: isPressedSewaRentangMingguan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: activeBulanan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangBulanan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangBulanan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('bulanan',
                      style: TextStyle(
                          color: isPressedSewaRentangBulanan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: active3Bulan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentang3Bulan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentang3Bulan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('3 bulan',
                      style: TextStyle(
                          color: isPressedSewaRentang3Bulan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: active6Bulan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentang6Bulan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentang6Bulan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('6 bulan',
                      style: TextStyle(
                          color: isPressedSewaRentang6Bulan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: activeTahunan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangTahunan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangTahunan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('tahunan',
                      style: TextStyle(
                          color: isPressedSewaRentangTahunan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: activeSemua,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangSemua
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangSemua
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('semua',
                      style: TextStyle(
                          color: isPressedSewaRentangSemua
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              'Rentang Harga (Rp)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, left: 10.0, top: 15.0),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 160.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: rentangHarga1Controller,
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
                            vertical: 5.0, horizontal: 10.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Text(
                  'hingga',
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, right: 10.0, top: 15.0),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 160.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: rentangArea1Controller,
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
                            vertical: 5.0, horizontal: 10.0),
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
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              'Rentang Area (meter persegi)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, left: 10.0, top: 15.0),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 160.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: rentangArea2Controller,
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
                            vertical: 5.0, horizontal: 10.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Text(
                  'hingga',
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, right: 10.0, top: 15.0),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 160.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: rentangHarga2Controller,
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
                            vertical: 5.0, horizontal: 10.0),
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
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Ketinggian (mdpl)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, left: 10.0, top: 18.0),
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

          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PropertyPage()));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 205, 166, 122)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122))))),
              child: const Text('Cari Properti'),
            ),
          )
        ],
      ),
    );
  }
}

// Sewa Kost
class SewaKost extends StatefulWidget {
  const SewaKost({super.key});

  @override
  State<SewaKost> createState() => _SewaKostState();
}

class _SewaKostState extends State<SewaKost> {
  final formField = GlobalKey<FormState>();

  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController rentangHarga1Controller = TextEditingController();
  final TextEditingController rentangHarga2Controller = TextEditingController();
  final TextEditingController rentangArea1Controller = TextEditingController();
  final TextEditingController rentangArea2Controller = TextEditingController();
  final TextEditingController jumlahKamarTidurController =
      TextEditingController();
  final TextEditingController jumlahKamarMandiController =
      TextEditingController();
  final TextEditingController ketinggianController = TextEditingController();

  bool isPressedSewaTipeKamarMandiDalam = false;
  bool isPressedSewaTipeKamarMandiLuar = false;
  bool isPressedSewaTipeKostPutra = false;
  bool isPressedSewaTipeKostPutri = false;
  bool isPressedSewaTipeKostCampur = false;

  bool isPressedSewaRentangHarian = false;
  bool isPressedSewaRentangMingguan = false;
  bool isPressedSewaRentangBulanan = false;
  bool isPressedSewaRentang3Bulan = false;
  bool isPressedSewaRentang6Bulan = false;
  bool isPressedSewaRentangTahunan = false;
  bool isPressedSewaRentangSemua = false;

  void activeKamarMandiDalam() {
    setState(() {
      if (isPressedSewaTipeKamarMandiDalam) {
        isPressedSewaTipeKamarMandiDalam = false;
      } else {
        isPressedSewaTipeKamarMandiDalam = true;
        isPressedSewaTipeKamarMandiLuar = false;
      }
    });
  }

  void activeKamarMandiLuar() {
    setState(() {
      if (isPressedSewaTipeKamarMandiLuar) {
        isPressedSewaTipeKamarMandiLuar = false;
      } else {
        isPressedSewaTipeKamarMandiDalam = false;
        isPressedSewaTipeKamarMandiLuar = true;
      }
    });
  }

  void activeTipeKostPutra() {
    setState(() {
      if (isPressedSewaTipeKostPutra) {
        isPressedSewaTipeKostPutra = false;
      } else {
        isPressedSewaTipeKostPutra = true;
        isPressedSewaTipeKostPutri = false;
        isPressedSewaTipeKostCampur = false;
      }
    });
  }

  void activeTipeKostPutri() {
    setState(() {
      if (isPressedSewaTipeKostPutri) {
        isPressedSewaTipeKostPutri = false;
      } else {
        isPressedSewaTipeKostPutra = false;
        isPressedSewaTipeKostPutri = true;
        isPressedSewaTipeKostCampur = false;
      }
    });
  }

  void activeTipeKostCampur() {
    setState(() {
      if (isPressedSewaTipeKostCampur) {
        isPressedSewaTipeKostCampur = false;
      } else {
        isPressedSewaTipeKostPutra = false;
        isPressedSewaTipeKostPutri = false;
        isPressedSewaTipeKostCampur = true;
      }
    });
  }

  //////
  void activeHarian() {
    setState(() {
      if (isPressedSewaRentangHarian) {
        isPressedSewaRentangHarian = false;
      } else {
        isPressedSewaRentangHarian = true;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void activeMingguan() {
    setState(() {
      if (isPressedSewaRentangMingguan) {
        isPressedSewaRentangMingguan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = true;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void activeBulanan() {
    setState(() {
      if (isPressedSewaRentangBulanan) {
        isPressedSewaRentangBulanan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = true;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void active3Bulan() {
    setState(() {
      if (isPressedSewaRentang3Bulan) {
        isPressedSewaRentang3Bulan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = true;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void active6Bulan() {
    setState(() {
      if (isPressedSewaRentang6Bulan) {
        isPressedSewaRentang6Bulan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = true;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void activeTahunan() {
    setState(() {
      if (isPressedSewaRentangTahunan) {
        isPressedSewaRentangTahunan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = true;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void activeSemua() {
    setState(() {
      if (isPressedSewaRentangSemua) {
        isPressedSewaRentangSemua = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = true;
      }
    });
  }

  File? image;
  final picker = ImagePicker();
  String? imageFileName;

  void updateFileName() {
    if (image != null) {
      Uri uri = Uri.file(image!.path);
      imageFileName = utf8.decode(uri.pathSegments.last.codeUnits);
      setState(() {});
    }
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });

    updateFileName();
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });

    updateFileName();
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
                MaterialPageRoute(builder: (context) => FilterProperty()));
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
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              'Rentang Sewa',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: activeHarian,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangHarian
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangHarian
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('harian',
                      style: TextStyle(
                          color: isPressedSewaRentangHarian
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: activeMingguan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangMingguan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangMingguan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('mingguan',
                      style: TextStyle(
                          color: isPressedSewaRentangMingguan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: activeBulanan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangBulanan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangBulanan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('bulanan',
                      style: TextStyle(
                          color: isPressedSewaRentangBulanan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: active3Bulan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentang3Bulan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentang3Bulan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('3 bulan',
                      style: TextStyle(
                          color: isPressedSewaRentang3Bulan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: active6Bulan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentang6Bulan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentang6Bulan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('6 bulan',
                      style: TextStyle(
                          color: isPressedSewaRentang6Bulan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: activeTahunan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangTahunan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangTahunan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('tahunan',
                      style: TextStyle(
                          color: isPressedSewaRentangTahunan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: activeSemua,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangSemua
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangSemua
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('semua',
                      style: TextStyle(
                          color: isPressedSewaRentangSemua
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              'Rentang Harga (Rp)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, left: 10.0, top: 15.0),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 160.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: rentangHarga1Controller,
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
                            vertical: 5.0, horizontal: 10.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Text(
                  'hingga',
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, right: 10.0, top: 15.0),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 160.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: rentangArea1Controller,
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
                            vertical: 5.0, horizontal: 10.0),
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
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              'Rentang Area (meter persegi)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, left: 10.0, top: 15.0),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 160.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: rentangArea2Controller,
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
                            vertical: 5.0, horizontal: 10.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Text(
                  'hingga',
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, right: 10.0, top: 15.0),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 160.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: rentangHarga2Controller,
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
                            vertical: 5.0, horizontal: 10.0),
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
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Kamar Mandi',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(
                width: 108,
              ),
              ElevatedButton(
                onPressed: activeKamarMandiDalam,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        isPressedSewaTipeKamarMandiDalam
                            ? Color.fromARGB(255, 205, 166, 122)
                            : Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(
                                color: isPressedSewaTipeKamarMandiDalam
                                    ? Colors.transparent
                                    : Color.fromARGB(255, 205, 166, 122))))),
                child: Text('dalam',
                    style: TextStyle(
                        color: isPressedSewaTipeKamarMandiDalam
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
                        isPressedSewaTipeKamarMandiLuar
                            ? Color.fromARGB(255, 205, 166, 122)
                            : Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(
                                color: isPressedSewaTipeKamarMandiLuar
                                    ? Colors.transparent
                                    : Color.fromARGB(255, 205, 166, 122))))),
                child: Text('luar',
                    style: TextStyle(
                        color: isPressedSewaTipeKamarMandiLuar
                            ? Colors.white
                            : Color.fromARGB(255, 121, 121, 121))),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Tipe Kost',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(
                width: 65,
              ),
              ElevatedButton(
                onPressed: activeTipeKostPutra,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        isPressedSewaTipeKostPutra
                            ? Color.fromARGB(255, 205, 166, 122)
                            : Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(
                                color: isPressedSewaTipeKostPutra
                                    ? Colors.transparent
                                    : Color.fromARGB(255, 205, 166, 122))))),
                child: Text('putra',
                    style: TextStyle(
                        color: isPressedSewaTipeKostPutra
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
                        isPressedSewaTipeKostPutri
                            ? Color.fromARGB(255, 205, 166, 122)
                            : Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(
                                color: isPressedSewaTipeKostPutri
                                    ? Colors.transparent
                                    : Color.fromARGB(255, 205, 166, 122))))),
                child: Text('putri',
                    style: TextStyle(
                        color: isPressedSewaTipeKostPutri
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
                        isPressedSewaTipeKostCampur
                            ? Color.fromARGB(255, 205, 166, 122)
                            : Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(
                                color: isPressedSewaTipeKostCampur
                                    ? Colors.transparent
                                    : Color.fromARGB(255, 205, 166, 122))))),
                child: Text('campur',
                    style: TextStyle(
                        color: isPressedSewaTipeKostCampur
                            ? Colors.white
                            : Color.fromARGB(255, 121, 121, 121))),
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
                  padding: const EdgeInsets.only(left: 25.0, top: 10.0),
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
                  padding: const EdgeInsets.only(right: 25.0, top: 10.0),
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

          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PropertyPage()));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 205, 166, 122)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122))))),
              child: const Text('Cari Properti'),
            ),
          )
        ],
      ),
    );
  }
}

// Sewa Apartement
class SewaApartement extends StatefulWidget {
  const SewaApartement({super.key});

  @override
  State<SewaApartement> createState() => _SewaApartementState();
}

class _SewaApartementState extends State<SewaApartement> {
  final formField = GlobalKey<FormState>();

  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController rentangHarga1Controller = TextEditingController();
  final TextEditingController rentangHarga2Controller = TextEditingController();
  final TextEditingController rentangArea1Controller = TextEditingController();
  final TextEditingController rentangArea2Controller = TextEditingController();
  final TextEditingController jumlahKamarTidurController =
      TextEditingController();
  final TextEditingController jumlahKamarMandiController =
      TextEditingController();
  final TextEditingController ketinggianController = TextEditingController();

  bool isPressedSewaRentangHarian = false;
  bool isPressedSewaRentangMingguan = false;
  bool isPressedSewaRentangBulanan = false;
  bool isPressedSewaRentang3Bulan = false;
  bool isPressedSewaRentang6Bulan = false;
  bool isPressedSewaRentangTahunan = false;
  bool isPressedSewaRentangSemua = false;

  void activeHarian() {
    setState(() {
      if (isPressedSewaRentangHarian) {
        isPressedSewaRentangHarian = false;
      } else {
        isPressedSewaRentangHarian = true;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void activeMingguan() {
    setState(() {
      if (isPressedSewaRentangMingguan) {
        isPressedSewaRentangMingguan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = true;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void activeBulanan() {
    setState(() {
      if (isPressedSewaRentangBulanan) {
        isPressedSewaRentangBulanan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = true;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void active3Bulan() {
    setState(() {
      if (isPressedSewaRentang3Bulan) {
        isPressedSewaRentang3Bulan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = true;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void active6Bulan() {
    setState(() {
      if (isPressedSewaRentang6Bulan) {
        isPressedSewaRentang6Bulan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = true;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void activeTahunan() {
    setState(() {
      if (isPressedSewaRentangTahunan) {
        isPressedSewaRentangTahunan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = true;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void activeSemua() {
    setState(() {
      if (isPressedSewaRentangSemua) {
        isPressedSewaRentangSemua = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = true;
      }
    });
  }

  File? image;
  final picker = ImagePicker();
  String? imageFileName;

  void updateFileName() {
    if (image != null) {
      Uri uri = Uri.file(image!.path);
      imageFileName = utf8.decode(uri.pathSegments.last.codeUnits);
      setState(() {});
    }
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });

    updateFileName();
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });

    updateFileName();
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
                MaterialPageRoute(builder: (context) => FilterProperty()));
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
                  hintText: 'Lokasi Apartement',
                  // suffixIcon: Icon(Icons.search_rounded),
                ),
              ),
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              'Rentang Sewa',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: activeHarian,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangHarian
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangHarian
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('harian',
                      style: TextStyle(
                          color: isPressedSewaRentangHarian
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: activeMingguan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangMingguan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangMingguan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('mingguan',
                      style: TextStyle(
                          color: isPressedSewaRentangMingguan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: activeBulanan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangBulanan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangBulanan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('bulanan',
                      style: TextStyle(
                          color: isPressedSewaRentangBulanan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: active3Bulan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentang3Bulan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentang3Bulan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('3 bulan',
                      style: TextStyle(
                          color: isPressedSewaRentang3Bulan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: active6Bulan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentang6Bulan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentang6Bulan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('6 bulan',
                      style: TextStyle(
                          color: isPressedSewaRentang6Bulan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: activeTahunan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangTahunan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangTahunan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('tahunan',
                      style: TextStyle(
                          color: isPressedSewaRentangTahunan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: activeSemua,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangSemua
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangSemua
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('semua',
                      style: TextStyle(
                          color: isPressedSewaRentangSemua
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              'Rentang Harga (Rp)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, left: 10.0, top: 15.0),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 160.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: rentangHarga1Controller,
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
                            vertical: 5.0, horizontal: 10.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Text(
                  'hingga',
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, right: 10.0, top: 15.0),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 160.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: rentangArea1Controller,
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
                            vertical: 5.0, horizontal: 10.0),
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
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              'Rentang Area (meter persegi)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, left: 10.0, top: 15.0),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 160.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: rentangArea2Controller,
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
                            vertical: 5.0, horizontal: 10.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Text(
                  'hingga',
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, right: 10.0, top: 15.0),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 160.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: rentangHarga2Controller,
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
                            vertical: 5.0, horizontal: 10.0),
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
                  padding: const EdgeInsets.only(left: 25.0, top: 10.0),
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
                  padding: const EdgeInsets.only(right: 25.0, top: 10.0),
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

          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PropertyPage()));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 205, 166, 122)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122))))),
              child: const Text('Cari Properti'),
            ),
          )
        ],
      ),
    );
  }
}

// Sewa Komersil
class SewaKomersil extends StatefulWidget {
  const SewaKomersil({super.key});

  @override
  State<SewaKomersil> createState() => _SewaKomersilState();
}

class _SewaKomersilState extends State<SewaKomersil> {
  final formField = GlobalKey<FormState>();

  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController rentangHarga1Controller = TextEditingController();
  final TextEditingController rentangHarga2Controller = TextEditingController();
  final TextEditingController rentangArea1Controller = TextEditingController();
  final TextEditingController rentangArea2Controller = TextEditingController();
  final TextEditingController jumlahKamarTidurController =
      TextEditingController();
  final TextEditingController jumlahKamarMandiController =
      TextEditingController();
  final TextEditingController ketinggianController = TextEditingController();

  bool isPressedSewaRentangHarian = false;
  bool isPressedSewaRentangMingguan = false;
  bool isPressedSewaRentangBulanan = false;
  bool isPressedSewaRentang3Bulan = false;
  bool isPressedSewaRentang6Bulan = false;
  bool isPressedSewaRentangTahunan = false;
  bool isPressedSewaRentangSemua = false;

  void activeHarian() {
    setState(() {
      if (isPressedSewaRentangHarian) {
        isPressedSewaRentangHarian = false;
      } else {
        isPressedSewaRentangHarian = true;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void activeMingguan() {
    setState(() {
      if (isPressedSewaRentangMingguan) {
        isPressedSewaRentangMingguan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = true;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void activeBulanan() {
    setState(() {
      if (isPressedSewaRentangBulanan) {
        isPressedSewaRentangBulanan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = true;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void active3Bulan() {
    setState(() {
      if (isPressedSewaRentang3Bulan) {
        isPressedSewaRentang3Bulan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = true;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void active6Bulan() {
    setState(() {
      if (isPressedSewaRentang6Bulan) {
        isPressedSewaRentang6Bulan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = true;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void activeTahunan() {
    setState(() {
      if (isPressedSewaRentangTahunan) {
        isPressedSewaRentangTahunan = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = true;
        isPressedSewaRentangSemua = false;
      }
    });
  }

  void activeSemua() {
    setState(() {
      if (isPressedSewaRentangSemua) {
        isPressedSewaRentangSemua = false;
      } else {
        isPressedSewaRentangHarian = false;
        isPressedSewaRentangMingguan = false;
        isPressedSewaRentangBulanan = false;
        isPressedSewaRentang3Bulan = false;
        isPressedSewaRentang6Bulan = false;
        isPressedSewaRentangTahunan = false;
        isPressedSewaRentangSemua = true;
      }
    });
  }

  File? image;
  final picker = ImagePicker();
  String? imageFileName;

  void updateFileName() {
    if (image != null) {
      Uri uri = Uri.file(image!.path);
      imageFileName = utf8.decode(uri.pathSegments.last.codeUnits);
      setState(() {});
    }
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });

    updateFileName();
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });

    updateFileName();
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
                MaterialPageRoute(builder: (context) => FilterProperty()));
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
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              'Rentang Sewa',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: activeHarian,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangHarian
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangHarian
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('harian',
                      style: TextStyle(
                          color: isPressedSewaRentangHarian
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: activeMingguan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangMingguan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangMingguan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('mingguan',
                      style: TextStyle(
                          color: isPressedSewaRentangMingguan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: activeBulanan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangBulanan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangBulanan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('bulanan',
                      style: TextStyle(
                          color: isPressedSewaRentangBulanan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: active3Bulan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentang3Bulan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentang3Bulan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('3 bulan',
                      style: TextStyle(
                          color: isPressedSewaRentang3Bulan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: active6Bulan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentang6Bulan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentang6Bulan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('6 bulan',
                      style: TextStyle(
                          color: isPressedSewaRentang6Bulan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: activeTahunan,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangTahunan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangTahunan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('tahunan',
                      style: TextStyle(
                          color: isPressedSewaRentangTahunan
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: activeSemua,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isPressedSewaRentangSemua
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewaRentangSemua
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('semua',
                      style: TextStyle(
                          color: isPressedSewaRentangSemua
                              ? Colors.white
                              : Color.fromARGB(255, 121, 121, 121))),
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              'Rentang Harga (Rp)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, left: 10.0, top: 15.0),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 160.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: rentangHarga1Controller,
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
                            vertical: 5.0, horizontal: 10.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Text(
                  'hingga',
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, right: 10.0, top: 15.0),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 160.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: rentangArea1Controller,
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
                            vertical: 5.0, horizontal: 10.0),
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
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              'Rentang Area (meter persegi)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, left: 10.0, top: 15.0),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 160.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: rentangArea2Controller,
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
                            vertical: 5.0, horizontal: 10.0),
                        hintText: '',
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Text(
                  'hingga',
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, right: 10.0, top: 15.0),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 160.0,
                    height: 35.0,
                    child: TextFormField(
                      controller: rentangHarga2Controller,
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
                            vertical: 5.0, horizontal: 10.0),
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
                  padding: const EdgeInsets.only(left: 25.0, top: 10.0),
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
                  padding: const EdgeInsets.only(right: 25.0, top: 10.0),
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

          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PropertyPage()));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 205, 166, 122)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122))))),
              child: const Text('Cari Properti'),
            ),
          )
        ],
      ),
    );
  }
}
