import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'package:app_development/components/dropdown_lokasi.dart';
import 'package:app_development/pages/filter_property_page.dart';
import 'package:app_development/pages/pasang_iklan_page.dart';
import 'package:app_development/pages/property_page.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

var filteredData;

// Beli Komersil
class BeliKomersil extends StatefulWidget {
  const BeliKomersil({super.key});

  @override
  State<BeliKomersil> createState() => _BeliKomersilState();
}

class _BeliKomersilState extends State<BeliKomersil> {
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

  var filteredData;

  Future postFilterToServer() async {
    //current work
    final Uri url = Uri.https('hcihunianku--memories053.repl.co', 'filter');
    String udid = await FlutterUdid.udid;
    String kMandiKos = "";
    String tipeKost = "";

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
        'action': "Beli",
        'type': "Komersial",
        'lokasi': dropdownValue,
        'harga1': rentangHarga1Controller.text,
        'harga2': rentangHarga2Controller.text,
        'area1': rentangArea1Controller.text,
        'area2': rentangArea2Controller.text,
        // 'kMandikos': kMandiKos,
        // 'tipeKost': tipeKost,
        'kTidur': jumlahKamarTidurController.text,
        'kMandi': jumlahKamarMandiController.text,
        'date': formattedDate,
        'status': "Ready"
      }),
    );

    if (response.statusCode == 200) {
      print('Data filtered successfuly');
      filteredData = jsonDecode(response.body);
      //print(filteredData);
    } else {
      print('Failed to filter data. Status Code: ${response.statusCode}');
      print('Error Response: ${response.body}');
    }
  }

  String _addLeadingZero(int number) {
    return number < 10 ? '0$number' : '$number';
  }

  String dropdownValue = "";

  void _onDropdownSelected(String value) {
    setState(() {
      dropdownValue = value;
    });
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
                MaterialPageRoute(builder: (context) => FilterProperty()));
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 15, left: 10, right: 10),
            child: DropDownLokasi(
              onSelected: _onDropdownSelected,
            ),
          ),
          // Form(
          //   key: formField,
          //   autovalidateMode: AutovalidateMode.onUserInteraction,
          //   child: Padding(
          //     padding:
          //         const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
          //     child: TextFormField(
          //       controller: lokasiController,
          //       autovalidateMode: AutovalidateMode.onUserInteraction,
          //       validator: (value) {
          //         if (value == null || value.isEmpty) {
          //           return "Masukkan lokasi properti";
          //         }
          //         return null;
          //       },
          //       decoration: InputDecoration(
          //         enabledBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(20),
          //           borderSide: const BorderSide(
          //               color: Color.fromARGB(255, 205, 166, 122)),
          //         ),
          //         focusedBorder: OutlineInputBorder(
          //             borderSide: BorderSide(color: Colors.grey.shade400),
          //             borderRadius: BorderRadius.circular(20)),
          //         errorBorder: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(20),
          //             borderSide: BorderSide(
          //                 color: Color.fromARGB(255, 205, 166, 122))),
          //         focusedErrorBorder: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(20),
          //             borderSide: BorderSide(
          //                 color: Color.fromARGB(255, 205, 166, 122))),
          //         fillColor: Colors.grey.shade200,
          //         filled: true,
          //         contentPadding: const EdgeInsets.symmetric(
          //             vertical: 10.0, horizontal: 15.0),
          //         hintText: 'Lokasi Properti',
          //         // suffixIcon: Icon(Icons.search_rounded),
          //       ),
          //     ),
          //   ),
          // ),
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
                    const EdgeInsets.only(bottom: 10.0, left: 10.0, top: 15.0),
                child: Wrap(alignment: WrapAlignment.start, children: <Widget>[
                  SizedBox(
                    width: 160.0,
                    // height: 35.0,
                    child: TextFormField(
                      controller: rentangHarga1Controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan harga properti";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: rentangHarga2Controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan harga properti";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: rentangArea1Controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan luas area properti";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: rentangArea2Controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan luas area properti";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: jumlahKamarTidurController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan jumlah kamar tidur";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: jumlahKamarMandiController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan jumlah kamar mandi";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
              onPressed: () async {
                await postFilterToServer();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PropertyPage(filteredData: filteredData)));
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

// Beli Rumah
class BeliRumah extends StatefulWidget {
  const BeliRumah({super.key});

  @override
  State<BeliRumah> createState() => _BeliRumahState();
}

class _BeliRumahState extends State<BeliRumah> {
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

  String _addLeadingZero(int number) {
    return number < 10 ? '0$number' : '$number';
  }

  String dropdownValue = "";

  void _onDropdownSelected(String value) {
    setState(() {
      dropdownValue = value;
    });
  }

  var filteredData;

  Future postFilterToServer() async {
    //current work
    final Uri url = Uri.https('hcihunianku--memories053.repl.co', 'filter');
    String udid = await FlutterUdid.udid;

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
        'action': "Beli",
        'type': "Rumah",
        'lokasi': dropdownValue,
        'harga1': rentangHarga1Controller.text,
        'harga2': rentangHarga2Controller.text,
        'area1': rentangArea1Controller.text,
        'area2': rentangArea2Controller.text,
        // 'kMandikos': kMandiKos,
        // 'tipeKost': tipeKost,
        'kTidur': jumlahKamarTidurController.text,
        'kMandi': jumlahKamarMandiController.text,
        'date': formattedDate,
        'status': "Ready"
      }),
    );

    if (response.statusCode == 200) {
      print('Data filtered successfuly');
      filteredData = jsonDecode(response.body);
      print(filteredData);
    } else {
      print('Failed to filter data. Status Code: ${response.statusCode}');
      print('Error Response: ${response.body}');
    }

    ///
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
                MaterialPageRoute(builder: (context) => FilterProperty()));
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 15, left: 10, right: 10),
            child: DropDownLokasi(
              onSelected: _onDropdownSelected,
            ),
          ),
          // Form(
          //   key: formField,
          //   autovalidateMode: AutovalidateMode.onUserInteraction,
          //   child: Padding(
          //     padding:
          //         const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
          //     child: TextFormField(
          //       controller: lokasiController,
          //       autovalidateMode: AutovalidateMode.onUserInteraction,
          //       validator: (value) {
          //         if (value == null || value.isEmpty) {
          //           return "Masukkan lokasi rumah";
          //         }
          //         return null;
          //       },
          //       decoration: InputDecoration(
          //         enabledBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(20),
          //           borderSide: const BorderSide(
          //               color: Color.fromARGB(255, 205, 166, 122)),
          //         ),
          //         focusedBorder: OutlineInputBorder(
          //           borderSide: BorderSide(color: Colors.grey.shade400),
          //         ),
          //         fillColor: Colors.grey.shade200,
          //         filled: true,
          //         contentPadding: const EdgeInsets.symmetric(
          //             vertical: 10.0, horizontal: 15.0),
          //         hintText: 'Lokasi Rumah',
          //         // suffixIcon: Icon(Icons.search_rounded),
          //       ),
          //     ),
          //   ),
          // ),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: rentangHarga1Controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan harga properti";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: rentangHarga2Controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan harga properti";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: rentangArea1Controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan luas area properti";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: rentangArea2Controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan luas area properti";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: jumlahKamarTidurController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan jumlah kamar tidur";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: jumlahKamarMandiController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan jumlah kamar mandi";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
              onPressed: () async {
                await postFilterToServer();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PropertyPage(filteredData: filteredData)));
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

