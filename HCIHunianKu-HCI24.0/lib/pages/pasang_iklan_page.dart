import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'package:app_development/components/add_property_jual.dart';
import 'package:app_development/components/add_property_sewakan.dart';
import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_udid/flutter_udid.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';

class FilterPasangIklan extends StatefulWidget {
  const FilterPasangIklan({super.key});

  @override
  State<FilterPasangIklan> createState() => _FilterPasangIklanState();
}

class _FilterPasangIklanState extends State<FilterPasangIklan> {
  bool isPressedBeli = false;
  bool isPressedSewakan = false;
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
        isPressedSewakan = false;
      }
    });
  }

  void activeSewakan() {
    setState(() {
      if (isPressedSewakan) {
        isPressedSewakan = false;
      } else {
        isPressedSewakan = true;
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
          title: Text(
            'Properti apa yang anda jual?',
            style: TextStyle(color: Color.fromARGB(255, 205, 166, 122)),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 58, 58, 58),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15, bottom: 20, top: 20),
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
                      'Jual',
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
                        backgroundColor: MaterialStateProperty.all(
                            isPressedSewakan
                                ? Colors.white
                                : const Color.fromARGB(255, 205, 166, 122))),
                    onPressed: activeSewakan,
                    child: Text(
                      'Sewakan',
                      style: isPressedSewakan
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
                        MaterialPageRoute(builder: (context) => JualTanah()));
                  } else if (isPressedBeli == true && isPressedRumah == true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => JualRumah()));
                  } else if (isPressedBeli == true &&
                      isPressedApartement == true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JualApartement()));
                  } else if (isPressedBeli == true && isPressedKost == true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => JualKost()));
                  } else if (isPressedBeli == true &&
                      isPressedKomersil == true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JualKomersil()));
                  } else if (isPressedSewakan == true &&
                      isPressedTanah == true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SewakanTanah()));
                  } else if (isPressedSewakan == true &&
                      isPressedRumah == true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SewakanRumah()));
                  } else if (isPressedSewakan == true &&
                      isPressedApartement == true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SewakanApartement()));
                  } else if (isPressedSewakan == true &&
                      isPressedKost == true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SewakanKost()));
                  } else if (isPressedSewakan == true &&
                      isPressedKomersil == true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SewakanKomersil()));
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

  // // SEWAKAN SEWAKAN SEWAKAN SEWAKAN SEWAKAN SEWAKAN SEWAKAN SEWAKAN SEWAKAN SEWAKAN
  // // --- Bottom Sheet Sewakan Rumah ---
  // Future Sewakan_Rumah(BuildContext context) {
  //   final formField = GlobalKey<FormState>();
  //   return showModalBottomSheet(
  //       context: context,
  //       backgroundColor: Colors.white,
  //       isDismissible: true,
  //       isScrollControlled: true,
  //       shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
  //       builder: (BuildContext context) {
  //         return DraggableScrollableSheet(
  //             initialChildSize: 1,
  //             minChildSize: 0.5,
  //             maxChildSize: 1,
  //             expand: false,
  //             builder: (_, controller) => SizedBox(
  //                   height: double.infinity,
  //                   child: ListView(
  //                     controller: controller,
  //                     children: [
  //                       const SizedBox(
  //                         height: 20,
  //                       ),
  //                       Form(
  //                         key: formField,
  //                         autovalidateMode: AutovalidateMode.onUserInteraction,
  //                         child: Padding(
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 20.0, vertical: 25.0),
  //                           child: TextFormField(
  //                             controller: lokasiController,
  //                             autovalidateMode:
  //                                 AutovalidateMode.onUserInteraction,
  //                             validator: (value) {
  //                               if (value == null || value.isEmpty) {
  //                                 return "Masukkan lokasi properti";
  //                               }
  //                               return null;
  //                             },
  //                             decoration: InputDecoration(
  //                               enabledBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(20),
  //                                 borderSide: const BorderSide(
  //                                     color:
  //                                         Color.fromARGB(255, 205, 166, 122)),
  //                               ),
  //                               focusedBorder: OutlineInputBorder(
  //                                 borderSide:
  //                                     BorderSide(color: Colors.grey.shade400),
  //                               ),
  //                               fillColor: Colors.grey.shade200,
  //                               filled: true,
  //                               contentPadding: const EdgeInsets.symmetric(
  //                                   vertical: 10.0, horizontal: 15.0),
  //                               hintText: 'Lokasi Rumah',
  //                               // suffixIcon: Icon(Icons.search_rounded),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       const Padding(
  //                         padding: EdgeInsets.only(left: 10.0, top: 10.0),
  //                         child: Text(
  //                           'Rentang Sewa',
  //                           style: TextStyle(
  //                               fontWeight: FontWeight.bold, fontSize: 18),
  //                         ),
  //                       ),
  //                       const SizedBox(
  //                         height: 10,
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.only(
  //                             left: 10.0, right: 10.0, bottom: 20.0),
  //                         child: Wrap(
  //                           alignment: WrapAlignment.center,
  //                           children: <Widget>[
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('harian',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('mingguan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('bulanan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('3 bulan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('6 bulan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('tahunan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('semua',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Kisaran Harga (Rp)',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 bottom: 20.0, left: 10.0, top: 18.0),
  //                             child: Wrap(
  //                                 alignment: WrapAlignment.start,
  //                                 children: <Widget>[
  //                                   SizedBox(
  //                                     width: 205.0,
  //                                     height: 35.0,
  //                                     child: TextFormField(
  //                                       controller: hargaController,
  //                                       // autovalidateMode:
  //                                       //     AutovalidateMode.onUserInteraction,
  //                                       // validator: (value) {
  //                                       //   if (value == null || value.isEmpty) {
  //                                       //     return "Masukkan harga properti";
  //                                       //   }
  //                                       //   return null;
  //                                       // },
  //                                       decoration: InputDecoration(
  //                                         enabledBorder: OutlineInputBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           borderSide: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122)),
  //                                         ),
  //                                         focusedBorder: OutlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Colors.grey.shade400),
  //                                         ),
  //                                         fillColor: Colors.grey.shade200,
  //                                         filled: true,
  //                                         contentPadding:
  //                                             const EdgeInsets.symmetric(
  //                                                 vertical: 5.0,
  //                                                 horizontal: 15.0),
  //                                         hintText: '',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Luas Area (meter persegi)',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 bottom: 20.0, left: 10.0, top: 18.0),
  //                             child: Wrap(
  //                                 alignment: WrapAlignment.start,
  //                                 children: <Widget>[
  //                                   SizedBox(
  //                                     width: 147.0,
  //                                     height: 35.0,
  //                                     child: TextFormField(
  //                                       controller: luasController,
  //                                       // autovalidateMode:
  //                                       //     AutovalidateMode.onUserInteraction,
  //                                       // validator: (value) {
  //                                       //   if (value == null || value.isEmpty) {
  //                                       //     return "Masukkan rentang area properti";
  //                                       //   }
  //                                       //   return null;
  //                                       // },
  //                                       decoration: InputDecoration(
  //                                         enabledBorder: OutlineInputBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           borderSide: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122)),
  //                                         ),
  //                                         focusedBorder: OutlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Colors.grey.shade400),
  //                                         ),
  //                                         fillColor: Colors.grey.shade200,
  //                                         filled: true,
  //                                         contentPadding:
  //                                             const EdgeInsets.symmetric(
  //                                                 vertical: 5.0,
  //                                                 horizontal: 15.0),
  //                                         hintText: '',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       const Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Padding(
  //                             padding: EdgeInsets.only(left: 10.0, top: 10.0),
  //                             child: Text(
  //                               'Jumlah Kamar Tidur',
  //                               style: TextStyle(
  //                                   fontSize: 15, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                           Padding(
  //                             padding: EdgeInsets.only(right: 10.0, top: 10.0),
  //                             child: Text(
  //                               'Jumlah Kamar Mandi',
  //                               style: TextStyle(
  //                                   fontSize: 15, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Form(
  //                             child: Padding(
  //                               padding: const EdgeInsets.only(
  //                                   left: 25.0, top: 10.0),
  //                               child: SizedBox(
  //                                 width: 100.0,
  //                                 height: 35.0,
  //                                 child: TextFormField(
  //                                   controller: jumlahKamarTidurController,
  //                                   // autovalidateMode: AutovalidateMode.onUserInteraction,
  //                                   // validator: (value) {
  //                                   //   if (value == null || value.isEmpty) {
  //                                   //     return "Masukkan jumlah kamar tidur";
  //                                   //   }
  //                                   //   return null;
  //                                   // },
  //                                   decoration: InputDecoration(
  //                                     enabledBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122)),
  //                                     ),
  //                                     focusedBorder: OutlineInputBorder(
  //                                       borderSide: BorderSide(
  //                                           color: Colors.grey.shade400),
  //                                     ),
  //                                     fillColor: Colors.grey.shade200,
  //                                     filled: true,
  //                                     contentPadding:
  //                                         const EdgeInsets.symmetric(
  //                                             vertical: 5.0, horizontal: 15.0),
  //                                     hintText: '',
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                           Form(
  //                             child: Padding(
  //                               padding: const EdgeInsets.only(
  //                                   right: 25.0, top: 10.0),
  //                               child: SizedBox(
  //                                 width: 100.0,
  //                                 height: 35.0,
  //                                 child: TextFormField(
  //                                   controller: jumlahKamarMandiController,
  //                                   // autovalidateMode: AutovalidateMode.onUserInteraction,
  //                                   // validator: (value) {
  //                                   //   if (value == null || value.isEmpty) {
  //                                   //     return "Masukkan jumlah kamar mandi";
  //                                   //   }
  //                                   //   return null;
  //                                   // },
  //                                   decoration: InputDecoration(
  //                                     enabledBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122)),
  //                                     ),
  //                                     focusedBorder: OutlineInputBorder(
  //                                       borderSide: BorderSide(
  //                                           color: Colors.grey.shade400),
  //                                     ),
  //                                     fillColor: Colors.grey.shade200,
  //                                     filled: true,
  //                                     contentPadding:
  //                                         const EdgeInsets.symmetric(
  //                                             vertical: 5.0, horizontal: 15.0),
  //                                     hintText: '',
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       const SizedBox(
  //                         height: 30,
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: ElevatedButton(
  //                           onPressed: () {},
  //                           style: ButtonStyle(
  //                               backgroundColor: MaterialStateProperty.all<Color>(
  //                                   const Color.fromARGB(255, 205, 166, 122)),
  //                               shape: MaterialStateProperty.all<
  //                                       RoundedRectangleBorder>(
  //                                   RoundedRectangleBorder(
  //                                       borderRadius:
  //                                           BorderRadius.circular(20.0),
  //                                       side: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122))))),
  //                           child: const Text('Pasang Iklan'),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ));
  //       });
  // }

  // // --- Bottom Sheet Sewakan Kost ---
  // Future Sewakan_Kost(BuildContext context) {
  //   final formField = GlobalKey<FormState>();
  //   return showModalBottomSheet(
  //       context: context,
  //       backgroundColor: Colors.white,
  //       isDismissible: true,
  //       isScrollControlled: true,
  //       shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
  //       builder: (BuildContext context) {
  //         return DraggableScrollableSheet(
  //             initialChildSize: 1,
  //             minChildSize: 0.5,
  //             maxChildSize: 1,
  //             expand: false,
  //             builder: (_, controller) => SizedBox(
  //                   height: double.infinity,
  //                   child: ListView(
  //                     controller: controller,
  //                     children: [
  //                       const SizedBox(
  //                         height: 20,
  //                       ),
  //                       Form(
  //                         key: formField,
  //                         autovalidateMode: AutovalidateMode.onUserInteraction,
  //                         child: Padding(
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 20.0, vertical: 25.0),
  //                           child: TextFormField(
  //                             controller: lokasiController,
  //                             autovalidateMode:
  //                                 AutovalidateMode.onUserInteraction,
  //                             validator: (value) {
  //                               if (value == null || value.isEmpty) {
  //                                 return "Masukkan lokasi properti";
  //                               }
  //                               return null;
  //                             },
  //                             decoration: InputDecoration(
  //                               enabledBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(20),
  //                                 borderSide: const BorderSide(
  //                                     color:
  //                                         Color.fromARGB(255, 205, 166, 122)),
  //                               ),
  //                               focusedBorder: OutlineInputBorder(
  //                                 borderSide:
  //                                     BorderSide(color: Colors.grey.shade400),
  //                               ),
  //                               fillColor: Colors.grey.shade200,
  //                               filled: true,
  //                               contentPadding: const EdgeInsets.symmetric(
  //                                   vertical: 10.0, horizontal: 15.0),
  //                               hintText: 'Lokasi Kost',
  //                               // suffixIcon: Icon(Icons.search_rounded),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       const Padding(
  //                         padding: EdgeInsets.only(left: 10.0, top: 10.0),
  //                         child: Text(
  //                           'Rentang Sewa',
  //                           style: TextStyle(
  //                               fontWeight: FontWeight.bold, fontSize: 18),
  //                         ),
  //                       ),
  //                       const SizedBox(
  //                         height: 10,
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.only(
  //                             left: 10.0, right: 10.0, bottom: 20.0),
  //                         child: Wrap(
  //                           alignment: WrapAlignment.center,
  //                           children: <Widget>[
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('harian',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('mingguan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('bulanan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('3 bulan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('6 bulan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('tahunan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('semua',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Kisaran Harga (Rp)',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 bottom: 20.0, left: 10.0, top: 18.0),
  //                             child: Wrap(
  //                                 alignment: WrapAlignment.start,
  //                                 children: <Widget>[
  //                                   SizedBox(
  //                                     width: 205.0,
  //                                     height: 35.0,
  //                                     child: TextFormField(
  //                                       controller: hargaController,
  //                                       // autovalidateMode:
  //                                       //     AutovalidateMode.onUserInteraction,
  //                                       // validator: (value) {
  //                                       //   if (value == null || value.isEmpty) {
  //                                       //     return "Masukkan harga properti";
  //                                       //   }
  //                                       //   return null;
  //                                       // },
  //                                       decoration: InputDecoration(
  //                                         enabledBorder: OutlineInputBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           borderSide: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122)),
  //                                         ),
  //                                         focusedBorder: OutlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Colors.grey.shade400),
  //                                         ),
  //                                         fillColor: Colors.grey.shade200,
  //                                         filled: true,
  //                                         contentPadding:
  //                                             const EdgeInsets.symmetric(
  //                                                 vertical: 5.0,
  //                                                 horizontal: 15.0),
  //                                         hintText: '',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Luas Area (meter persegi)',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 bottom: 20.0, left: 10.0, top: 18.0),
  //                             child: Wrap(
  //                                 alignment: WrapAlignment.start,
  //                                 children: <Widget>[
  //                                   SizedBox(
  //                                     width: 148.0,
  //                                     height: 35.0,
  //                                     child: TextFormField(
  //                                       controller: luasController,
  //                                       // autovalidateMode:
  //                                       //     AutovalidateMode.onUserInteraction,
  //                                       // validator: (value) {
  //                                       //   if (value == null || value.isEmpty) {
  //                                       //     return "Masukkan rentang area properti";
  //                                       //   }
  //                                       //   return null;
  //                                       // },
  //                                       decoration: InputDecoration(
  //                                         enabledBorder: OutlineInputBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           borderSide: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122)),
  //                                         ),
  //                                         focusedBorder: OutlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Colors.grey.shade400),
  //                                         ),
  //                                         fillColor: Colors.grey.shade200,
  //                                         filled: true,
  //                                         contentPadding:
  //                                             const EdgeInsets.symmetric(
  //                                                 vertical: 5.0,
  //                                                 horizontal: 15.0),
  //                                         hintText: '',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Kamar Mandi',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             width: 108,
  //                           ),
  //                           ElevatedButton(
  //                             onPressed: () {},
  //                             style: ButtonStyle(
  //                                 backgroundColor:
  //                                     MaterialStateProperty.all<Color>(
  //                                         Colors.white),
  //                                 shape: MaterialStateProperty.all<
  //                                         RoundedRectangleBorder>(
  //                                     RoundedRectangleBorder(
  //                                         borderRadius:
  //                                             BorderRadius.circular(20.0),
  //                                         side: const BorderSide(
  //                                             color: Color.fromARGB(
  //                                                 255, 205, 166, 122))))),
  //                             child: const Text('dalam',
  //                                 style: TextStyle(
  //                                     color:
  //                                         Color.fromARGB(255, 121, 121, 121))),
  //                           ),
  //                           const SizedBox(
  //                             width: 15,
  //                           ),
  //                           ElevatedButton(
  //                             onPressed: () {},
  //                             style: ButtonStyle(
  //                                 backgroundColor:
  //                                     MaterialStateProperty.all<Color>(
  //                                         Colors.white),
  //                                 shape: MaterialStateProperty.all<
  //                                         RoundedRectangleBorder>(
  //                                     RoundedRectangleBorder(
  //                                         borderRadius:
  //                                             BorderRadius.circular(20.0),
  //                                         side: const BorderSide(
  //                                             color: Color.fromARGB(
  //                                                 255, 205, 166, 122))))),
  //                             child: const Text('luar',
  //                                 style: TextStyle(
  //                                     color:
  //                                         Color.fromARGB(255, 121, 121, 121))),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Tipe Kost',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             width: 65,
  //                           ),
  //                           ElevatedButton(
  //                             onPressed: () {},
  //                             style: ButtonStyle(
  //                                 backgroundColor:
  //                                     MaterialStateProperty.all<Color>(
  //                                         Colors.white),
  //                                 shape: MaterialStateProperty.all<
  //                                         RoundedRectangleBorder>(
  //                                     RoundedRectangleBorder(
  //                                         borderRadius:
  //                                             BorderRadius.circular(20.0),
  //                                         side: const BorderSide(
  //                                             color: Color.fromARGB(
  //                                                 255, 205, 166, 122))))),
  //                             child: const Text('putra',
  //                                 style: TextStyle(
  //                                     color:
  //                                         Color.fromARGB(255, 121, 121, 121))),
  //                           ),
  //                           const SizedBox(
  //                             width: 15,
  //                           ),
  //                           ElevatedButton(
  //                             onPressed: () {},
  //                             style: ButtonStyle(
  //                                 backgroundColor:
  //                                     MaterialStateProperty.all<Color>(
  //                                         Colors.white),
  //                                 shape: MaterialStateProperty.all<
  //                                         RoundedRectangleBorder>(
  //                                     RoundedRectangleBorder(
  //                                         borderRadius:
  //                                             BorderRadius.circular(20.0),
  //                                         side: const BorderSide(
  //                                             color: Color.fromARGB(
  //                                                 255, 205, 166, 122))))),
  //                             child: const Text('putri',
  //                                 style: TextStyle(
  //                                     color:
  //                                         Color.fromARGB(255, 121, 121, 121))),
  //                           ),
  //                           const SizedBox(
  //                             width: 15,
  //                           ),
  //                           ElevatedButton(
  //                             onPressed: () {},
  //                             style: ButtonStyle(
  //                                 backgroundColor:
  //                                     MaterialStateProperty.all<Color>(
  //                                         Colors.white),
  //                                 shape: MaterialStateProperty.all<
  //                                         RoundedRectangleBorder>(
  //                                     RoundedRectangleBorder(
  //                                         borderRadius:
  //                                             BorderRadius.circular(20.0),
  //                                         side: const BorderSide(
  //                                             color: Color.fromARGB(
  //                                                 255, 205, 166, 122))))),
  //                             child: const Text('putri',
  //                                 style: TextStyle(
  //                                     color:
  //                                         Color.fromARGB(255, 121, 121, 121))),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       const Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Padding(
  //                             padding: EdgeInsets.only(left: 10.0, top: 10.0),
  //                             child: Text(
  //                               'Jumlah Kamar Tidur',
  //                               style: TextStyle(
  //                                   fontSize: 15, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                           Padding(
  //                             padding: EdgeInsets.only(right: 10.0, top: 10.0),
  //                             child: Text(
  //                               'Jumlah Kamar Mandi',
  //                               style: TextStyle(
  //                                   fontSize: 15, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Form(
  //                             child: Padding(
  //                               padding: const EdgeInsets.only(
  //                                   left: 25.0, top: 10.0),
  //                               child: SizedBox(
  //                                 width: 100.0,
  //                                 height: 35.0,
  //                                 child: TextFormField(
  //                                   controller: jumlahKamarTidurController,
  //                                   // autovalidateMode: AutovalidateMode.onUserInteraction,
  //                                   // validator: (value) {
  //                                   //   if (value == null || value.isEmpty) {
  //                                   //     return "Masukkan jumlah kamar tidur";
  //                                   //   }
  //                                   //   return null;
  //                                   // },
  //                                   decoration: InputDecoration(
  //                                     enabledBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122)),
  //                                     ),
  //                                     focusedBorder: OutlineInputBorder(
  //                                       borderSide: BorderSide(
  //                                           color: Colors.grey.shade400),
  //                                     ),
  //                                     fillColor: Colors.grey.shade200,
  //                                     filled: true,
  //                                     contentPadding:
  //                                         const EdgeInsets.symmetric(
  //                                             vertical: 5.0, horizontal: 15.0),
  //                                     hintText: '',
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                           Form(
  //                             child: Padding(
  //                               padding: const EdgeInsets.only(
  //                                   right: 25.0, top: 10.0),
  //                               child: SizedBox(
  //                                 width: 100.0,
  //                                 height: 35.0,
  //                                 child: TextFormField(
  //                                   controller: jumlahKamarMandiController,
  //                                   // autovalidateMode: AutovalidateMode.onUserInteraction,
  //                                   // validator: (value) {
  //                                   //   if (value == null || value.isEmpty) {
  //                                   //     return "Masukkan jumlah kamar mandi";
  //                                   //   }
  //                                   //   return null;
  //                                   // },
  //                                   decoration: InputDecoration(
  //                                     enabledBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122)),
  //                                     ),
  //                                     focusedBorder: OutlineInputBorder(
  //                                       borderSide: BorderSide(
  //                                           color: Colors.grey.shade400),
  //                                     ),
  //                                     fillColor: Colors.grey.shade200,
  //                                     filled: true,
  //                                     contentPadding:
  //                                         const EdgeInsets.symmetric(
  //                                             vertical: 5.0, horizontal: 15.0),
  //                                     hintText: '',
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       const SizedBox(
  //                         height: 30,
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: ElevatedButton(
  //                           onPressed: () {},
  //                           style: ButtonStyle(
  //                               backgroundColor: MaterialStateProperty.all<Color>(
  //                                   const Color.fromARGB(255, 205, 166, 122)),
  //                               shape: MaterialStateProperty.all<
  //                                       RoundedRectangleBorder>(
  //                                   RoundedRectangleBorder(
  //                                       borderRadius:
  //                                           BorderRadius.circular(20.0),
  //                                       side: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122))))),
  //                           child: const Text('Pasang Iklan'),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ));
  //       });
  // }

  // // --- Bottom Sheet Sewakan Tanah ---
  // Future Sewakan_Tanah(BuildContext context) {
  //   final formField = GlobalKey<FormState>();
  //   return showModalBottomSheet(
  //       context: context,
  //       backgroundColor: Colors.white,
  //       isDismissible: true,
  //       isScrollControlled: true,
  //       shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
  //       builder: (BuildContext context) {
  //         return DraggableScrollableSheet(
  //             initialChildSize: 1,
  //             minChildSize: 0.5,
  //             maxChildSize: 1,
  //             expand: false,
  //             builder: (_, controller) => SizedBox(
  //                   height: double.infinity,
  //                   child: ListView(
  //                     controller: controller,
  //                     children: [
  //                       const SizedBox(
  //                         height: 20,
  //                       ),
  //                       Form(
  //                         key: formField,
  //                         autovalidateMode: AutovalidateMode.onUserInteraction,
  //                         child: Padding(
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 20.0, vertical: 25.0),
  //                           child: TextFormField(
  //                             controller: lokasiController,
  //                             autovalidateMode:
  //                                 AutovalidateMode.onUserInteraction,
  //                             validator: (value) {
  //                               if (value == null || value.isEmpty) {
  //                                 return "Masukkan lokasi properti";
  //                               }
  //                               return null;
  //                             },
  //                             decoration: InputDecoration(
  //                               enabledBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(20),
  //                                 borderSide: const BorderSide(
  //                                     color:
  //                                         Color.fromARGB(255, 205, 166, 122)),
  //                               ),
  //                               focusedBorder: OutlineInputBorder(
  //                                 borderSide:
  //                                     BorderSide(color: Colors.grey.shade400),
  //                               ),
  //                               fillColor: Colors.grey.shade200,
  //                               filled: true,
  //                               contentPadding: const EdgeInsets.symmetric(
  //                                   vertical: 10.0, horizontal: 15.0),
  //                               hintText: 'Lokasi Tanah',
  //                               // suffixIcon: Icon(Icons.search_rounded),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       const Padding(
  //                         padding: EdgeInsets.only(left: 10.0, top: 10.0),
  //                         child: Text(
  //                           'Rentang Sewa',
  //                           style: TextStyle(
  //                               fontWeight: FontWeight.bold, fontSize: 18),
  //                         ),
  //                       ),
  //                       const SizedBox(
  //                         height: 10,
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.only(
  //                             left: 10.0, right: 10.0, bottom: 20.0),
  //                         child: Wrap(
  //                           alignment: WrapAlignment.center,
  //                           children: <Widget>[
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('harian',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('mingguan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('bulanan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('3 bulan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('6 bulan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('tahunan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('semua',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Kisaran Harga (Rp)',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 bottom: 20.0, left: 10.0, top: 18.0),
  //                             child: Wrap(
  //                                 alignment: WrapAlignment.start,
  //                                 children: <Widget>[
  //                                   SizedBox(
  //                                     width: 205.0,
  //                                     height: 35.0,
  //                                     child: TextFormField(
  //                                       controller: hargaController,
  //                                       // autovalidateMode:
  //                                       //     AutovalidateMode.onUserInteraction,
  //                                       // validator: (value) {
  //                                       //   if (value == null || value.isEmpty) {
  //                                       //     return "Masukkan harga properti";
  //                                       //   }
  //                                       //   return null;
  //                                       // },
  //                                       decoration: InputDecoration(
  //                                         enabledBorder: OutlineInputBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           borderSide: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122)),
  //                                         ),
  //                                         focusedBorder: OutlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Colors.grey.shade400),
  //                                         ),
  //                                         fillColor: Colors.grey.shade200,
  //                                         filled: true,
  //                                         contentPadding:
  //                                             const EdgeInsets.symmetric(
  //                                                 vertical: 5.0,
  //                                                 horizontal: 15.0),
  //                                         hintText: '',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Luas Area (meter persegi)',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 bottom: 20.0, left: 10.0, top: 18.0),
  //                             child: Wrap(
  //                                 alignment: WrapAlignment.start,
  //                                 children: <Widget>[
  //                                   SizedBox(
  //                                     width: 147.0,
  //                                     height: 35.0,
  //                                     child: TextFormField(
  //                                       controller: luasController,
  //                                       // autovalidateMode:
  //                                       //     AutovalidateMode.onUserInteraction,
  //                                       // validator: (value) {
  //                                       //   if (value == null || value.isEmpty) {
  //                                       //     return "Masukkan rentang area properti";
  //                                       //   }
  //                                       //   return null;
  //                                       // },
  //                                       decoration: InputDecoration(
  //                                         enabledBorder: OutlineInputBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           borderSide: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122)),
  //                                         ),
  //                                         focusedBorder: OutlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Colors.grey.shade400),
  //                                         ),
  //                                         fillColor: Colors.grey.shade200,
  //                                         filled: true,
  //                                         contentPadding:
  //                                             const EdgeInsets.symmetric(
  //                                                 vertical: 5.0,
  //                                                 horizontal: 15.0),
  //                                         hintText: '',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Ketinggian (mdpl)',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 bottom: 20.0, left: 10.0, top: 18.0),
  //                             child: Wrap(
  //                                 alignment: WrapAlignment.start,
  //                                 children: <Widget>[
  //                                   SizedBox(
  //                                     width: 215.0,
  //                                     height: 35.0,
  //                                     child: TextFormField(
  //                                       controller: ketinggianController,
  //                                       // autovalidateMode:
  //                                       //     AutovalidateMode.onUserInteraction,
  //                                       // validator: (value) {
  //                                       //   if (value == null || value.isEmpty) {
  //                                       //     return "Masukkan rentang area properti";
  //                                       //   }
  //                                       //   return null;
  //                                       // },
  //                                       decoration: InputDecoration(
  //                                         enabledBorder: OutlineInputBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           borderSide: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122)),
  //                                         ),
  //                                         focusedBorder: OutlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Colors.grey.shade400),
  //                                         ),
  //                                         fillColor: Colors.grey.shade200,
  //                                         filled: true,
  //                                         contentPadding:
  //                                             const EdgeInsets.symmetric(
  //                                                 vertical: 5.0,
  //                                                 horizontal: 15.0),
  //                                         hintText: '',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                           ),
  //                         ],
  //                       ),
  //                       const SizedBox(
  //                         height: 30,
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: ElevatedButton(
  //                           onPressed: () {},
  //                           style: ButtonStyle(
  //                               backgroundColor: MaterialStateProperty.all<Color>(
  //                                   const Color.fromARGB(255, 205, 166, 122)),
  //                               shape: MaterialStateProperty.all<
  //                                       RoundedRectangleBorder>(
  //                                   RoundedRectangleBorder(
  //                                       borderRadius:
  //                                           BorderRadius.circular(20.0),
  //                                       side: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122))))),
  //                           child: const Text('Pasang Iklan'),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ));
  //       });
  // }

  // // --- Bottom Sheet Sewakan Apartement ---
  // Future Sewakan_Apartement(BuildContext context) {
  //   final formField = GlobalKey<FormState>();
  //   return showModalBottomSheet(
  //       context: context,
  //       backgroundColor: Colors.white,
  //       isDismissible: true,
  //       isScrollControlled: true,
  //       shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
  //       builder: (BuildContext context) {
  //         return DraggableScrollableSheet(
  //             initialChildSize: 1,
  //             minChildSize: 0.5,
  //             maxChildSize: 1,
  //             expand: false,
  //             builder: (_, controller) => SizedBox(
  //                   height: double.infinity,
  //                   child: ListView(
  //                     controller: controller,
  //                     children: [
  //                       const SizedBox(
  //                         height: 20,
  //                       ),
  //                       Form(
  //                         key: formField,
  //                         autovalidateMode: AutovalidateMode.onUserInteraction,
  //                         child: Padding(
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 20.0, vertical: 25.0),
  //                           child: TextFormField(
  //                             controller: lokasiController,
  //                             autovalidateMode:
  //                                 AutovalidateMode.onUserInteraction,
  //                             validator: (value) {
  //                               if (value == null || value.isEmpty) {
  //                                 return "Masukkan lokasi properti";
  //                               }
  //                               return null;
  //                             },
  //                             decoration: InputDecoration(
  //                               enabledBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(20),
  //                                 borderSide: const BorderSide(
  //                                     color:
  //                                         Color.fromARGB(255, 205, 166, 122)),
  //                               ),
  //                               focusedBorder: OutlineInputBorder(
  //                                 borderSide:
  //                                     BorderSide(color: Colors.grey.shade400),
  //                               ),
  //                               fillColor: Colors.grey.shade200,
  //                               filled: true,
  //                               contentPadding: const EdgeInsets.symmetric(
  //                                   vertical: 10.0, horizontal: 15.0),
  //                               hintText: 'Lokasi Apartement',
  //                               // suffixIcon: Icon(Icons.search_rounded),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       const Padding(
  //                         padding: EdgeInsets.only(left: 10.0, top: 10.0),
  //                         child: Text(
  //                           'Rentang Sewa',
  //                           style: TextStyle(
  //                               fontWeight: FontWeight.bold, fontSize: 18),
  //                         ),
  //                       ),
  //                       const SizedBox(
  //                         height: 10,
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.only(
  //                             left: 10.0, right: 10.0, bottom: 20.0),
  //                         child: Wrap(
  //                           alignment: WrapAlignment.center,
  //                           children: <Widget>[
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('harian',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('mingguan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('bulanan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('3 bulan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('6 bulan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('tahunan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('semua',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Kisaran Harga (Rp)',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 bottom: 20.0, left: 10.0, top: 18.0),
  //                             child: Wrap(
  //                                 alignment: WrapAlignment.start,
  //                                 children: <Widget>[
  //                                   SizedBox(
  //                                     width: 205.0,
  //                                     height: 35.0,
  //                                     child: TextFormField(
  //                                       controller: hargaController,
  //                                       // autovalidateMode:
  //                                       //     AutovalidateMode.onUserInteraction,
  //                                       // validator: (value) {
  //                                       //   if (value == null || value.isEmpty) {
  //                                       //     return "Masukkan harga properti";
  //                                       //   }
  //                                       //   return null;
  //                                       // },
  //                                       decoration: InputDecoration(
  //                                         enabledBorder: OutlineInputBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           borderSide: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122)),
  //                                         ),
  //                                         focusedBorder: OutlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Colors.grey.shade400),
  //                                         ),
  //                                         fillColor: Colors.grey.shade200,
  //                                         filled: true,
  //                                         contentPadding:
  //                                             const EdgeInsets.symmetric(
  //                                                 vertical: 5.0,
  //                                                 horizontal: 15.0),
  //                                         hintText: '',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Luas Area (meter persegi)',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 bottom: 20.0, left: 10.0, top: 18.0),
  //                             child: Wrap(
  //                                 alignment: WrapAlignment.start,
  //                                 children: <Widget>[
  //                                   SizedBox(
  //                                     width: 147.0,
  //                                     height: 35.0,
  //                                     child: TextFormField(
  //                                       controller: luasController,
  //                                       // autovalidateMode:
  //                                       //     AutovalidateMode.onUserInteraction,
  //                                       // validator: (value) {
  //                                       //   if (value == null || value.isEmpty) {
  //                                       //     return "Masukkan rentang area properti";
  //                                       //   }
  //                                       //   return null;
  //                                       // },
  //                                       decoration: InputDecoration(
  //                                         enabledBorder: OutlineInputBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           borderSide: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122)),
  //                                         ),
  //                                         focusedBorder: OutlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Colors.grey.shade400),
  //                                         ),
  //                                         fillColor: Colors.grey.shade200,
  //                                         filled: true,
  //                                         contentPadding:
  //                                             const EdgeInsets.symmetric(
  //                                                 vertical: 5.0,
  //                                                 horizontal: 15.0),
  //                                         hintText: '',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       const Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Padding(
  //                             padding: EdgeInsets.only(left: 10.0, top: 10.0),
  //                             child: Text(
  //                               'Jumlah Kamar Tidur',
  //                               style: TextStyle(
  //                                   fontSize: 15, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                           Padding(
  //                             padding: EdgeInsets.only(right: 10.0, top: 10.0),
  //                             child: Text(
  //                               'Jumlah Kamar Mandi',
  //                               style: TextStyle(
  //                                   fontSize: 15, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Form(
  //                             child: Padding(
  //                               padding: const EdgeInsets.only(
  //                                   left: 25.0, top: 10.0),
  //                               child: SizedBox(
  //                                 width: 100.0,
  //                                 height: 35.0,
  //                                 child: TextFormField(
  //                                   controller: jumlahKamarTidurController,
  //                                   // autovalidateMode: AutovalidateMode.onUserInteraction,
  //                                   // validator: (value) {
  //                                   //   if (value == null || value.isEmpty) {
  //                                   //     return "Masukkan jumlah kamar tidur";
  //                                   //   }
  //                                   //   return null;
  //                                   // },
  //                                   decoration: InputDecoration(
  //                                     enabledBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122)),
  //                                     ),
  //                                     focusedBorder: OutlineInputBorder(
  //                                       borderSide: BorderSide(
  //                                           color: Colors.grey.shade400),
  //                                     ),
  //                                     fillColor: Colors.grey.shade200,
  //                                     filled: true,
  //                                     contentPadding:
  //                                         const EdgeInsets.symmetric(
  //                                             vertical: 5.0, horizontal: 15.0),
  //                                     hintText: '',
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                           Form(
  //                             child: Padding(
  //                               padding: const EdgeInsets.only(
  //                                   right: 25.0, top: 10.0),
  //                               child: SizedBox(
  //                                 width: 100.0,
  //                                 height: 35.0,
  //                                 child: TextFormField(
  //                                   controller: jumlahKamarMandiController,
  //                                   // autovalidateMode: AutovalidateMode.onUserInteraction,
  //                                   // validator: (value) {
  //                                   //   if (value == null || value.isEmpty) {
  //                                   //     return "Masukkan jumlah kamar mandi";
  //                                   //   }
  //                                   //   return null;
  //                                   // },
  //                                   decoration: InputDecoration(
  //                                     enabledBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122)),
  //                                     ),
  //                                     focusedBorder: OutlineInputBorder(
  //                                       borderSide: BorderSide(
  //                                           color: Colors.grey.shade400),
  //                                     ),
  //                                     fillColor: Colors.grey.shade200,
  //                                     filled: true,
  //                                     contentPadding:
  //                                         const EdgeInsets.symmetric(
  //                                             vertical: 5.0, horizontal: 15.0),
  //                                     hintText: '',
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       const SizedBox(
  //                         height: 30,
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: ElevatedButton(
  //                           onPressed: () {},
  //                           style: ButtonStyle(
  //                               backgroundColor: MaterialStateProperty.all<Color>(
  //                                   const Color.fromARGB(255, 205, 166, 122)),
  //                               shape: MaterialStateProperty.all<
  //                                       RoundedRectangleBorder>(
  //                                   RoundedRectangleBorder(
  //                                       borderRadius:
  //                                           BorderRadius.circular(20.0),
  //                                       side: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122))))),
  //                           child: const Text('Pasang Iklan'),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ));
  //       });
  // }

  // // --- Bottom Sheet Sewakan Komersil ---
  // Future Sewakan_Komersil(BuildContext context) {
  //   final formField = GlobalKey<FormState>();
  //   return showModalBottomSheet(
  //       context: context,
  //       backgroundColor: Colors.white,
  //       isDismissible: true,
  //       isScrollControlled: true,
  //       shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
  //       builder: (BuildContext context) {
  //         return DraggableScrollableSheet(
  //             initialChildSize: 1,
  //             minChildSize: 0.5,
  //             maxChildSize: 1,
  //             expand: false,
  //             builder: (_, controller) => SizedBox(
  //                   height: double.infinity,
  //                   child: ListView(
  //                     controller: controller,
  //                     children: [
  //                       const SizedBox(
  //                         height: 20,
  //                       ),
  //                       Form(
  //                         key: formField,
  //                         autovalidateMode: AutovalidateMode.onUserInteraction,
  //                         child: Padding(
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 20.0, vertical: 25.0),
  //                           child: TextFormField(
  //                             controller: lokasiController,
  //                             autovalidateMode:
  //                                 AutovalidateMode.onUserInteraction,
  //                             validator: (value) {
  //                               if (value == null || value.isEmpty) {
  //                                 return "Masukkan lokasi properti";
  //                               }
  //                               return null;
  //                             },
  //                             decoration: InputDecoration(
  //                               enabledBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(20),
  //                                 borderSide: const BorderSide(
  //                                     color:
  //                                         Color.fromARGB(255, 205, 166, 122)),
  //                               ),
  //                               focusedBorder: OutlineInputBorder(
  //                                 borderSide:
  //                                     BorderSide(color: Colors.grey.shade400),
  //                               ),
  //                               fillColor: Colors.grey.shade200,
  //                               filled: true,
  //                               contentPadding: const EdgeInsets.symmetric(
  //                                   vertical: 10.0, horizontal: 15.0),
  //                               hintText: 'Lokasi Properti',
  //                               // suffixIcon: Icon(Icons.search_rounded),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       const Padding(
  //                         padding: EdgeInsets.only(left: 10.0, top: 10.0),
  //                         child: Text(
  //                           'Rentang Sewa',
  //                           style: TextStyle(
  //                               fontWeight: FontWeight.bold, fontSize: 18),
  //                         ),
  //                       ),
  //                       const SizedBox(
  //                         height: 10,
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.only(
  //                             left: 10.0, right: 10.0, bottom: 20.0),
  //                         child: Wrap(
  //                           alignment: WrapAlignment.center,
  //                           children: <Widget>[
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('harian',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('mingguan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('bulanan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('3 bulan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('6 bulan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('tahunan',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                             ElevatedButton(
  //                               onPressed: () {},
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20.0),
  //                                           side: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122))))),
  //                               child: const Text('semua',
  //                                   style: TextStyle(
  //                                       color: Color.fromARGB(
  //                                           255, 121, 121, 121))),
  //                             ),
  //                             const SizedBox(
  //                               width: 15,
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Kisaran Harga (Rp)',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 bottom: 20.0, left: 10.0, top: 18.0),
  //                             child: Wrap(
  //                                 alignment: WrapAlignment.start,
  //                                 children: <Widget>[
  //                                   SizedBox(
  //                                     width: 205.0,
  //                                     height: 35.0,
  //                                     child: TextFormField(
  //                                       controller: hargaController,
  //                                       // autovalidateMode:
  //                                       //     AutovalidateMode.onUserInteraction,
  //                                       // validator: (value) {
  //                                       //   if (value == null || value.isEmpty) {
  //                                       //     return "Masukkan harga properti";
  //                                       //   }
  //                                       //   return null;
  //                                       // },
  //                                       decoration: InputDecoration(
  //                                         enabledBorder: OutlineInputBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           borderSide: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122)),
  //                                         ),
  //                                         focusedBorder: OutlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Colors.grey.shade400),
  //                                         ),
  //                                         fillColor: Colors.grey.shade200,
  //                                         filled: true,
  //                                         contentPadding:
  //                                             const EdgeInsets.symmetric(
  //                                                 vertical: 5.0,
  //                                                 horizontal: 15.0),
  //                                         hintText: '',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Luas Area (meter persegi)',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 bottom: 20.0, left: 10.0, top: 18.0),
  //                             child: Wrap(
  //                                 alignment: WrapAlignment.start,
  //                                 children: <Widget>[
  //                                   SizedBox(
  //                                     width: 147.0,
  //                                     height: 35.0,
  //                                     child: TextFormField(
  //                                       controller: luasController,
  //                                       // autovalidateMode:
  //                                       //     AutovalidateMode.onUserInteraction,
  //                                       // validator: (value) {
  //                                       //   if (value == null || value.isEmpty) {
  //                                       //     return "Masukkan rentang area properti";
  //                                       //   }
  //                                       //   return null;
  //                                       // },
  //                                       decoration: InputDecoration(
  //                                         enabledBorder: OutlineInputBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           borderSide: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122)),
  //                                         ),
  //                                         focusedBorder: OutlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Colors.grey.shade400),
  //                                         ),
  //                                         fillColor: Colors.grey.shade200,
  //                                         filled: true,
  //                                         contentPadding:
  //                                             const EdgeInsets.symmetric(
  //                                                 vertical: 5.0,
  //                                                 horizontal: 15.0),
  //                                         hintText: '',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       const Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Padding(
  //                             padding: EdgeInsets.only(left: 10.0, top: 10.0),
  //                             child: Text(
  //                               'Jumlah Kamar Tidur',
  //                               style: TextStyle(
  //                                   fontSize: 15, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                           Padding(
  //                             padding: EdgeInsets.only(right: 10.0, top: 10.0),
  //                             child: Text(
  //                               'Jumlah Kamar Mandi',
  //                               style: TextStyle(
  //                                   fontSize: 15, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Form(
  //                             child: Padding(
  //                               padding: const EdgeInsets.only(
  //                                   left: 25.0, top: 10.0),
  //                               child: SizedBox(
  //                                 width: 100.0,
  //                                 height: 35.0,
  //                                 child: TextFormField(
  //                                   controller: jumlahKamarTidurController,
  //                                   // autovalidateMode: AutovalidateMode.onUserInteraction,
  //                                   // validator: (value) {
  //                                   //   if (value == null || value.isEmpty) {
  //                                   //     return "Masukkan jumlah kamar tidur";
  //                                   //   }
  //                                   //   return null;
  //                                   // },
  //                                   decoration: InputDecoration(
  //                                     enabledBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122)),
  //                                     ),
  //                                     focusedBorder: OutlineInputBorder(
  //                                       borderSide: BorderSide(
  //                                           color: Colors.grey.shade400),
  //                                     ),
  //                                     fillColor: Colors.grey.shade200,
  //                                     filled: true,
  //                                     contentPadding:
  //                                         const EdgeInsets.symmetric(
  //                                             vertical: 5.0, horizontal: 15.0),
  //                                     hintText: '',
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                           Form(
  //                             child: Padding(
  //                               padding: const EdgeInsets.only(
  //                                   right: 25.0, top: 10.0),
  //                               child: SizedBox(
  //                                 width: 100.0,
  //                                 height: 35.0,
  //                                 child: TextFormField(
  //                                   controller: jumlahKamarMandiController,
  //                                   // autovalidateMode: AutovalidateMode.onUserInteraction,
  //                                   // validator: (value) {
  //                                   //   if (value == null || value.isEmpty) {
  //                                   //     return "Masukkan jumlah kamar mandi";
  //                                   //   }
  //                                   //   return null;
  //                                   // },
  //                                   decoration: InputDecoration(
  //                                     enabledBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122)),
  //                                     ),
  //                                     focusedBorder: OutlineInputBorder(
  //                                       borderSide: BorderSide(
  //                                           color: Colors.grey.shade400),
  //                                     ),
  //                                     fillColor: Colors.grey.shade200,
  //                                     filled: true,
  //                                     contentPadding:
  //                                         const EdgeInsets.symmetric(
  //                                             vertical: 5.0, horizontal: 15.0),
  //                                     hintText: '',
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       const SizedBox(
  //                         height: 30,
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: ElevatedButton(
  //                           onPressed: () {},
  //                           style: ButtonStyle(
  //                               backgroundColor: MaterialStateProperty.all<Color>(
  //                                   const Color.fromARGB(255, 205, 166, 122)),
  //                               shape: MaterialStateProperty.all<
  //                                       RoundedRectangleBorder>(
  //                                   RoundedRectangleBorder(
  //                                       borderRadius:
  //                                           BorderRadius.circular(20.0),
  //                                       side: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122))))),
  //                           child: const Text('Pasang Iklan'),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ));
  //       });
  // }

  // // JUAL JUAL JUAL JUAL JUAL JUAL JUAL JUAL JUAL JUAL
  // // --- Bottom Sheet Jual Rumah ---
  // Future Jual_Rumah(BuildContext context) {
  //   File image;
  //   final picker = ImagePicker();
  //   String base64string = '';

  //   Future<void> getImageFromGallery() async {
  //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  //     if (pickedFile != null) {
  //       image = File(pickedFile.path);

  //       ///File imagefile = File(imagepath); //convert Path to File
  //       Future<Uint8List> imagebytes = image.readAsBytes(); //convert to bytes
  //       Uint8List bytes = await imagebytes;

  //       base64string = base64.encode(bytes); //convert bytes to base64 string
  //       setState(() {
  //         print(base64string);
  //       });
  //     }
  //   }

  //   Future getImageFromCamera() async {
  //     final pickedFile = await picker.pickImage(source: ImageSource.camera);
  //     if (pickedFile != null) {
  //       image = File(pickedFile.path);

  //       Future<Uint8List> imagebytes = image.readAsBytes(); //convert to bytes
  //       Uint8List bytes = await imagebytes;

  //       base64string = base64.encode(bytes);
  //       setState(() {
  //         print(base64string);
  //       });
  //     }
  //   }

  //   Future postPropertyToServer() async {
  //     final Uri url = Uri.https('hunianku.juanfredoalexiu.repl.co', 'properties');
  //     String udid = await FlutterUdid.udid;

  //     int timestamp = DateTime.now().millisecondsSinceEpoch;
  //     DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
  //     String formattedDate =
  //         "${dateTime.year}-${_addLeadingZero(dateTime.month)}-${_addLeadingZero(dateTime.day)} "
  //         "${_addLeadingZero(dateTime.hour)}:${_addLeadingZero(dateTime.minute)}:${_addLeadingZero(dateTime.second)}";

  //     final response = await http.post(
  //       url,
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode({
  //         'udid': udid,
  //         'action': "Jual",
  //         'type': "Rumah",
  //         'lokasi': lokasiController.text,
  //         'harga': hargaController.text,
  //         'area': luasController.text,
  //         'kTidur': jumlahKamarTidurController.text,
  //         'kMandi': jumlahKamarMandiController.text,
  //         'image': base64string,
  //         'date': formattedDate,
  //         'status': "Ready"
  //       }),
  //     );

  //     if (response.statusCode == 200) {
  //       print('Property added successfuly');
  //     } else {
  //       print('Failed to add property. Status Code: ${response.statusCode}');
  //       print('Error Response: ${response.body}');
  //     }
  //   }

  //   Future showOptions() async {
  //     showCupertinoModalPopup(
  //         context: context,
  //         builder: (context) => CupertinoActionSheet(
  //               actions: [
  //                 CupertinoActionSheetAction(
  //                   child: const Text('Photo Gallery'),
  //                   onPressed: () {
  //                     Navigator.of(context).pop();

  //                     getImageFromGallery();
  //                   },
  //                 ),
  //                 CupertinoActionSheetAction(
  //                   child: const Text('Camera'),
  //                   onPressed: () {
  //                     Navigator.of(context).pop();

  //                     getImageFromCamera();
  //                   },
  //                 )
  //               ],
  //             ));
  //   }

  //   final formField = GlobalKey<FormState>();
  //   return showModalBottomSheet(
  //       context: context,
  //       backgroundColor: Colors.white,
  //       isDismissible: true,
  //       isScrollControlled: true,
  //       shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
  //       builder: (BuildContext context) {
  //         return DraggableScrollableSheet(
  //             initialChildSize: 1,
  //             minChildSize: 0.5,
  //             maxChildSize: 1,
  //             expand: false,
  //             builder: (_, controller) => SizedBox(
  //                   height: double.infinity,
  //                   child: ListView(
  //                     controller: controller,
  //                     children: [
  //                       const SizedBox(
  //                         height: 20,
  //                       ),
  //                       Form(
  //                         key: formField,
  //                         autovalidateMode: AutovalidateMode.onUserInteraction,
  //                         child: Padding(
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 20.0, vertical: 25.0),
  //                           child: TextFormField(
  //                             controller: lokasiController,
  //                             autovalidateMode:
  //                                 AutovalidateMode.onUserInteraction,
  //                             validator: (value) {
  //                               if (value == null || value.isEmpty) {
  //                                 return "Masukkan lokasi properti";
  //                               }
  //                               return null;
  //                             },
  //                             decoration: InputDecoration(
  //                               enabledBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(20),
  //                                 borderSide: const BorderSide(
  //                                     color:
  //                                         Color.fromARGB(255, 205, 166, 122)),
  //                               ),
  //                               focusedBorder: OutlineInputBorder(
  //                                 borderSide:
  //                                     BorderSide(color: Colors.grey.shade400),
  //                               ),
  //                               fillColor: Colors.grey.shade200,
  //                               filled: true,
  //                               contentPadding: const EdgeInsets.symmetric(
  //                                   vertical: 10.0, horizontal: 15.0),
  //                               hintText: 'Lokasi Rumah',
  //                               // suffixIcon: Icon(Icons.search_rounded),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Kisaran Harga (Rp)',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 bottom: 20.0, left: 10.0, top: 18.0),
  //                             child: Wrap(
  //                                 alignment: WrapAlignment.start,
  //                                 children: <Widget>[
  //                                   SizedBox(
  //                                     width: 205.0,
  //                                     height: 35.0,
  //                                     child: TextFormField(
  //                                       controller: hargaController,
  //                                       // autovalidateMode:
  //                                       //     AutovalidateMode.onUserInteraction,
  //                                       // validator: (value) {
  //                                       //   if (value == null || value.isEmpty) {
  //                                       //     return "Masukkan harga properti";
  //                                       //   }
  //                                       //   return null;
  //                                       // },
  //                                       decoration: InputDecoration(
  //                                         enabledBorder: OutlineInputBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           borderSide: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122)),
  //                                         ),
  //                                         focusedBorder: OutlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Colors.grey.shade400),
  //                                         ),
  //                                         fillColor: Colors.grey.shade200,
  //                                         filled: true,
  //                                         contentPadding:
  //                                             const EdgeInsets.symmetric(
  //                                                 vertical: 5.0,
  //                                                 horizontal: 15.0),
  //                                         hintText: '',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Luas Area (meter persegi)',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 bottom: 20.0, left: 10.0, top: 18.0),
  //                             child: Wrap(
  //                                 alignment: WrapAlignment.start,
  //                                 children: <Widget>[
  //                                   SizedBox(
  //                                     width: 147.0,
  //                                     height: 35.0,
  //                                     child: TextFormField(
  //                                       controller: luasController,
  //                                       // autovalidateMode:
  //                                       //     AutovalidateMode.onUserInteraction,
  //                                       // validator: (value) {
  //                                       //   if (value == null || value.isEmpty) {
  //                                       //     return "Masukkan rentang area properti";
  //                                       //   }
  //                                       //   return null;
  //                                       // },
  //                                       decoration: InputDecoration(
  //                                         enabledBorder: OutlineInputBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           borderSide: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122)),
  //                                         ),
  //                                         focusedBorder: OutlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Colors.grey.shade400),
  //                                         ),
  //                                         fillColor: Colors.grey.shade200,
  //                                         filled: true,
  //                                         contentPadding:
  //                                             const EdgeInsets.symmetric(
  //                                                 vertical: 5.0,
  //                                                 horizontal: 15.0),
  //                                         hintText: '',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       const Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Padding(
  //                             padding: EdgeInsets.only(left: 10.0, top: 10.0),
  //                             child: Text(
  //                               'Jumlah Kamar Tidur',
  //                               style: TextStyle(
  //                                   fontSize: 15, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                           Padding(
  //                             padding: EdgeInsets.only(right: 10.0, top: 10.0),
  //                             child: Text(
  //                               'Jumlah Kamar Mandi',
  //                               style: TextStyle(
  //                                   fontSize: 15, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Form(
  //                             child: Padding(
  //                               padding: const EdgeInsets.only(
  //                                   left: 25.0, top: 10.0),
  //                               child: SizedBox(
  //                                 width: 100.0,
  //                                 height: 35.0,
  //                                 child: TextFormField(
  //                                   controller: jumlahKamarTidurController,
  //                                   // autovalidateMode: AutovalidateMode.onUserInteraction,
  //                                   // validator: (value) {
  //                                   //   if (value == null || value.isEmpty) {
  //                                   //     return "Masukkan jumlah kamar tidur";
  //                                   //   }
  //                                   //   return null;
  //                                   // },
  //                                   decoration: InputDecoration(
  //                                     enabledBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122)),
  //                                     ),
  //                                     focusedBorder: OutlineInputBorder(
  //                                       borderSide: BorderSide(
  //                                           color: Colors.grey.shade400),
  //                                     ),
  //                                     fillColor: Colors.grey.shade200,
  //                                     filled: true,
  //                                     contentPadding:
  //                                         const EdgeInsets.symmetric(
  //                                             vertical: 5.0, horizontal: 15.0),
  //                                     hintText: '',
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                           Form(
  //                             child: Padding(
  //                               padding: const EdgeInsets.only(
  //                                   right: 25.0, top: 10.0),
  //                               child: SizedBox(
  //                                 width: 100.0,
  //                                 height: 35.0,
  //                                 child: TextFormField(
  //                                   controller: jumlahKamarMandiController,
  //                                   // autovalidateMode: AutovalidateMode.onUserInteraction,
  //                                   // validator: (value) {
  //                                   //   if (value == null || value.isEmpty) {
  //                                   //     return "Masukkan jumlah kamar mandi";
  //                                   //   }
  //                                   //   return null;
  //                                   // },
  //                                   decoration: InputDecoration(
  //                                     enabledBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122)),
  //                                     ),
  //                                     focusedBorder: OutlineInputBorder(
  //                                       borderSide: BorderSide(
  //                                           color: Colors.grey.shade400),
  //                                     ),
  //                                     fillColor: Colors.grey.shade200,
  //                                     filled: true,
  //                                     contentPadding:
  //                                         const EdgeInsets.symmetric(
  //                                             vertical: 5.0, horizontal: 15.0),
  //                                     hintText: '',
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       const SizedBox(
  //                         height: 15,
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       const SizedBox(
  //                         height: 15,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Foto Properti',
  //                               style: TextStyle(
  //                                   fontSize: 18, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             width: 65,
  //                           ),
  //                           SizedBox(
  //                             width: 200,
  //                             child: ElevatedButton(
  //                               onPressed: showOptions,
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           const Color.fromARGB(
  //                                               255, 205, 166, 122)),
  //                                   shape:
  //                                       MaterialStateProperty.all<RoundedRectangleBorder>(
  //                                           RoundedRectangleBorder(
  //                                               borderRadius:
  //                                                   BorderRadius.circular(10.0),
  //                                               side: const BorderSide(
  //                                                   color: Color.fromARGB(
  //                                                       255, 205, 166, 122))))),
  //                               child: const Text('Select Image'),
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                       const SizedBox(
  //                         height: 30,
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: ElevatedButton(
  //                           onPressed: () async {
  //                             //post disini
  //                             await postPropertyToServer();
  //                           },
  //                           style: ButtonStyle(
  //                               backgroundColor: MaterialStateProperty.all<Color>(
  //                                   const Color.fromARGB(255, 205, 166, 122)),
  //                               shape: MaterialStateProperty.all<
  //                                       RoundedRectangleBorder>(
  //                                   RoundedRectangleBorder(
  //                                       borderRadius:
  //                                           BorderRadius.circular(20.0),
  //                                       side: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122))))),
  //                           child: const Text('Pasang Iklan'),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ));
  //       });
  // }

  // Future Jual_Kost(BuildContext context) {
  //   File image;
  //   final picker = ImagePicker();
  //   String base64string = '';

  //   Future<void> getImageFromGallery() async {
  //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  //     if (pickedFile != null) {
  //       image = File(pickedFile.path);

  //       ///File imagefile = File(imagepath); //convert Path to File
  //       Future<Uint8List> imagebytes = image.readAsBytes(); //convert to bytes
  //       Uint8List bytes = await imagebytes;

  //       base64string = base64.encode(bytes); //convert bytes to base64 string
  //       setState(() {
  //         print(base64string);
  //       });
  //     }
  //   }

  //   Future getImageFromCamera() async {
  //     final pickedFile = await picker.pickImage(source: ImageSource.camera);
  //     if (pickedFile != null) {
  //       image = File(pickedFile.path);

  //       Future<Uint8List> imagebytes = image.readAsBytes(); //convert to bytes
  //       Uint8List bytes = await imagebytes;

  //       base64string = base64.encode(bytes);
  //       setState(() {
  //         print(base64string);
  //       });
  //     }
  //   }

  //   Future postPropertyToServer() async {
  //     final Uri url = Uri.https('hunianku.juanfredoalexiu.repl.co', 'properties');
  //     String udid = await FlutterUdid.udid;

  //     int timestamp = DateTime.now().millisecondsSinceEpoch;
  //     DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
  //     String formattedDate =
  //         "${dateTime.year}-${_addLeadingZero(dateTime.month)}-${_addLeadingZero(dateTime.day)} "
  //         "${_addLeadingZero(dateTime.hour)}:${_addLeadingZero(dateTime.minute)}:${_addLeadingZero(dateTime.second)}";

  //     final response = await http.post(
  //       url,
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode({
  //         'udid': udid,
  //         'action': "Jual",
  //         'type': "Kost",
  //         'lokasi': lokasiController.text,
  //         'harga': hargaController.text,
  //         'area': luasController.text,
  //         //masi belum
  //         'kMandiKos': '',
  //         'tipeKost': '',
  //         'kTidur': jumlahKamarTidurController.text,
  //         'kMandi': jumlahKamarMandiController.text,
  //         'image': base64string,
  //         'date': formattedDate,
  //         'status': "Ready"
  //       }),
  //     );

  //     if (response.statusCode == 200) {
  //       print('Property added successfuly');
  //     } else {
  //       print('Failed to add property. Status Code: ${response.statusCode}');
  //       print('Error Response: ${response.body}');
  //     }
  //   }

  //   Future showOptions() async {
  //     showCupertinoModalPopup(
  //         context: context,
  //         builder: (context) => CupertinoActionSheet(
  //               actions: [
  //                 CupertinoActionSheetAction(
  //                   child: const Text('Photo Gallery'),
  //                   onPressed: () {
  //                     Navigator.of(context).pop();

  //                     getImageFromGallery();
  //                   },
  //                 ),
  //                 CupertinoActionSheetAction(
  //                   child: const Text('Camera'),
  //                   onPressed: () {
  //                     Navigator.of(context).pop();

  //                     getImageFromCamera();
  //                   },
  //                 )
  //               ],
  //             ));
  //   }

  //   final formField = GlobalKey<FormState>();
  //   return showModalBottomSheet(
  //       context: context,
  //       backgroundColor: Colors.white,
  //       isDismissible: true,
  //       isScrollControlled: true,
  //       shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
  //       builder: (BuildContext context) {
  //         return DraggableScrollableSheet(
  //             initialChildSize: 1,
  //             minChildSize: 0.5,
  //             maxChildSize: 1,
  //             expand: false,
  //             builder: (_, controller) => SizedBox(
  //                   height: double.infinity,
  //                   child: ListView(
  //                     controller: controller,
  //                     children: [
  //                       const SizedBox(
  //                         height: 20,
  //                       ),
  //                       Form(
  //                         key: formField,
  //                         autovalidateMode: AutovalidateMode.onUserInteraction,
  //                         child: Padding(
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 20.0, vertical: 25.0),
  //                           child: TextFormField(
  //                             controller: lokasiController,
  //                             autovalidateMode:
  //                                 AutovalidateMode.onUserInteraction,
  //                             validator: (value) {
  //                               if (value == null || value.isEmpty) {
  //                                 return "Masukkan lokasi properti";
  //                               }
  //                               return null;
  //                             },
  //                             decoration: InputDecoration(
  //                               enabledBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(20),
  //                                 borderSide: const BorderSide(
  //                                     color:
  //                                         Color.fromARGB(255, 205, 166, 122)),
  //                               ),
  //                               focusedBorder: OutlineInputBorder(
  //                                 borderSide:
  //                                     BorderSide(color: Colors.grey.shade400),
  //                               ),
  //                               fillColor: Colors.grey.shade200,
  //                               filled: true,
  //                               contentPadding: const EdgeInsets.symmetric(
  //                                   vertical: 10.0, horizontal: 15.0),
  //                               hintText: 'Lokasi Kost',
  //                               // suffixIcon: Icon(Icons.search_rounded),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Kisaran Harga (Rp)',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 bottom: 20.0, left: 10.0, top: 18.0),
  //                             child: Wrap(
  //                                 alignment: WrapAlignment.start,
  //                                 children: <Widget>[
  //                                   SizedBox(
  //                                     width: 205.0,
  //                                     height: 35.0,
  //                                     child: TextFormField(
  //                                       controller: hargaController,
  //                                       // autovalidateMode:
  //                                       //     AutovalidateMode.onUserInteraction,
  //                                       // validator: (value) {
  //                                       //   if (value == null || value.isEmpty) {
  //                                       //     return "Masukkan harga properti";
  //                                       //   }
  //                                       //   return null;
  //                                       // },
  //                                       decoration: InputDecoration(
  //                                         enabledBorder: OutlineInputBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           borderSide: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122)),
  //                                         ),
  //                                         focusedBorder: OutlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Colors.grey.shade400),
  //                                         ),
  //                                         fillColor: Colors.grey.shade200,
  //                                         filled: true,
  //                                         contentPadding:
  //                                             const EdgeInsets.symmetric(
  //                                                 vertical: 5.0,
  //                                                 horizontal: 15.0),
  //                                         hintText: '',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Luas Area (meter persegi)',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 bottom: 20.0, left: 10.0, top: 18.0),
  //                             child: Wrap(
  //                                 alignment: WrapAlignment.start,
  //                                 children: <Widget>[
  //                                   SizedBox(
  //                                     width: 148.0,
  //                                     height: 35.0,
  //                                     child: TextFormField(
  //                                       controller: luasController,
  //                                       // autovalidateMode:
  //                                       //     AutovalidateMode.onUserInteraction,
  //                                       // validator: (value) {
  //                                       //   if (value == null || value.isEmpty) {
  //                                       //     return "Masukkan rentang area properti";
  //                                       //   }
  //                                       //   return null;
  //                                       // },
  //                                       decoration: InputDecoration(
  //                                         enabledBorder: OutlineInputBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           borderSide: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122)),
  //                                         ),
  //                                         focusedBorder: OutlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Colors.grey.shade400),
  //                                         ),
  //                                         fillColor: Colors.grey.shade200,
  //                                         filled: true,
  //                                         contentPadding:
  //                                             const EdgeInsets.symmetric(
  //                                                 vertical: 5.0,
  //                                                 horizontal: 15.0),
  //                                         hintText: '',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Kamar Mandi',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             width: 108,
  //                           ),
  //                           ElevatedButton(
  //                             onPressed: () {},
  //                             style: ButtonStyle(
  //                                 backgroundColor:
  //                                     MaterialStateProperty.all<Color>(
  //                                         Colors.white),
  //                                 shape: MaterialStateProperty.all<
  //                                         RoundedRectangleBorder>(
  //                                     RoundedRectangleBorder(
  //                                         borderRadius:
  //                                             BorderRadius.circular(20.0),
  //                                         side: const BorderSide(
  //                                             color: Color.fromARGB(
  //                                                 255, 205, 166, 122))))),
  //                             child: const Text('dalam',
  //                                 style: TextStyle(
  //                                     color:
  //                                         Color.fromARGB(255, 121, 121, 121))),
  //                           ),
  //                           const SizedBox(
  //                             width: 15,
  //                           ),
  //                           ElevatedButton(
  //                             onPressed: () {},
  //                             style: ButtonStyle(
  //                                 backgroundColor:
  //                                     MaterialStateProperty.all<Color>(
  //                                         Colors.white),
  //                                 shape: MaterialStateProperty.all<
  //                                         RoundedRectangleBorder>(
  //                                     RoundedRectangleBorder(
  //                                         borderRadius:
  //                                             BorderRadius.circular(20.0),
  //                                         side: const BorderSide(
  //                                             color: Color.fromARGB(
  //                                                 255, 205, 166, 122))))),
  //                             child: const Text('luar',
  //                                 style: TextStyle(
  //                                     color:
  //                                         Color.fromARGB(255, 121, 121, 121))),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Tipe Kost',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             width: 65,
  //                           ),
  //                           ElevatedButton(
  //                             onPressed: () {},
  //                             style: ButtonStyle(
  //                                 backgroundColor:
  //                                     MaterialStateProperty.all<Color>(
  //                                         Colors.white),
  //                                 shape: MaterialStateProperty.all<
  //                                         RoundedRectangleBorder>(
  //                                     RoundedRectangleBorder(
  //                                         borderRadius:
  //                                             BorderRadius.circular(20.0),
  //                                         side: const BorderSide(
  //                                             color: Color.fromARGB(
  //                                                 255, 205, 166, 122))))),
  //                             child: const Text('putra',
  //                                 style: TextStyle(
  //                                     color:
  //                                         Color.fromARGB(255, 121, 121, 121))),
  //                           ),
  //                           const SizedBox(
  //                             width: 15,
  //                           ),
  //                           ElevatedButton(
  //                             onPressed: () {},
  //                             style: ButtonStyle(
  //                                 backgroundColor:
  //                                     MaterialStateProperty.all<Color>(
  //                                         Colors.white),
  //                                 shape: MaterialStateProperty.all<
  //                                         RoundedRectangleBorder>(
  //                                     RoundedRectangleBorder(
  //                                         borderRadius:
  //                                             BorderRadius.circular(20.0),
  //                                         side: const BorderSide(
  //                                             color: Color.fromARGB(
  //                                                 255, 205, 166, 122))))),
  //                             child: const Text('putri',
  //                                 style: TextStyle(
  //                                     color:
  //                                         Color.fromARGB(255, 121, 121, 121))),
  //                           ),
  //                           const SizedBox(
  //                             width: 15,
  //                           ),
  //                           ElevatedButton(
  //                             onPressed: () {},
  //                             style: ButtonStyle(
  //                                 backgroundColor:
  //                                     MaterialStateProperty.all<Color>(
  //                                         Colors.white),
  //                                 shape: MaterialStateProperty.all<
  //                                         RoundedRectangleBorder>(
  //                                     RoundedRectangleBorder(
  //                                         borderRadius:
  //                                             BorderRadius.circular(20.0),
  //                                         side: const BorderSide(
  //                                             color: Color.fromARGB(
  //                                                 255, 205, 166, 122))))),
  //                             child: const Text('putri',
  //                                 style: TextStyle(
  //                                     color:
  //                                         Color.fromARGB(255, 121, 121, 121))),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       const Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Padding(
  //                             padding: EdgeInsets.only(left: 10.0, top: 10.0),
  //                             child: Text(
  //                               'Jumlah Kamar Tidur',
  //                               style: TextStyle(
  //                                   fontSize: 15, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                           Padding(
  //                             padding: EdgeInsets.only(right: 10.0, top: 10.0),
  //                             child: Text(
  //                               'Jumlah Kamar Mandi',
  //                               style: TextStyle(
  //                                   fontSize: 15, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Form(
  //                             child: Padding(
  //                               padding: const EdgeInsets.only(
  //                                   left: 25.0, top: 10.0),
  //                               child: SizedBox(
  //                                 width: 100.0,
  //                                 height: 35.0,
  //                                 child: TextFormField(
  //                                   controller: jumlahKamarTidurController,
  //                                   // autovalidateMode: AutovalidateMode.onUserInteraction,
  //                                   // validator: (value) {
  //                                   //   if (value == null || value.isEmpty) {
  //                                   //     return "Masukkan jumlah kamar tidur";
  //                                   //   }
  //                                   //   return null;
  //                                   // },
  //                                   decoration: InputDecoration(
  //                                     enabledBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122)),
  //                                     ),
  //                                     focusedBorder: OutlineInputBorder(
  //                                       borderSide: BorderSide(
  //                                           color: Colors.grey.shade400),
  //                                     ),
  //                                     fillColor: Colors.grey.shade200,
  //                                     filled: true,
  //                                     contentPadding:
  //                                         const EdgeInsets.symmetric(
  //                                             vertical: 5.0, horizontal: 15.0),
  //                                     hintText: '',
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                           Form(
  //                             child: Padding(
  //                               padding: const EdgeInsets.only(
  //                                   right: 25.0, top: 10.0),
  //                               child: SizedBox(
  //                                 width: 100.0,
  //                                 height: 35.0,
  //                                 child: TextFormField(
  //                                   controller: jumlahKamarMandiController,
  //                                   // autovalidateMode: AutovalidateMode.onUserInteraction,
  //                                   // validator: (value) {
  //                                   //   if (value == null || value.isEmpty) {
  //                                   //     return "Masukkan jumlah kamar mandi";
  //                                   //   }
  //                                   //   return null;
  //                                   // },
  //                                   decoration: InputDecoration(
  //                                     enabledBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122)),
  //                                     ),
  //                                     focusedBorder: OutlineInputBorder(
  //                                       borderSide: BorderSide(
  //                                           color: Colors.grey.shade400),
  //                                     ),
  //                                     fillColor: Colors.grey.shade200,
  //                                     filled: true,
  //                                     contentPadding:
  //                                         const EdgeInsets.symmetric(
  //                                             vertical: 5.0, horizontal: 15.0),
  //                                     hintText: '',
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       const SizedBox(
  //                         height: 15,
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       const SizedBox(
  //                         height: 15,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Foto Properti',
  //                               style: TextStyle(
  //                                   fontSize: 18, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             width: 65,
  //                           ),
  //                           SizedBox(
  //                             width: 200,
  //                             child: ElevatedButton(
  //                               onPressed: showOptions,
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           const Color.fromARGB(
  //                                               255, 205, 166, 122)),
  //                                   shape:
  //                                       MaterialStateProperty.all<RoundedRectangleBorder>(
  //                                           RoundedRectangleBorder(
  //                                               borderRadius:
  //                                                   BorderRadius.circular(10.0),
  //                                               side: const BorderSide(
  //                                                   color: Color.fromARGB(
  //                                                       255, 205, 166, 122))))),
  //                               child: const Text('Select Image'),
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                       const SizedBox(
  //                         height: 30,
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: ElevatedButton(
  //                           onPressed: () async {
  //                             await postPropertyToServer();
  //                           },
  //                           style: ButtonStyle(
  //                               backgroundColor: MaterialStateProperty.all<Color>(
  //                                   const Color.fromARGB(255, 205, 166, 122)),
  //                               shape: MaterialStateProperty.all<
  //                                       RoundedRectangleBorder>(
  //                                   RoundedRectangleBorder(
  //                                       borderRadius:
  //                                           BorderRadius.circular(20.0),
  //                                       side: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122))))),
  //                           child: const Text('Pasang Iklan'),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ));
  //       });
  // }

  // Future Jual_Tanah(
  //   BuildContext context,
  // ) {
  //   File image;
  //   final picker = ImagePicker();

  //   String base64string = '';

  //   Future<void> getImageFromGallery() async {
  //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  //     if (pickedFile != null) {
  //       image = File(pickedFile.path);

  //       ///File imagefile = File(imagepath); //convert Path to File
  //       Future<Uint8List> imagebytes = image.readAsBytes(); //convert to bytes
  //       Uint8List bytes = await imagebytes;

  //       base64string = base64.encode(bytes); //convert bytes to base64 string
  //       setState(() {
  //         print(base64string);
  //       });
  //     }
  //   }

  //   Future getImageFromCamera() async {
  //     final pickedFile = await picker.pickImage(source: ImageSource.camera);
  //     if (pickedFile != null) {
  //       image = File(pickedFile.path);

  //       Future<Uint8List> imagebytes = image.readAsBytes(); //convert to bytes
  //       Uint8List bytes = await imagebytes;

  //       base64string = base64.encode(bytes);
  //       setState(() {
  //         print(base64string);
  //       });
  //     }
  //   }

  //   Future postPropertyToServer() async {
  //     final Uri url = Uri.https('hunianku.juanfredoalexiu.repl.co', 'properties');
  //     String udid = await FlutterUdid.udid;

  //     int timestamp = DateTime.now().millisecondsSinceEpoch;
  //     DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
  //     String formattedDate =
  //         "${dateTime.year}-${_addLeadingZero(dateTime.month)}-${_addLeadingZero(dateTime.day)} "
  //         "${_addLeadingZero(dateTime.hour)}:${_addLeadingZero(dateTime.minute)}:${_addLeadingZero(dateTime.second)}";

  //     final response = await http.post(
  //       url,
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode({
  //         'udid': udid,
  //         'action': "Jual",
  //         'type': "Tanah",
  //         'lokasi': lokasiController.text,
  //         'harga': hargaController.text,
  //         'area': luasController.text,
  //         //masi belum
  //         'ketinggian': ketinggianController.text,
  //         'image': base64string,
  //         'date': formattedDate,
  //         'status': "Ready"
  //       }),
  //     );

  //     if (response.statusCode == 200) {
  //       print('Property added successfuly');
  //     } else {
  //       print('Failed to add property. Status Code: ${response.statusCode}');
  //       print('Error Response: ${response.body}');
  //     }
  //   }

  //   Future showOptions() async {
  //     showCupertinoModalPopup(
  //         context: context,
  //         builder: (context) => CupertinoActionSheet(
  //               actions: [
  //                 CupertinoActionSheetAction(
  //                   child: const Text('Photo Gallery'),
  //                   onPressed: () {
  //                     Navigator.of(context).pop();

  //                     getImageFromGallery();
  //                   },
  //                 ),
  //                 CupertinoActionSheetAction(
  //                   child: const Text('Camera'),
  //                   onPressed: () {
  //                     Navigator.of(context).pop();

  //                     getImageFromCamera();
  //                   },
  //                 )
  //               ],
  //             ));
  //   }

  //   final formField = GlobalKey<FormState>();
  //   return showModalBottomSheet(
  //       context: context,
  //       backgroundColor: Colors.white,
  //       isDismissible: true,
  //       isScrollControlled: true,
  //       shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
  //       builder: (BuildContext context) {
  //         return DraggableScrollableSheet(
  //             initialChildSize: 1,
  //             minChildSize: 0.5,
  //             maxChildSize: 1,
  //             expand: false,
  //             builder: (_, controller) => SizedBox(
  //                   height: double.infinity,
  //                   child: ListView(
  //                     controller: controller,
  //                     children: [
  //                       const SizedBox(
  //                         height: 20,
  //                       ),

  //                       Form(
  //                         key: formField,
  //                         autovalidateMode: AutovalidateMode.onUserInteraction,
  //                         child: Padding(
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 20.0, vertical: 25.0),
  //                           child: TextFormField(
  //                             controller: lokasiController,
  //                             autovalidateMode:
  //                                 AutovalidateMode.onUserInteraction,
  //                             validator: (value) {
  //                               if (value == null || value.isEmpty) {
  //                                 return "Masukkan lokasi properti";
  //                               }
  //                               return null;
  //                             },
  //                             decoration: InputDecoration(
  //                               enabledBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(20),
  //                                 borderSide: const BorderSide(
  //                                     color:
  //                                         Color.fromARGB(255, 205, 166, 122)),
  //                               ),
  //                               focusedBorder: OutlineInputBorder(
  //                                 borderSide:
  //                                     BorderSide(color: Colors.grey.shade400),
  //                               ),
  //                               fillColor: Colors.grey.shade200,
  //                               filled: true,
  //                               contentPadding: const EdgeInsets.symmetric(
  //                                   vertical: 10.0, horizontal: 15.0),
  //                               hintText: 'Lokasi Tanah',
  //                               // suffixIcon: Icon(Icons.search_rounded),
  //                             ),
  //                           ),
  //                         ),
  //                       ),

  //                       // Text('list1: $list_JualTanah.join("")'),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Kisaran Harga (Rp)',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 bottom: 20.0, left: 10.0, top: 18.0),
  //                             child: Wrap(
  //                                 alignment: WrapAlignment.start,
  //                                 children: <Widget>[
  //                                   SizedBox(
  //                                     width: 205.0,
  //                                     height: 35.0,
  //                                     child: TextFormField(
  //                                       controller: hargaController,
  //                                       // autovalidateMode:
  //                                       //     AutovalidateMode.onUserInteraction,
  //                                       // validator: (value) {
  //                                       //   if (value == null || value.isEmpty) {
  //                                       //     return "Masukkan harga properti";
  //                                       //   }
  //                                       //   return null;
  //                                       // },
  //                                       decoration: InputDecoration(
  //                                         enabledBorder: OutlineInputBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           borderSide: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122)),
  //                                         ),
  //                                         focusedBorder: OutlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Colors.grey.shade400),
  //                                         ),
  //                                         fillColor: Colors.grey.shade200,
  //                                         filled: true,
  //                                         contentPadding:
  //                                             const EdgeInsets.symmetric(
  //                                                 vertical: 5.0,
  //                                                 horizontal: 15.0),
  //                                         hintText: '',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Luas Area (meter persegi)',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 bottom: 20.0, left: 10.0, top: 18.0),
  //                             child: Wrap(
  //                                 alignment: WrapAlignment.start,
  //                                 children: <Widget>[
  //                                   SizedBox(
  //                                     width: 147.0,
  //                                     height: 35.0,
  //                                     child: TextFormField(
  //                                       controller: luasController,
  //                                       // autovalidateMode:
  //                                       //     AutovalidateMode.onUserInteraction,
  //                                       // validator: (value) {
  //                                       //   if (value == null || value.isEmpty) {
  //                                       //     return "Masukkan rentang area properti";
  //                                       //   }
  //                                       //   return null;
  //                                       // },
  //                                       decoration: InputDecoration(
  //                                         enabledBorder: OutlineInputBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           borderSide: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122)),
  //                                         ),
  //                                         focusedBorder: OutlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Colors.grey.shade400),
  //                                         ),
  //                                         fillColor: Colors.grey.shade200,
  //                                         filled: true,
  //                                         contentPadding:
  //                                             const EdgeInsets.symmetric(
  //                                                 vertical: 5.0,
  //                                                 horizontal: 15.0),
  //                                         hintText: '',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Ketinggian (mdpl)',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 bottom: 20.0, left: 10.0, top: 18.0),
  //                             child: Wrap(
  //                                 alignment: WrapAlignment.start,
  //                                 children: <Widget>[
  //                                   SizedBox(
  //                                     width: 215.0,
  //                                     height: 35.0,
  //                                     child: TextFormField(
  //                                       controller: ketinggianController,
  //                                       // autovalidateMode:
  //                                       //     AutovalidateMode.onUserInteraction,
  //                                       // validator: (value) {
  //                                       //   if (value == null || value.isEmpty) {
  //                                       //     return "Masukkan rentang area properti";
  //                                       //   }
  //                                       //   return null;
  //                                       // },
  //                                       decoration: InputDecoration(
  //                                         enabledBorder: OutlineInputBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           borderSide: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122)),
  //                                         ),
  //                                         focusedBorder: OutlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Colors.grey.shade400),
  //                                         ),
  //                                         fillColor: Colors.grey.shade200,
  //                                         filled: true,
  //                                         contentPadding:
  //                                             const EdgeInsets.symmetric(
  //                                                 vertical: 5.0,
  //                                                 horizontal: 15.0),
  //                                         hintText: '',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       const SizedBox(
  //                         height: 15,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Foto Properti',
  //                               style: TextStyle(
  //                                   fontSize: 18, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             width: 65,
  //                           ),
  //                           SizedBox(
  //                             width: 200,
  //                             child: ElevatedButton(
  //                               onPressed: showOptions,
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           const Color.fromARGB(
  //                                               255, 205, 166, 122)),
  //                                   shape:
  //                                       MaterialStateProperty.all<RoundedRectangleBorder>(
  //                                           RoundedRectangleBorder(
  //                                               borderRadius:
  //                                                   BorderRadius.circular(10.0),
  //                                               side: const BorderSide(
  //                                                   color: Color.fromARGB(
  //                                                       255, 205, 166, 122))))),
  //                               child: const Text('Select Image'),
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                       const SizedBox(
  //                         height: 30,
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: ElevatedButton(
  //                           onPressed: () async {
  //                             await postPropertyToServer();
  //                           },
  //                           style: ButtonStyle(
  //                               backgroundColor: MaterialStateProperty.all<Color>(
  //                                   const Color.fromARGB(255, 205, 166, 122)),
  //                               shape: MaterialStateProperty.all<
  //                                       RoundedRectangleBorder>(
  //                                   RoundedRectangleBorder(
  //                                       borderRadius:
  //                                           BorderRadius.circular(20.0),
  //                                       side: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122))))),
  //                           child: const Text('Pasang Iklan'),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ));
  //       });
  // }

  // Future Jual_Apartement(BuildContext context) {
  //   File image;
  //   final picker = ImagePicker();

  //   String base64string = '';

  //   Future<void> getImageFromGallery() async {
  //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  //     if (pickedFile != null) {
  //       image = File(pickedFile.path);

  //       ///File imagefile = File(imagepath); //convert Path to File
  //       Future<Uint8List> imagebytes = image.readAsBytes(); //convert to bytes
  //       Uint8List bytes = await imagebytes;

  //       base64string = base64.encode(bytes); //convert bytes to base64 string
  //       setState(() {
  //         print(base64string);
  //       });
  //     }
  //   }

  //   Future getImageFromCamera() async {
  //     final pickedFile = await picker.pickImage(source: ImageSource.camera);
  //     if (pickedFile != null) {
  //       image = File(pickedFile.path);

  //       Future<Uint8List> imagebytes = image.readAsBytes(); //convert to bytes
  //       Uint8List bytes = await imagebytes;

  //       base64string = base64.encode(bytes);
  //       setState(() {
  //         print(base64string);
  //       });
  //     }
  //   }

  //   Future postPropertyToServer() async {
  //     final Uri url = Uri.https('hunianku.juanfredoalexiu.repl.co', 'properties');
  //     String udid = await FlutterUdid.udid;

  //     int timestamp = DateTime.now().millisecondsSinceEpoch;
  //     DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
  //     String formattedDate =
  //         "${dateTime.year}-${_addLeadingZero(dateTime.month)}-${_addLeadingZero(dateTime.day)} "
  //         "${_addLeadingZero(dateTime.hour)}:${_addLeadingZero(dateTime.minute)}:${_addLeadingZero(dateTime.second)}";

  //     final response = await http.post(
  //       url,
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode({
  //         'udid': udid,
  //         'action': "Jual",
  //         'type': "Apartement",
  //         'lokasi': lokasiController.text,
  //         'harga': hargaController.text,
  //         'area': luasController.text,
  //         'kTidur': jumlahKamarTidurController.text,
  //         'kMandi': jumlahKamarMandiController.text,
  //         'image': base64string,
  //         'date': formattedDate,
  //         'status': "Ready"
  //       }),
  //     );

  //     if (response.statusCode == 200) {
  //       print('Property added successfuly');
  //     } else {
  //       print('Failed to add property. Status Code: ${response.statusCode}');
  //       print('Error Response: ${response.body}');
  //     }
  //   }

  //   Future showOptions() async {
  //     showCupertinoModalPopup(
  //         context: context,
  //         builder: (context) => CupertinoActionSheet(
  //               actions: [
  //                 CupertinoActionSheetAction(
  //                   child: const Text('Photo Gallery'),
  //                   onPressed: () {
  //                     Navigator.of(context).pop();

  //                     getImageFromGallery();
  //                   },
  //                 ),
  //                 CupertinoActionSheetAction(
  //                   child: const Text('Camera'),
  //                   onPressed: () {
  //                     Navigator.of(context).pop();

  //                     getImageFromCamera();
  //                   },
  //                 )
  //               ],
  //             ));
  //   }

  //   final formField = GlobalKey<FormState>();
  //   return showModalBottomSheet(
  //       context: context,
  //       backgroundColor: Colors.white,
  //       isDismissible: true,
  //       isScrollControlled: true,
  //       shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
  //       builder: (BuildContext context) {
  //         return DraggableScrollableSheet(
  //             initialChildSize: 1,
  //             minChildSize: 0.5,
  //             maxChildSize: 1,
  //             expand: false,
  //             builder: (_, controller) => SizedBox(
  //                   height: double.infinity,
  //                   child: ListView(
  //                     controller: controller,
  //                     children: [
  //                       const SizedBox(
  //                         height: 20,
  //                       ),
  //                       Form(
  //                         key: formField,
  //                         autovalidateMode: AutovalidateMode.onUserInteraction,
  //                         child: Padding(
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 20.0, vertical: 25.0),
  //                           child: TextFormField(
  //                             controller: lokasiController,
  //                             autovalidateMode:
  //                                 AutovalidateMode.onUserInteraction,
  //                             validator: (value) {
  //                               if (value == null || value.isEmpty) {
  //                                 return "Masukkan lokasi properti";
  //                               }
  //                               return null;
  //                             },
  //                             decoration: InputDecoration(
  //                               enabledBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(20),
  //                                 borderSide: const BorderSide(
  //                                     color:
  //                                         Color.fromARGB(255, 205, 166, 122)),
  //                               ),
  //                               focusedBorder: OutlineInputBorder(
  //                                 borderSide:
  //                                     BorderSide(color: Colors.grey.shade400),
  //                               ),
  //                               fillColor: Colors.grey.shade200,
  //                               filled: true,
  //                               contentPadding: const EdgeInsets.symmetric(
  //                                   vertical: 10.0, horizontal: 15.0),
  //                               hintText: 'Lokasi Rumah',
  //                               // suffixIcon: Icon(Icons.search_rounded),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Kisaran Harga (Rp)',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 bottom: 20.0, left: 10.0, top: 18.0),
  //                             child: Wrap(
  //                                 alignment: WrapAlignment.start,
  //                                 children: <Widget>[
  //                                   SizedBox(
  //                                     width: 205.0,
  //                                     height: 35.0,
  //                                     child: TextFormField(
  //                                       controller: hargaController,
  //                                       // autovalidateMode:
  //                                       //     AutovalidateMode.onUserInteraction,
  //                                       // validator: (value) {
  //                                       //   if (value == null || value.isEmpty) {
  //                                       //     return "Masukkan harga properti";
  //                                       //   }
  //                                       //   return null;
  //                                       // },
  //                                       decoration: InputDecoration(
  //                                         enabledBorder: OutlineInputBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           borderSide: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122)),
  //                                         ),
  //                                         focusedBorder: OutlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Colors.grey.shade400),
  //                                         ),
  //                                         fillColor: Colors.grey.shade200,
  //                                         filled: true,
  //                                         contentPadding:
  //                                             const EdgeInsets.symmetric(
  //                                                 vertical: 5.0,
  //                                                 horizontal: 15.0),
  //                                         hintText: '',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Luas Area (meter persegi)',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 bottom: 20.0, left: 10.0, top: 18.0),
  //                             child: Wrap(
  //                                 alignment: WrapAlignment.start,
  //                                 children: <Widget>[
  //                                   SizedBox(
  //                                     width: 147.0,
  //                                     height: 35.0,
  //                                     child: TextFormField(
  //                                       controller: luasController,
  //                                       // autovalidateMode:
  //                                       //     AutovalidateMode.onUserInteraction,
  //                                       // validator: (value) {
  //                                       //   if (value == null || value.isEmpty) {
  //                                       //     return "Masukkan rentang area properti";
  //                                       //   }
  //                                       //   return null;
  //                                       // },
  //                                       decoration: InputDecoration(
  //                                         enabledBorder: OutlineInputBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           borderSide: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122)),
  //                                         ),
  //                                         focusedBorder: OutlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Colors.grey.shade400),
  //                                         ),
  //                                         fillColor: Colors.grey.shade200,
  //                                         filled: true,
  //                                         contentPadding:
  //                                             const EdgeInsets.symmetric(
  //                                                 vertical: 5.0,
  //                                                 horizontal: 15.0),
  //                                         hintText: '',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       const Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Padding(
  //                             padding: EdgeInsets.only(left: 10.0, top: 10.0),
  //                             child: Text(
  //                               'Jumlah Kamar Tidur',
  //                               style: TextStyle(
  //                                   fontSize: 15, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                           Padding(
  //                             padding: EdgeInsets.only(right: 10.0, top: 10.0),
  //                             child: Text(
  //                               'Jumlah Kamar Mandi',
  //                               style: TextStyle(
  //                                   fontSize: 15, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Form(
  //                             child: Padding(
  //                               padding: const EdgeInsets.only(
  //                                   left: 25.0, top: 10.0),
  //                               child: SizedBox(
  //                                 width: 100.0,
  //                                 height: 35.0,
  //                                 child: TextFormField(
  //                                   controller: jumlahKamarTidurController,
  //                                   // autovalidateMode: AutovalidateMode.onUserInteraction,
  //                                   // validator: (value) {
  //                                   //   if (value == null || value.isEmpty) {
  //                                   //     return "Masukkan jumlah kamar tidur";
  //                                   //   }
  //                                   //   return null;
  //                                   // },
  //                                   decoration: InputDecoration(
  //                                     enabledBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122)),
  //                                     ),
  //                                     focusedBorder: OutlineInputBorder(
  //                                       borderSide: BorderSide(
  //                                           color: Colors.grey.shade400),
  //                                     ),
  //                                     fillColor: Colors.grey.shade200,
  //                                     filled: true,
  //                                     contentPadding:
  //                                         const EdgeInsets.symmetric(
  //                                             vertical: 5.0, horizontal: 15.0),
  //                                     hintText: '',
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                           Form(
  //                             child: Padding(
  //                               padding: const EdgeInsets.only(
  //                                   right: 25.0, top: 10.0),
  //                               child: SizedBox(
  //                                 width: 100.0,
  //                                 height: 35.0,
  //                                 child: TextFormField(
  //                                   controller: jumlahKamarMandiController,
  //                                   // autovalidateMode: AutovalidateMode.onUserInteraction,
  //                                   // validator: (value) {
  //                                   //   if (value == null || value.isEmpty) {
  //                                   //     return "Masukkan jumlah kamar mandi";
  //                                   //   }
  //                                   //   return null;
  //                                   // },
  //                                   decoration: InputDecoration(
  //                                     enabledBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122)),
  //                                     ),
  //                                     focusedBorder: OutlineInputBorder(
  //                                       borderSide: BorderSide(
  //                                           color: Colors.grey.shade400),
  //                                     ),
  //                                     fillColor: Colors.grey.shade200,
  //                                     filled: true,
  //                                     contentPadding:
  //                                         const EdgeInsets.symmetric(
  //                                             vertical: 5.0, horizontal: 15.0),
  //                                     hintText: '',
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       const SizedBox(
  //                         height: 15,
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       const SizedBox(
  //                         height: 15,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Foto Properti',
  //                               style: TextStyle(
  //                                   fontSize: 18, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             width: 65,
  //                           ),
  //                           SizedBox(
  //                             width: 200,
  //                             child: ElevatedButton(
  //                               onPressed: showOptions,
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           const Color.fromARGB(
  //                                               255, 205, 166, 122)),
  //                                   shape:
  //                                       MaterialStateProperty.all<RoundedRectangleBorder>(
  //                                           RoundedRectangleBorder(
  //                                               borderRadius:
  //                                                   BorderRadius.circular(10.0),
  //                                               side: const BorderSide(
  //                                                   color: Color.fromARGB(
  //                                                       255, 205, 166, 122))))),
  //                               child: const Text('Select Image'),
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                       const SizedBox(
  //                         height: 30,
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: ElevatedButton(
  //                           onPressed: () async {
  //                             await postPropertyToServer();
  //                           },
  //                           style: ButtonStyle(
  //                               backgroundColor: MaterialStateProperty.all<Color>(
  //                                   const Color.fromARGB(255, 205, 166, 122)),
  //                               shape: MaterialStateProperty.all<
  //                                       RoundedRectangleBorder>(
  //                                   RoundedRectangleBorder(
  //                                       borderRadius:
  //                                           BorderRadius.circular(20.0),
  //                                       side: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122))))),
  //                           child: const Text('Pasang Iklan'),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ));
  //       });
  // }

  // Future Jual_Komersil(BuildContext context) {
  //   File? image;
  //   final picker = ImagePicker();

  //   String base64string = '';

  //   Future<void> getImageFromGallery() async {
  //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  //     if (pickedFile != null) {
  //       image = File(pickedFile.path);

  //       ///File imagefile = File(imagepath); //convert Path to File
  //       Future<Uint8List> imagebytes = image!.readAsBytes(); //convert to bytes
  //       Uint8List bytes = await imagebytes;

  //       base64string = base64.encode(bytes); //convert bytes to base64 string
  //       setState(() {
  //         print(base64string);
  //       });
  //     }
  //   }

  //   Future getImageFromCamera() async {
  //     final pickedFile = await picker.pickImage(source: ImageSource.camera);
  //     if (pickedFile != null) {
  //       image = File(pickedFile.path);

  //       Future<Uint8List> imagebytes = image!.readAsBytes(); //convert to bytes
  //       Uint8List bytes = await imagebytes;

  //       base64string = base64.encode(bytes);
  //       setState(() {
  //         print(base64string);
  //       });
  //     }
  //   }

  //   Future postPropertyToServer() async {
  //     final Uri url = Uri.https('hunianku.juanfredoalexiu.repl.co', 'properties');
  //     String udid = await FlutterUdid.udid;

  //     int timestamp = DateTime.now().millisecondsSinceEpoch;
  //     DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
  //     String formattedDate =
  //         "${dateTime.year}-${_addLeadingZero(dateTime.month)}-${_addLeadingZero(dateTime.day)} "
  //         "${_addLeadingZero(dateTime.hour)}:${_addLeadingZero(dateTime.minute)}:${_addLeadingZero(dateTime.second)}";

  //     final response = await http.post(
  //       url,
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode({
  //         'udid': udid,
  //         'action': "Jual",
  //         'type': "Komersil",
  //         'lokasi': lokasiController.text,
  //         'harga': hargaController.text,
  //         'area': luasController.text,
  //         'kTidur': jumlahKamarTidurController.text,
  //         'kMandi': jumlahKamarMandiController.text,
  //         'image': base64string,
  //         'date': formattedDate,
  //         'status': "Ready"
  //       }),
  //     );

  //     if (response.statusCode == 200) {
  //       print('Property added successfuly');
  //     } else {
  //       print('Failed to add property. Status Code: ${response.statusCode}');
  //       print('Error Response: ${response.body}');
  //     }
  //   }

  //   Future showOptions() async {
  //     showCupertinoModalPopup(
  //         context: context,
  //         builder: (context) => CupertinoActionSheet(
  //               actions: [
  //                 CupertinoActionSheetAction(
  //                   child: const Text('Photo Gallery'),
  //                   onPressed: () {
  //                     Navigator.of(context).pop();

  //                     getImageFromGallery();
  //                   },
  //                 ),
  //                 CupertinoActionSheetAction(
  //                   child: const Text('Camera'),
  //                   onPressed: () {
  //                     Navigator.of(context).pop();

  //                     getImageFromCamera();
  //                   },
  //                 )
  //               ],
  //             ));
  //   }

  //   Future<void> pickImage() async {
  //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  //     setState(() {
  //       if (pickedFile != null) {
  //         image = File(pickedFile.path);
  //       } else {
  //         print('No image selected');
  //       }
  //     });
  //   }

  //   final formField = GlobalKey<FormState>();
  //   return showModalBottomSheet(
  //       context: context,
  //       backgroundColor: Colors.white,
  //       isDismissible: true,
  //       isScrollControlled: true,
  //       shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
  //       builder: (BuildContext context) {
  //         return DraggableScrollableSheet(
  //             initialChildSize: 1,
  //             minChildSize: 0.5,
  //             maxChildSize: 1,
  //             expand: false,
  //             builder: (_, controller) => SizedBox(
  //                   height: double.infinity,
  //                   child: ListView(
  //                     controller: controller,
  //                     children: [
  //                       const SizedBox(
  //                         height: 20,
  //                       ),
  //                       Form(
  //                         key: formField,
  //                         autovalidateMode: AutovalidateMode.onUserInteraction,
  //                         child: Padding(
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 20.0, vertical: 25.0),
  //                           child: TextFormField(
  //                             controller: lokasiController,
  //                             autovalidateMode:
  //                                 AutovalidateMode.onUserInteraction,
  //                             validator: (value) {
  //                               if (value == null || value.isEmpty) {
  //                                 return "Masukkan lokasi properti";
  //                               }
  //                               return null;
  //                             },
  //                             decoration: InputDecoration(
  //                               enabledBorder: OutlineInputBorder(
  //                                 borderRadius: BorderRadius.circular(20),
  //                                 borderSide: const BorderSide(
  //                                     color:
  //                                         Color.fromARGB(255, 205, 166, 122)),
  //                               ),
  //                               focusedBorder: OutlineInputBorder(
  //                                 borderSide:
  //                                     BorderSide(color: Colors.grey.shade400),
  //                               ),
  //                               fillColor: Colors.grey.shade200,
  //                               filled: true,
  //                               contentPadding: const EdgeInsets.symmetric(
  //                                   vertical: 10.0, horizontal: 15.0),
  //                               hintText: 'Lokasi Rumah',
  //                               // suffixIcon: Icon(Icons.search_rounded),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Kisaran Harga (Rp)',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 bottom: 20.0, left: 10.0, top: 18.0),
  //                             child: Wrap(
  //                                 alignment: WrapAlignment.start,
  //                                 children: <Widget>[
  //                                   SizedBox(
  //                                     width: 205.0,
  //                                     height: 35.0,
  //                                     child: TextFormField(
  //                                       controller: hargaController,
  //                                       // autovalidateMode:
  //                                       //     AutovalidateMode.onUserInteraction,
  //                                       // validator: (value) {
  //                                       //   if (value == null || value.isEmpty) {
  //                                       //     return "Masukkan harga properti";
  //                                       //   }
  //                                       //   return null;
  //                                       // },
  //                                       decoration: InputDecoration(
  //                                         enabledBorder: OutlineInputBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           borderSide: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122)),
  //                                         ),
  //                                         focusedBorder: OutlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Colors.grey.shade400),
  //                                         ),
  //                                         fillColor: Colors.grey.shade200,
  //                                         filled: true,
  //                                         contentPadding:
  //                                             const EdgeInsets.symmetric(
  //                                                 vertical: 5.0,
  //                                                 horizontal: 15.0),
  //                                         hintText: '',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Luas Area (meter persegi)',
  //                               style: TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 18),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             height: 10,
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(
  //                                 bottom: 20.0, left: 10.0, top: 18.0),
  //                             child: Wrap(
  //                                 alignment: WrapAlignment.start,
  //                                 children: <Widget>[
  //                                   SizedBox(
  //                                     width: 147.0,
  //                                     height: 35.0,
  //                                     child: TextFormField(
  //                                       controller: luasController,
  //                                       // autovalidateMode:
  //                                       //     AutovalidateMode.onUserInteraction,
  //                                       // validator: (value) {
  //                                       //   if (value == null || value.isEmpty) {
  //                                       //     return "Masukkan rentang area properti";
  //                                       //   }
  //                                       //   return null;
  //                                       // },
  //                                       decoration: InputDecoration(
  //                                         enabledBorder: OutlineInputBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           borderSide: const BorderSide(
  //                                               color: Color.fromARGB(
  //                                                   255, 205, 166, 122)),
  //                                         ),
  //                                         focusedBorder: OutlineInputBorder(
  //                                           borderSide: BorderSide(
  //                                               color: Colors.grey.shade400),
  //                                         ),
  //                                         fillColor: Colors.grey.shade200,
  //                                         filled: true,
  //                                         contentPadding:
  //                                             const EdgeInsets.symmetric(
  //                                                 vertical: 5.0,
  //                                                 horizontal: 15.0),
  //                                         hintText: '',
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                           ),
  //                         ],
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       const Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Padding(
  //                             padding: EdgeInsets.only(left: 10.0, top: 10.0),
  //                             child: Text(
  //                               'Jumlah Kamar Tidur',
  //                               style: TextStyle(
  //                                   fontSize: 15, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                           Padding(
  //                             padding: EdgeInsets.only(right: 10.0, top: 10.0),
  //                             child: Text(
  //                               'Jumlah Kamar Mandi',
  //                               style: TextStyle(
  //                                   fontSize: 15, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Form(
  //                             child: Padding(
  //                               padding: const EdgeInsets.only(
  //                                   left: 25.0, top: 10.0),
  //                               child: SizedBox(
  //                                 width: 100.0,
  //                                 height: 35.0,
  //                                 child: TextFormField(
  //                                   controller: jumlahKamarTidurController,
  //                                   // autovalidateMode: AutovalidateMode.onUserInteraction,
  //                                   // validator: (value) {
  //                                   //   if (value == null || value.isEmpty) {
  //                                   //     return "Masukkan jumlah kamar tidur";
  //                                   //   }
  //                                   //   return null;
  //                                   // },
  //                                   decoration: InputDecoration(
  //                                     enabledBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122)),
  //                                     ),
  //                                     focusedBorder: OutlineInputBorder(
  //                                       borderSide: BorderSide(
  //                                           color: Colors.grey.shade400),
  //                                     ),
  //                                     fillColor: Colors.grey.shade200,
  //                                     filled: true,
  //                                     contentPadding:
  //                                         const EdgeInsets.symmetric(
  //                                             vertical: 5.0, horizontal: 15.0),
  //                                     hintText: '',
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                           Form(
  //                             child: Padding(
  //                               padding: const EdgeInsets.only(
  //                                   right: 25.0, top: 10.0),
  //                               child: SizedBox(
  //                                 width: 100.0,
  //                                 height: 35.0,
  //                                 child: TextFormField(
  //                                   controller: jumlahKamarMandiController,
  //                                   // autovalidateMode: AutovalidateMode.onUserInteraction,
  //                                   // validator: (value) {
  //                                   //   if (value == null || value.isEmpty) {
  //                                   //     return "Masukkan jumlah kamar mandi";
  //                                   //   }
  //                                   //   return null;
  //                                   // },
  //                                   decoration: InputDecoration(
  //                                     enabledBorder: OutlineInputBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       borderSide: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122)),
  //                                     ),
  //                                     focusedBorder: OutlineInputBorder(
  //                                       borderSide: BorderSide(
  //                                           color: Colors.grey.shade400),
  //                                     ),
  //                                     fillColor: Colors.grey.shade200,
  //                                     filled: true,
  //                                     contentPadding:
  //                                         const EdgeInsets.symmetric(
  //                                             vertical: 5.0, horizontal: 15.0),
  //                                     hintText: '',
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       const SizedBox(
  //                         height: 15,
  //                       ),
  //                       const Divider(
  //                         color: Color.fromARGB(255, 184, 184, 184),
  //                         thickness: 1.0,
  //                       ),
  //                       const SizedBox(
  //                         height: 15,
  //                       ),
  //                       Row(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.only(left: 10.0),
  //                             child: Text(
  //                               'Foto Properti',
  //                               style: TextStyle(
  //                                   fontSize: 18, fontWeight: FontWeight.bold),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             width: 65,
  //                           ),
  //                           SizedBox(
  //                             width: 200,
  //                             child: ElevatedButton(
  //                               onPressed: showOptions,
  //                               style: ButtonStyle(
  //                                   backgroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           const Color.fromARGB(
  //                                               255, 205, 166, 122)),
  //                                   shape:
  //                                       MaterialStateProperty.all<RoundedRectangleBorder>(
  //                                           RoundedRectangleBorder(
  //                                               borderRadius:
  //                                                   BorderRadius.circular(10.0),
  //                                               side: const BorderSide(
  //                                                   color: Color.fromARGB(
  //                                                       255, 205, 166, 122))))),
  //                               child: const Text('Select Image'),
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                       const SizedBox(
  //                         height: 30,
  //                       ),
  //                       // image != null
  //                       //     ? Image.file(
  //                       //         image!,
  //                       //         width: 150,
  //                       //         height: 150,
  //                       //       )
  //                       //     : const Text(
  //                       //         'Pilih Foto Properti',
  //                       //         textAlign: TextAlign.center,
  //                       //       ),
  //                       // const SizedBox(
  //                       //   height: 30,
  //                       // ),

  //                       Text(image != null
  //                           ? '${image?.path.split('/').last}'
  //                           : ''),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: ElevatedButton(
  //                           onPressed: () async {
  //                             await postPropertyToServer();
  //                           },
  //                           style: ButtonStyle(
  //                               backgroundColor: MaterialStateProperty.all<Color>(
  //                                   const Color.fromARGB(255, 205, 166, 122)),
  //                               shape: MaterialStateProperty.all<
  //                                       RoundedRectangleBorder>(
  //                                   RoundedRectangleBorder(
  //                                       borderRadius:
  //                                           BorderRadius.circular(20.0),
  //                                       side: const BorderSide(
  //                                           color: Color.fromARGB(
  //                                               255, 205, 166, 122))))),
  //                           child: const Text('Pasang Iklan'),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ));
  //       });
  // }
}
