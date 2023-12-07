import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';

class FilterPasangIklan extends StatefulWidget {
  const FilterPasangIklan({super.key});

  @override
  State<FilterPasangIklan> createState() => _FilterPasangIklanState();
}

class _FilterPasangIklanState extends State<FilterPasangIklan> {
  bool isPressedJual = false;
  bool isPressedSewa = false;
  bool isPressedTanah = false;
  bool isPressedRumah = false;
  bool isPressedApartement = false;
  bool isPressedKost = false;
  bool isPressedKomersil = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 58, 58, 58),
      body: ListView(
        children: <Widget>[
          Row(
            children: [
              IconButton(
                color: Color.fromARGB(255, 205, 166, 122),
                icon: Icon(Icons.arrow_back_ios_rounded),
                onPressed: () {},
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                'Properti apa yang anda jual?',
                style: TextStyle(
                    color: Color.fromARGB(255, 205, 166, 122), fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 150,
                height: 35,
                child: ElevatedButton(
                  child: Text(
                    'Jual',
                    style: isPressedJual
                        ? TextStyle(color: Color.fromARGB(255, 205, 166, 122))
                        : TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isPressedJual
                        ? Colors.white
                        : Color.fromARGB(255, 205, 166, 122),
                  ),
                  onPressed: () {
                    setState(() {
                      isPressedJual = !isPressedJual;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 150,
                height: 35,
                child: ElevatedButton(
                  child: Text(
                    'Sewa',
                    style: isPressedSewa
                        ? TextStyle(color: Color.fromARGB(255, 205, 166, 122))
                        : TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isPressedSewa
                        ? Colors.white
                        : Color.fromARGB(255, 205, 166, 122),
                  ),
                  onPressed: () {
                    setState(() {
                      isPressedSewa = !isPressedSewa;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Divider(
            color: Color.fromARGB(255, 184, 184, 184),
            thickness: 1.0,
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 35,
                child: ElevatedButton(
                  child: Text(
                    'Tanah',
                    style: isPressedTanah
                        ? TextStyle(color: Color.fromARGB(255, 205, 166, 122))
                        : TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isPressedTanah
                        ? Colors.white
                        : Color.fromARGB(255, 205, 166, 122),
                  ),
                  onPressed: () {
                    // Jual_Tanah(context);
                    setState(() {
                      isPressedTanah = !isPressedTanah;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 150,
                height: 35,
                child: ElevatedButton(
                  child: Text(
                    'Rumah',
                    style: isPressedRumah
                        ? TextStyle(color: Color.fromARGB(255, 205, 166, 122))
                        : TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isPressedRumah
                        ? Colors.white
                        : Color.fromARGB(255, 205, 166, 122),
                  ),
                  onPressed: () {
                    // Jual_Rumah(context);
                    setState(() {
                      isPressedRumah = !isPressedRumah;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 150,
                height: 35,
                child: ElevatedButton(
                  child: Text(
                    'Apartement',
                    style: isPressedApartement
                        ? TextStyle(color: Color.fromARGB(255, 205, 166, 122))
                        : TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isPressedApartement
                        ? Colors.white
                        : Color.fromARGB(255, 205, 166, 122),
                  ),
                  onPressed: () {
                    // Jual_Apartement(context);
                    setState(() {
                      isPressedApartement = !isPressedApartement;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 150,
                height: 35,
                child: ElevatedButton(
                  child: Text(
                    'Kost',
                    style: isPressedKost
                        ? TextStyle(color: Color.fromARGB(255, 205, 166, 122))
                        : TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isPressedKost
                        ? Colors.white
                        : Color.fromARGB(255, 205, 166, 122),
                  ),
                  onPressed: () {
                    // Jual_Kost(context);
                    setState(() {
                      isPressedKost = !isPressedKost;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 150,
                height: 35,
                child: ElevatedButton(
                  child: Text(
                    'Komersil',
                    style: isPressedKomersil
                        ? TextStyle(color: Color.fromARGB(255, 205, 166, 122))
                        : TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isPressedKomersil
                        ? Colors.white
                        : Color.fromARGB(255, 205, 166, 122),
                  ),
                  onPressed: () {
                    // Jual_Komersil(context);
                    setState(() {
                      isPressedKomersil = !isPressedKomersil;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text('Selanjutnya'),
              onPressed: () {
                if (isPressedJual == true && isPressedTanah == true) {
                  Jual_Tanah(context);
                  List<String> list_JualTanah = ["Jual", "Tanah"];
                } else if (isPressedJual == true && isPressedRumah == true) {
                  Jual_Rumah(context);
                } else if (isPressedJual == true &&
                    isPressedApartement == true) {
                  Jual_Apartement(context);
                } else if (isPressedJual == true && isPressedKost == true) {
                  Jual_Kost(context);
                } else if (isPressedJual == true && isPressedKomersil == true) {
                  Jual_Komersil(context);
                } else if (isPressedSewa == true && isPressedTanah == true) {
                  Sewakan_Tanah(context);
                } else if (isPressedSewa == true && isPressedRumah == true) {
                  Sewakan_Rumah(context);
                } else if (isPressedSewa == true &&
                    isPressedApartement == true) {
                  Sewakan_Apartement(context);
                } else if (isPressedSewa == true && isPressedKost == true) {
                  Sewakan_Kost(context);
                } else if (isPressedSewa == true && isPressedKomersil == true) {
                  Sewakan_Komersil(context);
                }
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 205, 166, 122)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122))))),
            ),
          )
        ],
      ),
    );
  }

  // SEWAKAN SEWAKAN SEWAKAN SEWAKAN SEWAKAN SEWAKAN SEWAKAN SEWAKAN SEWAKAN SEWAKAN
  // --- Bottom Sheet Sewakan Rumah ---
  Future Sewakan_Rumah(BuildContext context) {
    final formField = GlobalKey<FormState>();
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isDismissible: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.5,
              maxChildSize: 1,
              expand: false,
              builder: (_, controller) => Container(
                    height: double.infinity,
                    child: ListView(
                      controller: controller,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: formField,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 25.0),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Masukkan lokasi properti";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
                                ),
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                hintText: 'Lokasi Rumah',
                                // suffixIcon: Icon(Icons.search_rounded),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                          child: Text(
                            'Rentang Sewa',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 20.0),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                child: Text('harian',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('mingguan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('bulanan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('3 bulan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('6 bulan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('tahunan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('semua',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kisaran Harga (Rp)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0, top: 18.0),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 205.0,
                                      height: 35.0,
                                      child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          hintText: '',
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Luas Area (meter persegi)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0, top: 18.0),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 147.0,
                                      height: 35.0,
                                      child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          hintText: '',
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Tidur',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Mandi',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Form(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, top: 10.0),
                                child: SizedBox(
                                  width: 100.0,
                                  height: 35.0,
                                  child: TextFormField(
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
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      contentPadding: EdgeInsets.symmetric(
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
                                    right: 25.0, top: 10.0),
                                child: SizedBox(
                                  width: 100.0,
                                  height: 35.0,
                                  child: TextFormField(
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
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 15.0),
                                      hintText: '',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            child: Text('Pasang Iklan'),
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 205, 166, 122)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122))))),
                          ),
                        )
                      ],
                    ),
                  ));
        });
  }

  // --- Bottom Sheet Sewakan Kost ---
  Future Sewakan_Kost(BuildContext context) {
    final formField = GlobalKey<FormState>();
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isDismissible: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.5,
              maxChildSize: 1,
              expand: false,
              builder: (_, controller) => Container(
                    height: double.infinity,
                    child: ListView(
                      controller: controller,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: formField,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 25.0),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Masukkan lokasi properti";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
                                ),
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                hintText: 'Lokasi Kost',
                                // suffixIcon: Icon(Icons.search_rounded),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                          child: Text(
                            'Rentang Sewa',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 20.0),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                child: Text('harian',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('mingguan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('bulanan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('3 bulan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('6 bulan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('tahunan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('semua',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kisaran Harga (Rp)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0, top: 18.0),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 205.0,
                                      height: 35.0,
                                      child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          hintText: '',
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Luas Area (meter persegi)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0, top: 18.0),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 148.0,
                                      height: 35.0,
                                      child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          hintText: '',
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kamar Mandi',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              width: 108,
                            ),
                            ElevatedButton(
                              child: Text('dalam',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 121, 121, 121))),
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          side: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 166, 122))))),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            ElevatedButton(
                              child: Text('luar',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 121, 121, 121))),
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          side: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 166, 122))))),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Tipe Kost',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              width: 65,
                            ),
                            ElevatedButton(
                              child: Text('putra',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 121, 121, 121))),
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          side: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 166, 122))))),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            ElevatedButton(
                              child: Text('putri',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 121, 121, 121))),
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          side: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 166, 122))))),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            ElevatedButton(
                              child: Text('putri',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 121, 121, 121))),
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          side: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 166, 122))))),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Tidur',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Mandi',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Form(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, top: 10.0),
                                child: SizedBox(
                                  width: 100.0,
                                  height: 35.0,
                                  child: TextFormField(
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
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      contentPadding: EdgeInsets.symmetric(
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
                                    right: 25.0, top: 10.0),
                                child: SizedBox(
                                  width: 100.0,
                                  height: 35.0,
                                  child: TextFormField(
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
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 15.0),
                                      hintText: '',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            child: Text('Pasang Iklan'),
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 205, 166, 122)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122))))),
                          ),
                        )
                      ],
                    ),
                  ));
        });
  }

  // --- Bottom Sheet Sewakan Tanah ---
  Future Sewakan_Tanah(BuildContext context) {
    final formField = GlobalKey<FormState>();
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isDismissible: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.5,
              maxChildSize: 1,
              expand: false,
              builder: (_, controller) => Container(
                    height: double.infinity,
                    child: ListView(
                      controller: controller,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: formField,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 25.0),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Masukkan lokasi properti";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
                                ),
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                hintText: 'Lokasi Tanah',
                                // suffixIcon: Icon(Icons.search_rounded),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                          child: Text(
                            'Rentang Sewa',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 20.0),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                child: Text('harian',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('mingguan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('bulanan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('3 bulan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('6 bulan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('tahunan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('semua',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kisaran Harga (Rp)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0, top: 18.0),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 205.0,
                                      height: 35.0,
                                      child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          hintText: '',
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Luas Area (meter persegi)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0, top: 18.0),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 147.0,
                                      height: 35.0,
                                      child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          hintText: '',
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Ketinggian (mdpl)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0, top: 18.0),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 215.0,
                                      height: 35.0,
                                      child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          hintText: '',
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            child: Text('Pasang Iklan'),
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 205, 166, 122)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122))))),
                          ),
                        )
                      ],
                    ),
                  ));
        });
  }

  // --- Bottom Sheet Sewakan Apartement ---
  Future Sewakan_Apartement(BuildContext context) {
    final formField = GlobalKey<FormState>();
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isDismissible: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.5,
              maxChildSize: 1,
              expand: false,
              builder: (_, controller) => Container(
                    height: double.infinity,
                    child: ListView(
                      controller: controller,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: formField,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 25.0),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Masukkan lokasi properti";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
                                ),
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                hintText: 'Lokasi Apartement',
                                // suffixIcon: Icon(Icons.search_rounded),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                          child: Text(
                            'Rentang Sewa',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 20.0),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                child: Text('harian',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('mingguan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('bulanan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('3 bulan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('6 bulan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('tahunan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('semua',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kisaran Harga (Rp)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0, top: 18.0),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 205.0,
                                      height: 35.0,
                                      child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          hintText: '',
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Luas Area (meter persegi)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0, top: 18.0),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 147.0,
                                      height: 35.0,
                                      child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          hintText: '',
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Tidur',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Mandi',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Form(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, top: 10.0),
                                child: SizedBox(
                                  width: 100.0,
                                  height: 35.0,
                                  child: TextFormField(
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
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      contentPadding: EdgeInsets.symmetric(
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
                                    right: 25.0, top: 10.0),
                                child: SizedBox(
                                  width: 100.0,
                                  height: 35.0,
                                  child: TextFormField(
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
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 15.0),
                                      hintText: '',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            child: Text('Pasang Iklan'),
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 205, 166, 122)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122))))),
                          ),
                        )
                      ],
                    ),
                  ));
        });
  }

  // --- Bottom Sheet Sewakan Komersil ---
  Future Sewakan_Komersil(BuildContext context) {
    final formField = GlobalKey<FormState>();
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isDismissible: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.5,
              maxChildSize: 1,
              expand: false,
              builder: (_, controller) => Container(
                    height: double.infinity,
                    child: ListView(
                      controller: controller,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: formField,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 25.0),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Masukkan lokasi properti";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
                                ),
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                hintText: 'Lokasi Properti',
                                // suffixIcon: Icon(Icons.search_rounded),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                          child: Text(
                            'Rentang Sewa',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 20.0),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                child: Text('harian',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('mingguan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('bulanan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('3 bulan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('6 bulan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('tahunan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
                                child: Text('semua',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kisaran Harga (Rp)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0, top: 18.0),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 205.0,
                                      height: 35.0,
                                      child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          hintText: '',
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Luas Area (meter persegi)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0, top: 18.0),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 147.0,
                                      height: 35.0,
                                      child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          hintText: '',
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Tidur',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Mandi',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Form(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, top: 10.0),
                                child: SizedBox(
                                  width: 100.0,
                                  height: 35.0,
                                  child: TextFormField(
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
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      contentPadding: EdgeInsets.symmetric(
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
                                    right: 25.0, top: 10.0),
                                child: SizedBox(
                                  width: 100.0,
                                  height: 35.0,
                                  child: TextFormField(
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
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 15.0),
                                      hintText: '',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            child: Text('Pasang Iklan'),
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 205, 166, 122)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122))))),
                          ),
                        )
                      ],
                    ),
                  ));
        });
  }

  // JUAL JUAL JUAL JUAL JUAL JUAL JUAL JUAL JUAL JUAL
  // --- Bottom Sheet Jual Rumah ---
  Future Jual_Rumah(BuildContext context) {
    File _image;
    final picker = ImagePicker();

    Future getImageFromGallery() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        }
      });
    }

    Future getImageFromCamera() async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        }
      });
    }

    Future showOptions() async {
      showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
                actions: [
                  CupertinoActionSheetAction(
                    child: Text('Photo Gallery'),
                    onPressed: () {
                      Navigator.of(context).pop();

                      getImageFromGallery();
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: Text('Camera'),
                    onPressed: () {
                      Navigator.of(context).pop();

                      getImageFromCamera();
                    },
                  )
                ],
              ));
    }

    final formField = GlobalKey<FormState>();
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isDismissible: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.5,
              maxChildSize: 1,
              expand: false,
              builder: (_, controller) => Container(
                    height: double.infinity,
                    child: ListView(
                      controller: controller,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: formField,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 25.0),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Masukkan lokasi properti";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
                                ),
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                hintText: 'Lokasi Rumah',
                                // suffixIcon: Icon(Icons.search_rounded),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kisaran Harga (Rp)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0, top: 18.0),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 205.0,
                                      height: 35.0,
                                      child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          hintText: '',
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Luas Area (meter persegi)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0, top: 18.0),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 147.0,
                                      height: 35.0,
                                      child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          hintText: '',
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Tidur',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Mandi',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Form(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, top: 10.0),
                                child: SizedBox(
                                  width: 100.0,
                                  height: 35.0,
                                  child: TextFormField(
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
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      contentPadding: EdgeInsets.symmetric(
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
                                    right: 25.0, top: 10.0),
                                child: SizedBox(
                                  width: 100.0,
                                  height: 35.0,
                                  child: TextFormField(
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
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 15.0),
                                      hintText: '',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Foto Properti',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 65,
                            ),
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                child: Text('Select Image'),
                                onPressed: showOptions,
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromARGB(255, 205, 166, 122)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            child: Text('Pasang Iklan'),
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 205, 166, 122)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122))))),
                          ),
                        )
                      ],
                    ),
                  ));
        });
  }

  Future Jual_Kost(BuildContext context) {
    File _image;
    final picker = ImagePicker();

    Future getImageFromGallery() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        }
      });
    }

    Future getImageFromCamera() async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        }
      });
    }

    Future showOptions() async {
      showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
                actions: [
                  CupertinoActionSheetAction(
                    child: Text('Photo Gallery'),
                    onPressed: () {
                      Navigator.of(context).pop();

                      getImageFromGallery();
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: Text('Camera'),
                    onPressed: () {
                      Navigator.of(context).pop();

                      getImageFromCamera();
                    },
                  )
                ],
              ));
    }

    final formField = GlobalKey<FormState>();
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isDismissible: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.5,
              maxChildSize: 1,
              expand: false,
              builder: (_, controller) => Container(
                    height: double.infinity,
                    child: ListView(
                      controller: controller,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: formField,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 25.0),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Masukkan lokasi properti";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
                                ),
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                hintText: 'Lokasi Kost',
                                // suffixIcon: Icon(Icons.search_rounded),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kisaran Harga (Rp)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0, top: 18.0),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 205.0,
                                      height: 35.0,
                                      child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          hintText: '',
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Luas Area (meter persegi)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0, top: 18.0),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 148.0,
                                      height: 35.0,
                                      child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          hintText: '',
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kamar Mandi',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              width: 108,
                            ),
                            ElevatedButton(
                              child: Text('dalam',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 121, 121, 121))),
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          side: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 166, 122))))),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            ElevatedButton(
                              child: Text('luar',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 121, 121, 121))),
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          side: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 166, 122))))),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Tipe Kost',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              width: 65,
                            ),
                            ElevatedButton(
                              child: Text('putra',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 121, 121, 121))),
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          side: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 166, 122))))),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            ElevatedButton(
                              child: Text('putri',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 121, 121, 121))),
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          side: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 166, 122))))),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            ElevatedButton(
                              child: Text('putri',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 121, 121, 121))),
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          side: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 166, 122))))),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Tidur',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Mandi',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Form(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, top: 10.0),
                                child: SizedBox(
                                  width: 100.0,
                                  height: 35.0,
                                  child: TextFormField(
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
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      contentPadding: EdgeInsets.symmetric(
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
                                    right: 25.0, top: 10.0),
                                child: SizedBox(
                                  width: 100.0,
                                  height: 35.0,
                                  child: TextFormField(
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
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 15.0),
                                      hintText: '',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Foto Properti',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 65,
                            ),
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                child: Text('Select Image'),
                                onPressed: showOptions,
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromARGB(255, 205, 166, 122)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            child: Text('Pasang Iklan'),
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 205, 166, 122)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122))))),
                          ),
                        )
                      ],
                    ),
                  ));
        });
  }

  Future Jual_Tanah(
    BuildContext context,
  ) {
    
    File _image;
    final picker = ImagePicker();

    Future getImageFromGallery() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        }
      });
    }

    Future getImageFromCamera() async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        }
      });
    }

    Future showOptions() async {
      showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
                actions: [
                  CupertinoActionSheetAction(
                    child: Text('Photo Gallery'),
                    onPressed: () {
                      Navigator.of(context).pop();

                      getImageFromGallery();
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: Text('Camera'),
                    onPressed: () {
                      Navigator.of(context).pop();

                      getImageFromCamera();
                    },
                  )
                ],
              ));
    }

    final formField = GlobalKey<FormState>();
    
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isDismissible: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.5,
              maxChildSize: 1,
              expand: false,
              builder: (_, controller) => Container(
                    height: double.infinity,
                    child: ListView(
                      controller: controller,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        
                        Form(
                          key: formField,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 25.0),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Masukkan lokasi properti";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
                                ),
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                hintText: 'Lokasi Tanah',
                                // suffixIcon: Icon(Icons.search_rounded),
                              ),
                            ),
                          ),
                        ),

                        // Text('list1: $list_JualTanah.join("")'),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kisaran Harga (Rp)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0, top: 18.0),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 205.0,
                                      height: 35.0,
                                      child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          hintText: '',
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Luas Area (meter persegi)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0, top: 18.0),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 147.0,
                                      height: 35.0,
                                      child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          hintText: '',
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Ketinggian (mdpl)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0, top: 18.0),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 215.0,
                                      height: 35.0,
                                      child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          hintText: '',
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Foto Properti',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 65,
                            ),
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                child: Text('Select Image'),
                                onPressed: showOptions,
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromARGB(255, 205, 166, 122)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            child: Text('Pasang Iklan'),
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 205, 166, 122)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122))))),
                          ),
                        )
                      ],
                    ),
                  ));
        });
  }

  Future Jual_Apartement(BuildContext context) {
    File _image;
    final picker = ImagePicker();

    Future getImageFromGallery() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        }
      });
    }

    Future getImageFromCamera() async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        }
      });
    }

    Future showOptions() async {
      showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
                actions: [
                  CupertinoActionSheetAction(
                    child: Text('Photo Gallery'),
                    onPressed: () {
                      Navigator.of(context).pop();

                      getImageFromGallery();
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: Text('Camera'),
                    onPressed: () {
                      Navigator.of(context).pop();

                      getImageFromCamera();
                    },
                  )
                ],
              ));
    }

    final formField = GlobalKey<FormState>();
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isDismissible: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.5,
              maxChildSize: 1,
              expand: false,
              builder: (_, controller) => Container(
                    height: double.infinity,
                    child: ListView(
                      controller: controller,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: formField,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 25.0),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Masukkan lokasi properti";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
                                ),
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                hintText: 'Lokasi Rumah',
                                // suffixIcon: Icon(Icons.search_rounded),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kisaran Harga (Rp)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0, top: 18.0),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 205.0,
                                      height: 35.0,
                                      child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          hintText: '',
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Luas Area (meter persegi)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0, top: 18.0),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 147.0,
                                      height: 35.0,
                                      child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          hintText: '',
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Tidur',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Mandi',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Form(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, top: 10.0),
                                child: SizedBox(
                                  width: 100.0,
                                  height: 35.0,
                                  child: TextFormField(
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
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      contentPadding: EdgeInsets.symmetric(
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
                                    right: 25.0, top: 10.0),
                                child: SizedBox(
                                  width: 100.0,
                                  height: 35.0,
                                  child: TextFormField(
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
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 15.0),
                                      hintText: '',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Foto Properti',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 65,
                            ),
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                child: Text('Select Image'),
                                onPressed: showOptions,
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromARGB(255, 205, 166, 122)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            child: Text('Pasang Iklan'),
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 205, 166, 122)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122))))),
                          ),
                        )
                      ],
                    ),
                  ));
        });
  }

  Future Jual_Komersil(BuildContext context) {
    File? _image;
    final picker = ImagePicker();

    Future getImageFromGallery() async {
      // final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      setState(() {
        // if (pickedFile != null) {
        //   _image = File(pickedFile.path);
        // }
        if (pickedFile == null) return;
        _image = File(pickedFile.path);
      });
    }

    Future getImageFromCamera() async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        }
      });
    }

    Future showOptions() async {
      showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
                actions: [
                  CupertinoActionSheetAction(
                    child: Text('Photo Gallery'),
                    onPressed: () {
                      Navigator.of(context).pop();

                      getImageFromGallery();
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: Text('Camera'),
                    onPressed: () {
                      Navigator.of(context).pop();

                      getImageFromCamera();
                    },
                  )
                ],
              ));
    }

    final formField = GlobalKey<FormState>();
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isDismissible: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.5,
              maxChildSize: 1,
              expand: false,
              builder: (_, controller) => Container(
                    height: double.infinity,
                    child: ListView(
                      controller: controller,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: formField,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 25.0),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Masukkan lokasi properti";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
                                ),
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                hintText: 'Lokasi Rumah',
                                // suffixIcon: Icon(Icons.search_rounded),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kisaran Harga (Rp)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0, top: 18.0),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 205.0,
                                      height: 35.0,
                                      child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          hintText: '',
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Luas Area (meter persegi)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 10.0, top: 18.0),
                              child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 147.0,
                                      height: 35.0,
                                      child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 15.0),
                                          hintText: '',
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Tidur',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Mandi',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Form(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 25.0, top: 10.0),
                                child: SizedBox(
                                  width: 100.0,
                                  height: 35.0,
                                  child: TextFormField(
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
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      contentPadding: EdgeInsets.symmetric(
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
                                    right: 25.0, top: 10.0),
                                child: SizedBox(
                                  width: 100.0,
                                  height: 35.0,
                                  child: TextFormField(
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
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 15.0),
                                      hintText: '',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Divider(
                          color: Color.fromARGB(255, 184, 184, 184),
                          thickness: 1.0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Foto Properti',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 65,
                            ),
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                child: Text('Select Image'),
                                onPressed: showOptions,
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromARGB(255, 205, 166, 122)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        _image != null
                            ? Image.file(
                                _image!,
                                width: 150,
                                height: 150,
                              )
                            : Text(
                                'Pilih Foto Properti',
                                textAlign: TextAlign.center,
                              ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            child: Text('Pasang Iklan'),
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 205, 166, 122)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122))))),
                          ),
                        )
                      ],
                    ),
                  ));
        });
  }
}