// Beli Apartement
class BeliApartement extends StatefulWidget {
  const BeliApartement({super.key});

  @override
  State<BeliApartement> createState() => _BeliApartementState();
}

class _BeliApartementState extends State<BeliApartement> {
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

  String _addLeadingZero(int number) {
    return number < 10 ? '0$number' : '$number';
  }

  String dropdownValue = "";

  void _onDropdownSelected(String value) {
    setState(() {
      dropdownValue = value;
    });
  }

  var filteredData;

  Future postFilterToServer() async {
    //current work
    final Uri url = Uri.https('hcihunianku--memories053.repl.co', 'filter');
    String udid = await FlutterUdid.udid;
    String kMandiKos = "";
    String tipeKost = "";

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
        'action': "Beli",
        'type': "Apartement",
        'lokasi': dropdownValue,
        'harga1': rentangHarga1Controller.text,
        'harga2': rentangHarga2Controller.text,
        'area1': rentangArea1Controller.text,
        'area2': rentangArea2Controller.text,
        // 'kMandikos': kMandiKos,
        // 'tipeKost': tipeKost,
        'kTidur': jumlahKamarTidurController.text,
        'kMandi': jumlahKamarMandiController.text,
        'date': formattedDate,
        'status': "Ready"
      }),
    );

    if (response.statusCode == 200) {
      print('Data filtered successfuly');
      filteredData = jsonDecode(response.body);
      print(filteredData);
    } else {
      print('Failed to filter data. Status Code: ${response.statusCode}');
      print('Error Response: ${response.body}');
    }

    ///
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
                MaterialPageRoute(builder: (context) => FilterProperty()));
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 15, left: 10, right: 10),
            child: DropDownLokasi(
              onSelected: _onDropdownSelected,
            ),
          ),
          // Form(
          //   key: formField,
          //   autovalidateMode: AutovalidateMode.onUserInteraction,
          //   child: Padding(
          //     padding:
          //         const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
          //     child: TextFormField(
          //       controller: lokasiController,
          //       autovalidateMode: AutovalidateMode.onUserInteraction,
          //       validator: (value) {
          //         if (value == null || value.isEmpty) {
          //           return "Masukkan lokasi apartement";
          //         }
          //         return null;
          //       },
          //       decoration: InputDecoration(
          //         enabledBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(20),
          //           borderSide: const BorderSide(
          //               color: Color.fromARGB(255, 205, 166, 122)),
          //         ),
          //         focusedBorder: OutlineInputBorder(
          //           borderSide: BorderSide(color: Colors.grey.shade400),
          //         ),
          //         fillColor: Colors.grey.shade200,
          //         filled: true,
          //         contentPadding: const EdgeInsets.symmetric(
          //             vertical: 10.0, horizontal: 15.0),
          //         hintText: 'Lokasi apartement',
          //         // suffixIcon: Icon(Icons.search_rounded),
          //       ),
          //     ),
          //   ),
          // ),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: rentangHarga1Controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan harga properti";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: rentangHarga2Controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan harga properti";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: rentangArea1Controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan luas area properti";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: rentangArea2Controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan luas area properti";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: jumlahKamarTidurController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan jumlah kamar tidur";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: jumlahKamarMandiController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan jumlah kamar mandi";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
              onPressed: () async {
                await postFilterToServer();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PropertyPage(filteredData: filteredData)));
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

