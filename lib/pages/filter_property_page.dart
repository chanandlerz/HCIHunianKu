import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'package:app_development/components/add_property_jual.dart';
import 'package:app_development/components/add_property_sewakan.dart';
import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:app_development/components/filter_property_beli.dart';
import 'package:app_development/components/filter_property_sewa.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_udid/flutter_udid.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';

class FilterProperty extends StatefulWidget {
  const FilterProperty({super.key});

  @override
  State<FilterProperty> createState() => _FilterPropertyState();
}

class _FilterPropertyState extends State<FilterProperty> {
  bool isPressedBeli = false;
  bool isPressedSewa = false;
  bool isPressedTanah = false;
  bool isPressedRumah = false;
  bool isPressedApartement = false;
  bool isPressedKost = false;
  bool isPressedKomersil = false;

  void activeBeli() {
    setState(() {
      if (isPressedBeli) {
        isPressedBeli = false;
      } else {
        isPressedBeli = true;
        isPressedSewa = false;
      }
    });
  }

  void activeSewa() {
    setState(() {
      if (isPressedSewa) {
        isPressedSewa = false;
      } else {
        isPressedSewa = true;
        isPressedBeli = false;
      }
    });
  }

  void activeTanah() {
    setState(() {
      if (isPressedTanah) {
        isPressedTanah = false;
      } else {
        isPressedTanah = true;
        isPressedRumah = false;
        isPressedApartement = false;
        isPressedKost = false;
        isPressedKomersil = false;
      }
    });
  }

  void activeRumah() {
    setState(() {
      if (isPressedRumah) {
        isPressedRumah = false;
      } else {
        isPressedTanah = false;
        isPressedRumah = true;
        isPressedApartement = false;
        isPressedKost = false;
        isPressedKomersil = false;
      }
    });
  }

  void activeApartement() {
    setState(() {
      if (isPressedApartement) {
        isPressedApartement = false;
      } else {
        isPressedTanah = false;
        isPressedRumah = false;
        isPressedApartement = true;
        isPressedKost = false;
        isPressedKomersil = false;
      }
    });
  }

  void activeKost() {
    setState(() {
      if (isPressedKost) {
        isPressedKost = false;
      } else {
        isPressedTanah = false;
        isPressedRumah = false;
        isPressedApartement = false;
        isPressedKost = true;
        isPressedKomersil = false;
      }
    });
  }

  void activeKomersil() {
    setState(() {
      if (isPressedKomersil) {
        isPressedKomersil = false;
      } else {
        isPressedTanah = false;
        isPressedRumah = false;
        isPressedApartement = false;
        isPressedKost = false;
        isPressedKomersil = true;
      }
    });
  }

