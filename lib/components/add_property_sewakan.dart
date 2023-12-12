import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:app_development/pages/pasang_iklan_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_udid/flutter_udid.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';

// Sewakan Rumah
class SewakanRumah extends StatefulWidget {
  const SewakanRumah({super.key});

  @override
  State<SewakanRumah> createState() => _SewakanRumahState();
}

class _SewakanRumahState extends State<SewakanRumah> {
  final formField = GlobalKey<FormState>();

  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController luasController = TextEditingController();
  final TextEditingController jumlahKamarTidurController =
      TextEditingController();
  final TextEditingController jumlahKamarMandiController =
      TextEditingController();
  final TextEditingController ketinggianController = TextEditingController();

  final TextEditingController rentangHarga1Controller = TextEditingController();
  final TextEditingController rentangHarga2Controller = TextEditingController();
  final TextEditingController rentangArea1Controller = TextEditingController();
  final TextEditingController rentangArea2Controller = TextEditingController();

  bool isPressedSewakanRentangHarian = false;
  bool isPressedSewakanRentangMingguan = false;
  bool isPressedSewakanRentangBulanan = false;
  bool isPressedSewakanRentang3Bulan = false;
  bool isPressedSewakanRentang6Bulan = false;
  bool isPressedSewakanRentangTahunan = false;
  bool isPressedSewakanRentangSemua = false;