// Beli Kost
class BeliKost extends StatefulWidget {
  const BeliKost({super.key});

  @override
  State<BeliKost> createState() => _BeliKostState();
}

class _BeliKostState extends State<BeliKost> {
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

  bool isPressedBeliTipeKamarMandiDalam = false;
  bool isPressedBeliTipeKamarMandiLuar = false;
  bool isPressedBeliTipeKostPutra = false;
  bool isPressedBeliTipeKostPutri = false;
  bool isPressedBeliTipeKostCampur = false;

  String kMandiKos = "";
  String tipeKost = "";

  void activeKamarMandiDalam() {
    setState(() {
      if (isPressedBeliTipeKamarMandiDalam) {
        isPressedBeliTipeKamarMandiDalam = false;
      } else {
        isPressedBeliTipeKamarMandiDalam = true;
        isPressedBeliTipeKamarMandiLuar = false;
      }
    });
  }

  void activeKamarMandiLuar() {
    setState(() {
      if (isPressedBeliTipeKamarMandiLuar) {
        isPressedBeliTipeKamarMandiLuar = false;
      } else {
        isPressedBeliTipeKamarMandiDalam = false;
        isPressedBeliTipeKamarMandiLuar = true;
      }
    });
  }

  void activeTipeKostPutra() {
    setState(() {
      if (isPressedBeliTipeKostPutra) {
        isPressedBeliTipeKostPutra = false;
      } else {
        isPressedBeliTipeKostPutra = true;
        isPressedBeliTipeKostPutri = false;
        isPressedBeliTipeKostCampur = false;
      }
    });
  }