  String _addLeadingZero(int number) {
    return number < 10 ? '0$number' : '$number';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 58, 58, 58),
        body: ListView(
          children: <Widget>[
            Row(
              children: [
                IconButton(
                  color: const Color.fromARGB(255, 205, 166, 122),
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavBar()));
                  },
                ),
                const SizedBox(
                  width: 50,
                ),
                const Text(
                  'Properti apa yang anda cari?',
                  style: TextStyle(
                      color: Color.fromARGB(255, 205, 166, 122), fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, bottom: 20),
              child: Text(
                'Kategori',
                style: TextStyle(
                    color: Color.fromARGB(255, 205, 166, 122), fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                        backgroundColor: MaterialStateProperty.all(isPressedBeli
                            ? Colors.white
                            : const Color.fromARGB(255, 205, 166, 122))),
                    onPressed: activeBeli,
                    child: Text(
                      'Beli',
                      style: isPressedBeli
                          ? const TextStyle(
                              color: Color.fromARGB(255, 205, 166, 122))
                          : const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                        backgroundColor: MaterialStateProperty.all(isPressedSewa
                            ? Colors.white
                            : const Color.fromARGB(255, 205, 166, 122))),
                    onPressed: activeSewa,
                    child: Text(
                      'Sewa',
                      style: isPressedSewa
                          ? const TextStyle(
                              color: Color.fromARGB(255, 205, 166, 122))
                          : const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              color: Color.fromARGB(255, 184, 184, 184),
              thickness: 1.0,
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, bottom: 20),
              child: Text(
                'Tipe Properti',
                style: TextStyle(
                    color: Color.fromARGB(255, 205, 166, 122), fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Wrap(
                alignment: WrapAlignment.start,
                children: <Widget>[
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: isPressedTanah
                            ? Colors.white
                            : const Color.fromARGB(255, 205, 166, 122),
                      ),
                      onPressed: activeTanah,
                      child: Text(
                        'Tanah',
                        style: isPressedTanah
                            ? const TextStyle(
                                color: Color.fromARGB(255, 205, 166, 122))
                            : const TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: isPressedRumah
                            ? Colors.white
                            : const Color.fromARGB(255, 205, 166, 122),
                      ),
                      onPressed: activeRumah,
                      child: Text(
                        'Rumah',
                        style: isPressedRumah
                            ? const TextStyle(
                                color: Color.fromARGB(255, 205, 166, 122))
                            : const TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: isPressedApartement
                            ? Colors.white
                            : const Color.fromARGB(255, 205, 166, 122),
                      ),
                      onPressed: activeApartement,
                      child: Text(
                        'Apartement',
                        style: isPressedApartement
                            ? const TextStyle(
                                color: Color.fromARGB(255, 205, 166, 122))
                            : const TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: isPressedKost
                            ? Colors.white
                            : const Color.fromARGB(255, 205, 166, 122),
                      ),
                      onPressed: activeKost,
                      child: Text(
                        'Kost',
                        style: isPressedKost
                            ? const TextStyle(
                                color: Color.fromARGB(255, 205, 166, 122))
                            : const TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: isPressedKomersil
                            ? Colors.white
                            : const Color.fromARGB(255, 205, 166, 122),
                      ),
                      onPressed: activeKomersil,
                      child: Text(
                        'Komersil',
                        style: isPressedKomersil
                            ? const TextStyle(
                                color: Color.fromARGB(255, 205, 166, 122))
                            : const TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     SizedBox(
            //       width: 150,
            //       height: 35,
            //       child: ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: isPressedTanah
            //                 ? Colors.white
            //                 : const Color.fromARGB(255, 205, 166, 122),
            //           ),
            //           onPressed: activeTanah,
            //           child: Text(
            //             'Tanah',
            //             style: isPressedTanah
            //                 ? const TextStyle(
            //                     color: Color.fromARGB(255, 205, 166, 122))
            //                 : const TextStyle(color: Colors.white),
            //           )),
            //     ),
            //     const SizedBox(
            //       height: 15,
            //     ),
            //     SizedBox(
            //       width: 150,
            //       height: 35,
            //       child: ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: isPressedRumah
            //                 ? Colors.white
            //                 : const Color.fromARGB(255, 205, 166, 122),
            //           ),
            //           onPressed: activeRumah,
            //           child: Text(
            //             'Rumah',
            //             style: isPressedRumah
            //                 ? const TextStyle(
            //                     color: Color.fromARGB(255, 205, 166, 122))
            //                 : const TextStyle(color: Colors.white),
            //           )),
            //     ),
            //     const SizedBox(
            //       height: 15,
            //     ),
            //     SizedBox(
            //       width: 150,
            //       height: 35,
            //       child: ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: isPressedApartement
            //                 ? Colors.white
            //                 : const Color.fromARGB(255, 205, 166, 122),
            //           ),
            //           onPressed: activeApartement,
            //           child: Text(
            //             'Apartement',
            //             style: isPressedApartement
            //                 ? const TextStyle(
            //                     color: Color.fromARGB(255, 205, 166, 122))
            //                 : const TextStyle(color: Colors.white),
            //           )),
            //     ),
            //     const SizedBox(
            //       height: 15,
            //     ),
            //     SizedBox(
            //       width: 150,
            //       height: 35,
            //       child: ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: isPressedKost
            //                 ? Colors.white
            //                 : const Color.fromARGB(255, 205, 166, 122),
            //           ),
            //           onPressed: activeKost,
            //           child: Text(
            //             'Kost',
            //             style: isPressedKost
            //                 ? const TextStyle(
            //                     color: Color.fromARGB(255, 205, 166, 122))
            //                 : const TextStyle(color: Colors.white),
            //           )),
            //     ),
            //     const SizedBox(
            //       height: 15,
            //     ),
            //     SizedBox(
            //       width: 150,
            //       height: 35,
            //       child: ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: isPressedKomersil
            //                 ? Colors.white
            //                 : const Color.fromARGB(255, 205, 166, 122),
            //           ),
            //           onPressed: activeKomersil,
            //           child: Text(
            //             'Komersil',
            //             style: isPressedKomersil
            //                 ? const TextStyle(
            //                     color: Color.fromARGB(255, 205, 166, 122))
            //                 : const TextStyle(color: Colors.white),
            //           )),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (isPressedBeli == true && isPressedTanah == true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BeliTanah()));
                  } else if (isPressedBeli == true && isPressedRumah == true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BeliRumah()));
                  } else if (isPressedBeli == true &&
                      isPressedApartement == true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BeliApartement()));
                  } else if (isPressedBeli == true && isPressedKost == true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BeliKost()));
                  } else if (isPressedBeli == true &&
                      isPressedKomersil == true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BeliKomersil()));
                  } else if (isPressedSewa == true && isPressedTanah == true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SewaTanah()));
                  } else if (isPressedSewa == true && isPressedRumah == true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SewaRumah()));
                  } else if (isPressedSewa == true &&
                      isPressedApartement == true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SewaApartement()));
                  } else if (isPressedSewa == true && isPressedKost == true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SewaKost()));
                  } else if (isPressedSewa == true &&
                      isPressedKomersil == true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SewaKomersil()));
                  }
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 205, 166, 122)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 205, 166, 122))))),
                child: const Text('Selanjutnya'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