  void activeHarian() {
    setState(() {
      if (isPressedSewakanRentangHarian) {
        isPressedSewakanRentangHarian = false;
      } else {
        isPressedSewakanRentangHarian = true;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void activeMingguan() {
    setState(() {
      if (isPressedSewakanRentangMingguan) {
        isPressedSewakanRentangMingguan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = true;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void activeBulanan() {
    setState(() {
      if (isPressedSewakanRentangBulanan) {
        isPressedSewakanRentangBulanan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = true;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void active3Bulan() {
    setState(() {
      if (isPressedSewakanRentang3Bulan) {
        isPressedSewakanRentang3Bulan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = true;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void active6Bulan() {
    setState(() {
      if (isPressedSewakanRentang6Bulan) {
        isPressedSewakanRentang6Bulan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = true;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void activeTahunan() {
    setState(() {
      if (isPressedSewakanRentangTahunan) {
        isPressedSewakanRentangTahunan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = true;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void activeSemua() {
    setState(() {
      if (isPressedSewakanRentangSemua) {
        isPressedSewakanRentangSemua = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = true;
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
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FilterPasangIklan()));
                },
              ),
            ],
          ),
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
                          isPressedSewakanRentangHarian
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangHarian
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('harian',
                      style: TextStyle(
                          color: isPressedSewakanRentangHarian
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
                          isPressedSewakanRentangMingguan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangMingguan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('mingguan',
                      style: TextStyle(
                          color: isPressedSewakanRentangMingguan
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
                          isPressedSewakanRentangBulanan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangBulanan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('bulanan',
                      style: TextStyle(
                          color: isPressedSewakanRentangBulanan
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
                          isPressedSewakanRentang3Bulan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentang3Bulan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('3 bulan',
                      style: TextStyle(
                          color: isPressedSewakanRentang3Bulan
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
                          isPressedSewakanRentang6Bulan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentang6Bulan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('6 bulan',
                      style: TextStyle(
                          color: isPressedSewakanRentang6Bulan
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
                          isPressedSewakanRentangTahunan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangTahunan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('tahunan',
                      style: TextStyle(
                          color: isPressedSewakanRentangTahunan
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
                          isPressedSewakanRentangSemua
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangSemua
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('semua',
                      style: TextStyle(
                          color: isPressedSewakanRentangSemua
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
            height: 15,
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Foto Properti',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(imageFileName ?? 'No image selected'),
              SizedBox(
                width: 15,
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
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BottomNavBar()));
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

// Sewakan Tanah
class SewakanTanah extends StatefulWidget {
  const SewakanTanah({super.key});

  @override
  State<SewakanTanah> createState() => _SewakanTanahState();
}

class _SewakanTanahState extends State<SewakanTanah> {
  final formField = GlobalKey<FormState>();

  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController luasController = TextEditingController();
  final TextEditingController jumlahKamarTidurController =
      TextEditingController();
  final TextEditingController jumlahKamarMandiController =
      TextEditingController();
  final TextEditingController ketinggianController = TextEditingController();

  final TextEditingController rentangHarga1Controller = TextEditingController();
  final TextEditingController rentangHarga2Controller = TextEditingController();
  final TextEditingController rentangArea1Controller = TextEditingController();
  final TextEditingController rentangArea2Controller = TextEditingController();

  bool isPressedSewakanRentangHarian = false;
  bool isPressedSewakanRentangMingguan = false;
  bool isPressedSewakanRentangBulanan = false;
  bool isPressedSewakanRentang3Bulan = false;
  bool isPressedSewakanRentang6Bulan = false;
  bool isPressedSewakanRentangTahunan = false;
  bool isPressedSewakanRentangSemua = false;

  void activeHarian() {
    setState(() {
      if (isPressedSewakanRentangHarian) {
        isPressedSewakanRentangHarian = false;
      } else {
        isPressedSewakanRentangHarian = true;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void activeMingguan() {
    setState(() {
      if (isPressedSewakanRentangMingguan) {
        isPressedSewakanRentangMingguan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = true;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void activeBulanan() {
    setState(() {
      if (isPressedSewakanRentangBulanan) {
        isPressedSewakanRentangBulanan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = true;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void active3Bulan() {
    setState(() {
      if (isPressedSewakanRentang3Bulan) {
        isPressedSewakanRentang3Bulan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = true;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void active6Bulan() {
    setState(() {
      if (isPressedSewakanRentang6Bulan) {
        isPressedSewakanRentang6Bulan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = true;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void activeTahunan() {
    setState(() {
      if (isPressedSewakanRentangTahunan) {
        isPressedSewakanRentangTahunan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = true;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void activeSemua() {
    setState(() {
      if (isPressedSewakanRentangSemua) {
        isPressedSewakanRentangSemua = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = true;
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
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FilterPasangIklan()));
                },
              ),
            ],
          ),
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
                          isPressedSewakanRentangHarian
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangHarian
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('harian',
                      style: TextStyle(
                          color: isPressedSewakanRentangHarian
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
                          isPressedSewakanRentangMingguan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangMingguan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('mingguan',
                      style: TextStyle(
                          color: isPressedSewakanRentangMingguan
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
                          isPressedSewakanRentangBulanan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangBulanan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('bulanan',
                      style: TextStyle(
                          color: isPressedSewakanRentangBulanan
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
                          isPressedSewakanRentang3Bulan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentang3Bulan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('3 bulan',
                      style: TextStyle(
                          color: isPressedSewakanRentang3Bulan
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
                          isPressedSewakanRentang6Bulan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentang6Bulan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('6 bulan',
                      style: TextStyle(
                          color: isPressedSewakanRentang6Bulan
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
                          isPressedSewakanRentangTahunan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangTahunan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('tahunan',
                      style: TextStyle(
                          color: isPressedSewakanRentangTahunan
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
                          isPressedSewakanRentangSemua
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangSemua
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('semua',
                      style: TextStyle(
                          color: isPressedSewakanRentangSemua
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
            height: 15,
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Foto Properti',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(imageFileName ?? 'No image selected'),
              SizedBox(
                width: 15,
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
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BottomNavBar()));
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

// Sewakan Kost
class SewakanKost extends StatefulWidget {
  const SewakanKost({super.key});

  @override
  State<SewakanKost> createState() => _SewakanKostState();
}

class _SewakanKostState extends State<SewakanKost> {
  final formField = GlobalKey<FormState>();

  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController luasController = TextEditingController();
  final TextEditingController jumlahKamarTidurController =
      TextEditingController();
  final TextEditingController jumlahKamarMandiController =
      TextEditingController();
  final TextEditingController ketinggianController = TextEditingController();

  bool isPressedSewakanTipeKamarMandiDalam = false;
  bool isPressedSewakanTipeKamarMandiLuar = false;
  bool isPressedSewakanTipeKostPutra = false;
  bool isPressedSewakanTipeKostPutri = false;
  bool isPressedSewakanTipeKostCampur = false;

  final TextEditingController rentangHarga1Controller = TextEditingController();
  final TextEditingController rentangHarga2Controller = TextEditingController();
  final TextEditingController rentangArea1Controller = TextEditingController();
  final TextEditingController rentangArea2Controller = TextEditingController();

  bool isPressedSewakanRentangHarian = false;
  bool isPressedSewakanRentangMingguan = false;
  bool isPressedSewakanRentangBulanan = false;
  bool isPressedSewakanRentang3Bulan = false;
  bool isPressedSewakanRentang6Bulan = false;
  bool isPressedSewakanRentangTahunan = false;
  bool isPressedSewakanRentangSemua = false;

  void activeHarian() {
    setState(() {
      if (isPressedSewakanRentangHarian) {
        isPressedSewakanRentangHarian = false;
      } else {
        isPressedSewakanRentangHarian = true;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void activeMingguan() {
    setState(() {
      if (isPressedSewakanRentangMingguan) {
        isPressedSewakanRentangMingguan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = true;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void activeBulanan() {
    setState(() {
      if (isPressedSewakanRentangBulanan) {
        isPressedSewakanRentangBulanan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = true;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void active3Bulan() {
    setState(() {
      if (isPressedSewakanRentang3Bulan) {
        isPressedSewakanRentang3Bulan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = true;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void active6Bulan() {
    setState(() {
      if (isPressedSewakanRentang6Bulan) {
        isPressedSewakanRentang6Bulan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = true;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void activeTahunan() {
    setState(() {
      if (isPressedSewakanRentangTahunan) {
        isPressedSewakanRentangTahunan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = true;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void activeSemua() {
    setState(() {
      if (isPressedSewakanRentangSemua) {
        isPressedSewakanRentangSemua = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = true;
      }
    });
  }

  void activeKamarMandiDalam() {
    setState(() {
      if (isPressedSewakanTipeKamarMandiDalam) {
        isPressedSewakanTipeKamarMandiDalam = false;
      } else {
        isPressedSewakanTipeKamarMandiDalam = true;
        isPressedSewakanTipeKamarMandiLuar = false;
      }
    });
  }

  void activeKamarMandiLuar() {
    setState(() {
      if (isPressedSewakanTipeKamarMandiLuar) {
        isPressedSewakanTipeKamarMandiLuar = false;
      } else {
        isPressedSewakanTipeKamarMandiDalam = false;
        isPressedSewakanTipeKamarMandiLuar = true;
      }
    });
  }

  void activeTipeKostPutra() {
    setState(() {
      if (isPressedSewakanTipeKostPutra) {
        isPressedSewakanTipeKostPutra = false;
      } else {
        isPressedSewakanTipeKostPutra = true;
        isPressedSewakanTipeKostPutri = false;
        isPressedSewakanTipeKostCampur = false;
      }
    });
  }

  void activeTipeKostPutri() {
    setState(() {
      if (isPressedSewakanTipeKostPutri) {
        isPressedSewakanTipeKostPutri = false;
      } else {
        isPressedSewakanTipeKostPutra = false;
        isPressedSewakanTipeKostPutri = true;
        isPressedSewakanTipeKostCampur = false;
      }
    });
  }

  void activeTipeKostCampur() {
    setState(() {
      if (isPressedSewakanTipeKostCampur) {
        isPressedSewakanTipeKostCampur = false;
      } else {
        isPressedSewakanTipeKostPutra = false;
        isPressedSewakanTipeKostPutri = false;
        isPressedSewakanTipeKostCampur = true;
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
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FilterPasangIklan()));
                },
              ),
            ],
          ),
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
                          isPressedSewakanRentangHarian
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangHarian
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('harian',
                      style: TextStyle(
                          color: isPressedSewakanRentangHarian
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
                          isPressedSewakanRentangMingguan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangMingguan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('mingguan',
                      style: TextStyle(
                          color: isPressedSewakanRentangMingguan
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
                          isPressedSewakanRentangBulanan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangBulanan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('bulanan',
                      style: TextStyle(
                          color: isPressedSewakanRentangBulanan
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
                          isPressedSewakanRentang3Bulan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentang3Bulan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('3 bulan',
                      style: TextStyle(
                          color: isPressedSewakanRentang3Bulan
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
                          isPressedSewakanRentang6Bulan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentang6Bulan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('6 bulan',
                      style: TextStyle(
                          color: isPressedSewakanRentang6Bulan
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
                          isPressedSewakanRentangTahunan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangTahunan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('tahunan',
                      style: TextStyle(
                          color: isPressedSewakanRentangTahunan
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
                          isPressedSewakanRentangSemua
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangSemua
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('semua',
                      style: TextStyle(
                          color: isPressedSewakanRentangSemua
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
                        isPressedSewakanTipeKamarMandiDalam
                            ? Color.fromARGB(255, 205, 166, 122)
                            : Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(
                                color: isPressedSewakanTipeKamarMandiDalam
                                    ? Colors.transparent
                                    : Color.fromARGB(255, 205, 166, 122))))),
                child: Text('dalam',
                    style: TextStyle(
                        color: isPressedSewakanTipeKamarMandiDalam
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
                        isPressedSewakanTipeKamarMandiLuar
                            ? Color.fromARGB(255, 205, 166, 122)
                            : Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(
                                color: isPressedSewakanTipeKamarMandiLuar
                                    ? Colors.transparent
                                    : Color.fromARGB(255, 205, 166, 122))))),
                child: Text('luar',
                    style: TextStyle(
                        color: isPressedSewakanTipeKamarMandiLuar
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
                        isPressedSewakanTipeKostPutra
                            ? Color.fromARGB(255, 205, 166, 122)
                            : Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(
                                color: isPressedSewakanTipeKostPutra
                                    ? Colors.transparent
                                    : Color.fromARGB(255, 205, 166, 122))))),
                child: Text('putra',
                    style: TextStyle(
                        color: isPressedSewakanTipeKostPutra
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
                        isPressedSewakanTipeKostPutri
                            ? Color.fromARGB(255, 205, 166, 122)
                            : Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(
                                color: isPressedSewakanTipeKostPutri
                                    ? Colors.transparent
                                    : Color.fromARGB(255, 205, 166, 122))))),
                child: Text('putri',
                    style: TextStyle(
                        color: isPressedSewakanTipeKostPutri
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
                        isPressedSewakanTipeKostCampur
                            ? Color.fromARGB(255, 205, 166, 122)
                            : Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(
                                color: isPressedSewakanTipeKostCampur
                                    ? Colors.transparent
                                    : Color.fromARGB(255, 205, 166, 122))))),
                child: Text('campur',
                    style: TextStyle(
                        color: isPressedSewakanTipeKostCampur
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
            height: 15,
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Foto Properti',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(imageFileName ?? 'No image selected'),
              SizedBox(
                width: 15,
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
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BottomNavBar()));
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

// Sewakan Apartement
class SewakanApartement extends StatefulWidget {
  const SewakanApartement({super.key});

  @override
  State<SewakanApartement> createState() => _SewakanApartementState();
}

class _SewakanApartementState extends State<SewakanApartement> {
  final formField = GlobalKey<FormState>();

  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController luasController = TextEditingController();
  final TextEditingController jumlahKamarTidurController =
      TextEditingController();
  final TextEditingController jumlahKamarMandiController =
      TextEditingController();
  final TextEditingController ketinggianController = TextEditingController();

  final TextEditingController rentangHarga1Controller = TextEditingController();
  final TextEditingController rentangHarga2Controller = TextEditingController();
  final TextEditingController rentangArea1Controller = TextEditingController();
  final TextEditingController rentangArea2Controller = TextEditingController();

  bool isPressedSewakanRentangHarian = false;
  bool isPressedSewakanRentangMingguan = false;
  bool isPressedSewakanRentangBulanan = false;
  bool isPressedSewakanRentang3Bulan = false;
  bool isPressedSewakanRentang6Bulan = false;
  bool isPressedSewakanRentangTahunan = false;
  bool isPressedSewakanRentangSemua = false;

  void activeHarian() {
    setState(() {
      if (isPressedSewakanRentangHarian) {
        isPressedSewakanRentangHarian = false;
      } else {
        isPressedSewakanRentangHarian = true;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void activeMingguan() {
    setState(() {
      if (isPressedSewakanRentangMingguan) {
        isPressedSewakanRentangMingguan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = true;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void activeBulanan() {
    setState(() {
      if (isPressedSewakanRentangBulanan) {
        isPressedSewakanRentangBulanan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = true;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void active3Bulan() {
    setState(() {
      if (isPressedSewakanRentang3Bulan) {
        isPressedSewakanRentang3Bulan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = true;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void active6Bulan() {
    setState(() {
      if (isPressedSewakanRentang6Bulan) {
        isPressedSewakanRentang6Bulan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = true;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void activeTahunan() {
    setState(() {
      if (isPressedSewakanRentangTahunan) {
        isPressedSewakanRentangTahunan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = true;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void activeSemua() {
    setState(() {
      if (isPressedSewakanRentangSemua) {
        isPressedSewakanRentangSemua = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = true;
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
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FilterPasangIklan()));
                },
              ),
            ],
          ),
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
                          isPressedSewakanRentangHarian
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangHarian
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('harian',
                      style: TextStyle(
                          color: isPressedSewakanRentangHarian
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
                          isPressedSewakanRentangMingguan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangMingguan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('mingguan',
                      style: TextStyle(
                          color: isPressedSewakanRentangMingguan
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
                          isPressedSewakanRentangBulanan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangBulanan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('bulanan',
                      style: TextStyle(
                          color: isPressedSewakanRentangBulanan
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
                          isPressedSewakanRentang3Bulan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentang3Bulan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('3 bulan',
                      style: TextStyle(
                          color: isPressedSewakanRentang3Bulan
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
                          isPressedSewakanRentang6Bulan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentang6Bulan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('6 bulan',
                      style: TextStyle(
                          color: isPressedSewakanRentang6Bulan
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
                          isPressedSewakanRentangTahunan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangTahunan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('tahunan',
                      style: TextStyle(
                          color: isPressedSewakanRentangTahunan
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
                          isPressedSewakanRentangSemua
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangSemua
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('semua',
                      style: TextStyle(
                          color: isPressedSewakanRentangSemua
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
            height: 15,
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Foto Properti',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(imageFileName ?? 'No image selected'),
              SizedBox(
                width: 15,
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
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BottomNavBar()));
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

// Sewakan Komersil
class SewakanKomersil extends StatefulWidget {
  const SewakanKomersil({super.key});

  @override
  State<SewakanKomersil> createState() => _SewakanKomersilState();
}

class _SewakanKomersilState extends State<SewakanKomersil> {
  final formField = GlobalKey<FormState>();

  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController luasController = TextEditingController();
  final TextEditingController jumlahKamarTidurController =
      TextEditingController();
  final TextEditingController jumlahKamarMandiController =
      TextEditingController();
  final TextEditingController ketinggianController = TextEditingController();

  final TextEditingController rentangHarga1Controller = TextEditingController();
  final TextEditingController rentangHarga2Controller = TextEditingController();
  final TextEditingController rentangArea1Controller = TextEditingController();
  final TextEditingController rentangArea2Controller = TextEditingController();

  bool isPressedSewakanRentangHarian = false;
  bool isPressedSewakanRentangMingguan = false;
  bool isPressedSewakanRentangBulanan = false;
  bool isPressedSewakanRentang3Bulan = false;
  bool isPressedSewakanRentang6Bulan = false;
  bool isPressedSewakanRentangTahunan = false;
  bool isPressedSewakanRentangSemua = false;

  void activeHarian() {
    setState(() {
      if (isPressedSewakanRentangHarian) {
        isPressedSewakanRentangHarian = false;
      } else {
        isPressedSewakanRentangHarian = true;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void activeMingguan() {
    setState(() {
      if (isPressedSewakanRentangMingguan) {
        isPressedSewakanRentangMingguan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = true;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void activeBulanan() {
    setState(() {
      if (isPressedSewakanRentangBulanan) {
        isPressedSewakanRentangBulanan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = true;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void active3Bulan() {
    setState(() {
      if (isPressedSewakanRentang3Bulan) {
        isPressedSewakanRentang3Bulan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = true;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void active6Bulan() {
    setState(() {
      if (isPressedSewakanRentang6Bulan) {
        isPressedSewakanRentang6Bulan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = true;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void activeTahunan() {
    setState(() {
      if (isPressedSewakanRentangTahunan) {
        isPressedSewakanRentangTahunan = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = true;
        isPressedSewakanRentangSemua = false;
      }
    });
  }

  void activeSemua() {
    setState(() {
      if (isPressedSewakanRentangSemua) {
        isPressedSewakanRentangSemua = false;
      } else {
        isPressedSewakanRentangHarian = false;
        isPressedSewakanRentangMingguan = false;
        isPressedSewakanRentangBulanan = false;
        isPressedSewakanRentang3Bulan = false;
        isPressedSewakanRentang6Bulan = false;
        isPressedSewakanRentangTahunan = false;
        isPressedSewakanRentangSemua = true;
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
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FilterPasangIklan()));
                },
              ),
            ],
          ),
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
                          isPressedSewakanRentangHarian
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangHarian
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('harian',
                      style: TextStyle(
                          color: isPressedSewakanRentangHarian
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
                          isPressedSewakanRentangMingguan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangMingguan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('mingguan',
                      style: TextStyle(
                          color: isPressedSewakanRentangMingguan
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
                          isPressedSewakanRentangBulanan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangBulanan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('bulanan',
                      style: TextStyle(
                          color: isPressedSewakanRentangBulanan
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
                          isPressedSewakanRentang3Bulan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentang3Bulan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('3 bulan',
                      style: TextStyle(
                          color: isPressedSewakanRentang3Bulan
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
                          isPressedSewakanRentang6Bulan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentang6Bulan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('6 bulan',
                      style: TextStyle(
                          color: isPressedSewakanRentang6Bulan
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
                          isPressedSewakanRentangTahunan
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangTahunan
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('tahunan',
                      style: TextStyle(
                          color: isPressedSewakanRentangTahunan
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
                          isPressedSewakanRentangSemua
                              ? Color.fromARGB(255, 205, 166, 122)
                              : Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                  color: isPressedSewakanRentangSemua
                                      ? Colors.transparent
                                      : Color.fromARGB(255, 205, 166, 122))))),
                  child: Text('semua',
                      style: TextStyle(
                          color: isPressedSewakanRentangSemua
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
            height: 15,
          ),
          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Foto Properti',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(imageFileName ?? 'No image selected'),
              SizedBox(
                width: 15,
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
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BottomNavBar()));
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