  void activeTipeKostPutri() {
    setState(() {
      if (isPressedBeliTipeKostPutri) {
        isPressedBeliTipeKostPutri = false;
      } else {
        isPressedBeliTipeKostPutra = false;
        isPressedBeliTipeKostPutri = true;
        isPressedBeliTipeKostCampur = false;
      }
    });
  }

  void activeTipeKostCampur() {
    setState(() {
      if (isPressedBeliTipeKostCampur) {
        isPressedBeliTipeKostCampur = false;
      } else {
        isPressedBeliTipeKostPutra = false;
        isPressedBeliTipeKostPutri = false;
        isPressedBeliTipeKostCampur = true;
      }
    });
  }

  String _addLeadingZero(int number) {
    return number < 10 ? '0$number' : '$number';
  }

  String dropdownValue = "";

  void _onDropdownSelected(String value) {
    setState(() {
      dropdownValue = value;
    });
  }

  var filteredData;

  Future postFilterToServer() async {
    //current work
    final Uri url = Uri.https('hcihunianku--memories053.repl.co', 'filter');
    String udid = await FlutterUdid.udid;
    String kMandiKos = "";
    String tipeKost = "";

    int timestamp = DateTime.now().millisecondsSinceEpoch;
    if (isPressedBeliTipeKamarMandiDalam == true) {
      kMandiKos = "Dalam";
    } else if (isPressedBeliTipeKamarMandiLuar == true) {
      kMandiKos = "Luar";
    }

    if (isPressedBeliTipeKostPutra == true) {
      tipeKost = "Putra";
    } else if (isPressedBeliTipeKostPutri == true) {
      tipeKost = "Putri";
    } else if (isPressedBeliTipeKostCampur == true) {
      tipeKost = "Campur";
    }
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String formattedDate =
        "${dateTime.year}-${_addLeadingZero(dateTime.month)}-${_addLeadingZero(dateTime.day)} "
        "${_addLeadingZero(dateTime.hour)}:${_addLeadingZero(dateTime.minute)}:${_addLeadingZero(dateTime.second)}";

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'udid': udid,
        'action': "Beli",
        'type': "Kost",
        'lokasi': dropdownValue,
        'harga1': rentangHarga1Controller.text,
        'harga2': rentangHarga2Controller.text,
        'area1': rentangArea1Controller.text,
        'area2': rentangArea2Controller.text,
        'kMandiKos': kMandiKos,
        'tipeKost': tipeKost,
        'kTidur': jumlahKamarTidurController.text,
        'kMandi': jumlahKamarMandiController.text,
        'date': formattedDate,
        'status': "Ready"
      }),
    );

    if (response.statusCode == 200) {
      print('Data filtered successfuly');
      filteredData = jsonDecode(response.body);
      print(filteredData);
    } else {
      print('Failed to filter data. Status Code: ${response.statusCode}');
      print('Error Response: ${response.body}');
    }

    ///
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
                MaterialPageRoute(builder: (context) => FilterProperty()));
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 15, left: 10, right: 10),
            child: DropDownLokasi(
              onSelected: _onDropdownSelected,
            ),
          ),
          // Form(
          //   key: formField,
          //   autovalidateMode: AutovalidateMode.onUserInteraction,
          //   child: Padding(
          //     padding:
          //         const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
          //     child: TextFormField(
          //       controller: lokasiController,
          //       autovalidateMode: AutovalidateMode.onUserInteraction,
          //       validator: (value) {
          //         if (value == null || value.isEmpty) {
          //           return "Masukkan lokasi kost";
          //         }
          //         return null;
          //       },
          //       decoration: InputDecoration(
          //         enabledBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(20),
          //           borderSide: const BorderSide(
          //               color: Color.fromARGB(255, 205, 166, 122)),
          //         ),
          //         focusedBorder: OutlineInputBorder(
          //           borderSide: BorderSide(color: Colors.grey.shade400),
          //         ),
          //         fillColor: Colors.grey.shade200,
          //         filled: true,
          //         contentPadding: const EdgeInsets.symmetric(
          //             vertical: 10.0, horizontal: 15.0),
          //         hintText: 'Lokasi Kost',
          //         // suffixIcon: Icon(Icons.search_rounded),
          //       ),
          //     ),
          //   ),
          // ),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: rentangHarga1Controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan harga properti";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: rentangHarga2Controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan harga properti";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: rentangArea1Controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan luas area properti";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: rentangArea2Controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan luas area properti";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Kamar Mandi',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Wrap(
                  children: [
                    ElevatedButton(
                      onPressed: activeKamarMandiDalam,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              isPressedBeliTipeKamarMandiDalam
                                  ? Color.fromARGB(255, 205, 166, 122)
                                  : Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                          color:
                                              isPressedBeliTipeKamarMandiDalam
                                                  ? Colors.transparent
                                                  : Color.fromARGB(
                                                      255, 205, 166, 122))))),
                      child: Text('dalam',
                          style: TextStyle(
                              color: isPressedBeliTipeKamarMandiDalam
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
                              isPressedBeliTipeKamarMandiLuar
                                  ? Color.fromARGB(255, 205, 166, 122)
                                  : Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                          color: isPressedBeliTipeKamarMandiLuar
                                              ? Colors.transparent
                                              : Color.fromARGB(
                                                  255, 205, 166, 122))))),
                      child: Text('luar',
                          style: TextStyle(
                              color: isPressedBeliTipeKamarMandiLuar
                                  ? Colors.white
                                  : Color.fromARGB(255, 121, 121, 121))),
                    ),
                  ],
                )
              ],
            ),
          ),

          const Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Tipe Kost',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Wrap(
                  children: [
                    ElevatedButton(
                      onPressed: activeTipeKostPutra,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              isPressedBeliTipeKostPutra
                                  ? Color.fromARGB(255, 205, 166, 122)
                                  : Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                          color: isPressedBeliTipeKostPutra
                                              ? Colors.transparent
                                              : Color.fromARGB(
                                                  255, 205, 166, 122))))),
                      child: Text('putra',
                          style: TextStyle(
                              color: isPressedBeliTipeKostPutra
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
                              isPressedBeliTipeKostPutri
                                  ? Color.fromARGB(255, 205, 166, 122)
                                  : Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                          color: isPressedBeliTipeKostPutri
                                              ? Colors.transparent
                                              : Color.fromARGB(
                                                  255, 205, 166, 122))))),
                      child: Text('putri',
                          style: TextStyle(
                              color: isPressedBeliTipeKostPutri
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
                              isPressedBeliTipeKostCampur
                                  ? Color.fromARGB(255, 205, 166, 122)
                                  : Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                          color: isPressedBeliTipeKostCampur
                                              ? Colors.transparent
                                              : Color.fromARGB(
                                                  255, 205, 166, 122))))),
                      child: Text('campur',
                          style: TextStyle(
                              color: isPressedBeliTipeKostCampur
                                  ? Colors.white
                                  : Color.fromARGB(255, 121, 121, 121))),
                    ),
                  ],
                )
              ],
            ),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: jumlahKamarTidurController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan jumlah kamar tidur";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: jumlahKamarMandiController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan jumlah kamar mandi";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
              onPressed: () async {
                await postFilterToServer();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PropertyPage(filteredData: filteredData)));
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

// Beli Tanah
class BeliTanah extends StatefulWidget {
  const BeliTanah({super.key});

  @override
  State<BeliTanah> createState() => _BeliTanahState();
}

class _BeliTanahState extends State<BeliTanah> {
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
  final TextEditingController rentangKetinggian1Controller =
      TextEditingController();
  final TextEditingController rentangKetinggian2Controller =
      TextEditingController();

  String _addLeadingZero(int number) {
    return number < 10 ? '0$number' : '$number';
  }

  String dropdownValue = "";

  void _onDropdownSelected(String value) {
    setState(() {
      dropdownValue = value;
    });
  }

  var filteredData;

  Future sendFilteredData() async {
    print(filteredData);
  }

  Future postFilterToServer() async {
    //current work
    final Uri url = Uri.https('hcihunianku--memories053.repl.co', 'filter');
    String udid = await FlutterUdid.udid;

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
        'action': "Beli",
        'type': "Tanah",
        'lokasi': dropdownValue,
        'harga1': rentangHarga1Controller.text,
        'harga2': rentangHarga2Controller.text,
        'area1': rentangArea1Controller.text,
        'area2': rentangArea2Controller.text,
        // 'kMandikos': kMandiKos,
        // 'tipeKost': tipeKost,
        // 'kTidur': jumlahKamarTidurController.text,
        // 'kMandi': jumlahKamarMandiController.text,
        'ketinggian1': rentangKetinggian1Controller.text,
        'ketinggian2': rentangKetinggian2Controller.text,
        'date': formattedDate,
        'status': "Ready"
      }),
    );

    if (response.statusCode == 200) {
      print('Data filtered successfuly');
      filteredData = jsonDecode(response.body);
      print(filteredData);
      //sendFilteredData();
    } else {
      print('Failed to filter data. Status Code: ${response.statusCode}');
      print('Error Response: ${response.body}');
    }

    ///
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
                MaterialPageRoute(builder: (context) => FilterProperty()));
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 15, left: 10, right: 10),
            child: DropDownLokasi(
              onSelected: _onDropdownSelected,
            ),
          ),
          // Form(
          //   key: formField,
          //   autovalidateMode: AutovalidateMode.onUserInteraction,
          //   child: Padding(
          //     padding:
          //         const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
          //     child: TextFormField(
          //       controller: lokasiController,
          //       autovalidateMode: AutovalidateMode.onUserInteraction,
          //       validator: (value) {
          //         if (value == null || value.isEmpty) {
          //           return "Masukkan lokasi tanah";
          //         }
          //         return null;
          //       },
          //       decoration: InputDecoration(
          //         enabledBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(20),
          //           borderSide: const BorderSide(
          //               color: Color.fromARGB(255, 205, 166, 122)),
          //         ),
          //         focusedBorder: OutlineInputBorder(
          //           borderSide: BorderSide(color: Colors.grey.shade400),
          //         ),
          //         fillColor: Colors.grey.shade200,
          //         filled: true,
          //         contentPadding: const EdgeInsets.symmetric(
          //             vertical: 10.0, horizontal: 15.0),
          //         hintText: 'Lokasi Tanah',
          //         // suffixIcon: Icon(Icons.search_rounded),
          //       ),
          //     ),
          //   ),
          // ),

          // Text('list1: $list_BeliTanah.join("")'),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: rentangHarga1Controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan harga properti";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: rentangHarga2Controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan harga properti";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: rentangArea1Controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan luas area properti";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: rentangArea2Controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan luas area properti";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
              'Rentang Ketinggian (mdpl)',
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: rentangKetinggian1Controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan tinggi properti";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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
                    // height: 35.0,
                    child: TextFormField(
                      controller: rentangKetinggian2Controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan tinggi properti";
                        }
                        bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                        if (numberValid == false) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))),
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

          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                await postFilterToServer();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PropertyPage(filteredData: filteredData)));
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
