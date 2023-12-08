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
  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController luasController = TextEditingController();
  final TextEditingController jumlahKamarTidurController =
      TextEditingController();
  final TextEditingController jumlahKamarMandiController =
      TextEditingController();
  final TextEditingController ketinggianController = TextEditingController();

  bool isPressedJual = false;
  bool isPressedSewa = false;
  bool isPressedTanah = false;
  bool isPressedRumah = false;
  bool isPressedApartement = false;
  bool isPressedKost = false;
  bool isPressedKomersil = false;

  void activeJual() {
    setState(() {
      if (isPressedJual) {
        isPressedJual = false;
      } else {
        isPressedJual = true;
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
        isPressedJual = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 58, 58, 58),
      body: ListView(
        children: <Widget>[
          Row(
            children: [
              IconButton(
                color: const Color.fromARGB(255, 205, 166, 122),
                icon: const Icon(Icons.arrow_back_ios_rounded),
                onPressed: () {},
              ),
              const SizedBox(
                width: 50,
              ),
              const Text(
                'Properti apa yang anda jual?',
                style: TextStyle(
                    color: Color.fromARGB(255, 205, 166, 122), fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 150,
                height: 35,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(isPressedJual
                          ? Colors.white
                          : const Color.fromARGB(255, 205, 166, 122))),
                  onPressed: activeJual,
                  child: Text(
                    'Jual',
                    style: isPressedJual
                        ? const TextStyle(color: Color.fromARGB(255, 205, 166, 122))
                        : const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 150,
                height: 35,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(isPressedSewa
                          ? Colors.white
                          : const Color.fromARGB(255, 205, 166, 122))),
                  onPressed: activeSewa,
                  child: Text(
                    'Sewa',
                    style: isPressedSewa
                        ? const TextStyle(color: Color.fromARGB(255, 205, 166, 122))
                        : const TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 35,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isPressedTanah
                          ? Colors.white
                          : const Color.fromARGB(255, 205, 166, 122),
                    ),
                    onPressed: activeTanah,
                    child: Text(
                      'Tanah',
                      style: isPressedTanah
                          ? const TextStyle(color: Color.fromARGB(255, 205, 166, 122))
                          : const TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 150,
                height: 35,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isPressedRumah
                          ? Colors.white
                          : const Color.fromARGB(255, 205, 166, 122),
                    ),
                    onPressed: activeRumah,
                    child: Text(
                      'Rumah',
                      style: isPressedRumah
                          ? const TextStyle(color: Color.fromARGB(255, 205, 166, 122))
                          : const TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 150,
                height: 35,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isPressedApartement
                          ? Colors.white
                          : const Color.fromARGB(255, 205, 166, 122),
                    ),
                    onPressed: activeApartement,
                    child: Text(
                      'Apartement',
                      style: isPressedApartement
                          ? const TextStyle(color: Color.fromARGB(255, 205, 166, 122))
                          : const TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 150,
                height: 35,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isPressedKost
                          ? Colors.white
                          : const Color.fromARGB(255, 205, 166, 122),
                    ),
                    onPressed: activeKost,
                    child: Text(
                      'Kost',
                      style: isPressedKost
                          ? const TextStyle(color: Color.fromARGB(255, 205, 166, 122))
                          : const TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 150,
                height: 35,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isPressedKomersil
                          ? Colors.white
                          : const Color.fromARGB(255, 205, 166, 122),
                    ),
                    onPressed: activeKomersil,
                    child: Text(
                      'Komersil',
                      style: isPressedKomersil
                          ? const TextStyle(color: Color.fromARGB(255, 205, 166, 122))
                          : const TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                if (isPressedJual == true && isPressedTanah == true) {
                  Jual_Tanah(context);
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
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.5,
              maxChildSize: 1,
              expand: false,
              builder: (_, controller) => SizedBox(
                    height: double.infinity,
                    child: ListView(
                      controller: controller,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: formField,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 25.0),
                            child: TextFormField(
                              controller: lokasiController,
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
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 20.0),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('harian',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('mingguan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('bulanan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('3 bulan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('6 bulan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('tahunan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('semua',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
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
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kisaran Harga (Rp)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Luas Area (meter persegi)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
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
                              padding:
                                  EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Tidur',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: 10.0, top: 10.0),
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
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
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
                                    right: 25.0, top: 10.0),
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
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
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
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(255, 205, 166, 122)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122))))),
                            child: const Text('Pasang Iklan'),
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
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.5,
              maxChildSize: 1,
              expand: false,
              builder: (_, controller) => SizedBox(
                    height: double.infinity,
                    child: ListView(
                      controller: controller,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: formField,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 25.0),
                            child: TextFormField(
                              controller: lokasiController,
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
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 20.0),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('harian',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('mingguan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('bulanan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('3 bulan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('6 bulan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('tahunan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('semua',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
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
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kisaran Harga (Rp)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Luas Area (meter persegi)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kamar Mandi',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
                              width: 108,
                            ),
                            ElevatedButton(
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
                                          side: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 166, 122))))),
                              child: const Text('dalam',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 121, 121, 121))),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            ElevatedButton(
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
                                          side: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 166, 122))))),
                              child: const Text('luar',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 121, 121, 121))),
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
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
                              width: 65,
                            ),
                            ElevatedButton(
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
                                          side: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 166, 122))))),
                              child: const Text('putra',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 121, 121, 121))),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            ElevatedButton(
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
                                          side: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 166, 122))))),
                              child: const Text('putri',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 121, 121, 121))),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            ElevatedButton(
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
                                          side: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 166, 122))))),
                              child: const Text('putri',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 121, 121, 121))),
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
                              padding:
                                  EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Tidur',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: 10.0, top: 10.0),
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
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
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
                                    right: 25.0, top: 10.0),
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
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
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
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(255, 205, 166, 122)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122))))),
                            child: const Text('Pasang Iklan'),
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
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.5,
              maxChildSize: 1,
              expand: false,
              builder: (_, controller) => SizedBox(
                    height: double.infinity,
                    child: ListView(
                      controller: controller,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: formField,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 25.0),
                            child: TextFormField(
                              controller: lokasiController,
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
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 20.0),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('harian',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('mingguan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('bulanan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('3 bulan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('6 bulan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('tahunan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('semua',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
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
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kisaran Harga (Rp)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Luas Area (meter persegi)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Ketinggian (mdpl)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
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
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(255, 205, 166, 122)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122))))),
                            child: const Text('Pasang Iklan'),
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
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.5,
              maxChildSize: 1,
              expand: false,
              builder: (_, controller) => SizedBox(
                    height: double.infinity,
                    child: ListView(
                      controller: controller,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: formField,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 25.0),
                            child: TextFormField(
                              controller: lokasiController,
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
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 20.0),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('harian',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('mingguan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('bulanan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('3 bulan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('6 bulan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('tahunan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('semua',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
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
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kisaran Harga (Rp)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Luas Area (meter persegi)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
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
                              padding:
                                  EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Tidur',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: 10.0, top: 10.0),
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
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
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
                                    right: 25.0, top: 10.0),
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
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
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
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(255, 205, 166, 122)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122))))),
                            child: const Text('Pasang Iklan'),
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
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.5,
              maxChildSize: 1,
              expand: false,
              builder: (_, controller) => SizedBox(
                    height: double.infinity,
                    child: ListView(
                      controller: controller,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: formField,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 25.0),
                            child: TextFormField(
                              controller: lokasiController,
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
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 20.0),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('harian',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('mingguan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('bulanan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('3 bulan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('6 bulan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('tahunan',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButton(
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
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('semua',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 121, 121, 121))),
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
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kisaran Harga (Rp)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Luas Area (meter persegi)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
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
                              padding:
                                  EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Tidur',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: 10.0, top: 10.0),
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
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
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
                                    right: 25.0, top: 10.0),
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
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
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
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(255, 205, 166, 122)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122))))),
                            child: const Text('Pasang Iklan'),
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
    File image;
    final picker = ImagePicker();

    Future getImageFromGallery() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          image = File(pickedFile.path);
        }
      });
    }

    Future getImageFromCamera() async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      setState(() {
        if (pickedFile != null) {
          image = File(pickedFile.path);
        }
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
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isDismissible: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.5,
              maxChildSize: 1,
              expand: false,
              builder: (_, controller) => SizedBox(
                    height: double.infinity,
                    child: ListView(
                      controller: controller,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: formField,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 25.0),
                            child: TextFormField(
                              controller: lokasiController,
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
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kisaran Harga (Rp)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Luas Area (meter persegi)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
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
                              padding:
                                  EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Tidur',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: 10.0, top: 10.0),
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
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
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
                                    right: 25.0, top: 10.0),
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
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Foto Properti',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 65,
                            ),
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: showOptions,
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color.fromARGB(255, 205, 166, 122)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('Select Image'),
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
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(255, 205, 166, 122)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122))))),
                            child: const Text('Pasang Iklan'),
                          ),
                        )
                      ],
                    ),
                  ));
        });
  }

  Future Jual_Kost(BuildContext context) {
    File image;
    final picker = ImagePicker();

    Future getImageFromGallery() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          image = File(pickedFile.path);
        }
      });
    }

    Future getImageFromCamera() async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      setState(() {
        if (pickedFile != null) {
          image = File(pickedFile.path);
        }
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
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isDismissible: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.5,
              maxChildSize: 1,
              expand: false,
              builder: (_, controller) => SizedBox(
                    height: double.infinity,
                    child: ListView(
                      controller: controller,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: formField,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 25.0),
                            child: TextFormField(
                              controller: lokasiController,
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
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kisaran Harga (Rp)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Luas Area (meter persegi)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kamar Mandi',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
                              width: 108,
                            ),
                            ElevatedButton(
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
                                          side: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 166, 122))))),
                              child: const Text('dalam',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 121, 121, 121))),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            ElevatedButton(
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
                                          side: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 166, 122))))),
                              child: const Text('luar',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 121, 121, 121))),
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
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
                              width: 65,
                            ),
                            ElevatedButton(
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
                                          side: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 166, 122))))),
                              child: const Text('putra',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 121, 121, 121))),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            ElevatedButton(
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
                                          side: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 166, 122))))),
                              child: const Text('putri',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 121, 121, 121))),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            ElevatedButton(
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
                                          side: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 205, 166, 122))))),
                              child: const Text('putri',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 121, 121, 121))),
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
                              padding:
                                  EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Tidur',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: 10.0, top: 10.0),
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
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
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
                                    right: 25.0, top: 10.0),
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
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Foto Properti',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 65,
                            ),
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: showOptions,
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color.fromARGB(255, 205, 166, 122)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('Select Image'),
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
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(255, 205, 166, 122)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122))))),
                            child: const Text('Pasang Iklan'),
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
    File image;
    final picker = ImagePicker();

    Future getImageFromGallery() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          image = File(pickedFile.path);
        }
      });
    }

    Future getImageFromCamera() async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      setState(() {
        if (pickedFile != null) {
          image = File(pickedFile.path);
        }
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
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isDismissible: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.5,
              maxChildSize: 1,
              expand: false,
              builder: (_, controller) => SizedBox(
                    height: double.infinity,
                    child: ListView(
                      controller: controller,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),

                        Form(
                          key: formField,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 25.0),
                            child: TextFormField(
                              controller: lokasiController,
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
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kisaran Harga (Rp)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Luas Area (meter persegi)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Ketinggian (mdpl)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
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
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Foto Properti',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 65,
                            ),
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: showOptions,
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color.fromARGB(255, 205, 166, 122)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('Select Image'),
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
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(255, 205, 166, 122)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122))))),
                            child: const Text('Pasang Iklan'),
                          ),
                        )
                      ],
                    ),
                  ));
        });
  }

  Future Jual_Apartement(BuildContext context) {
    File image;
    final picker = ImagePicker();

    Future getImageFromGallery() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          image = File(pickedFile.path);
        }
      });
    }

    Future getImageFromCamera() async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      setState(() {
        if (pickedFile != null) {
          image = File(pickedFile.path);
        }
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
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isDismissible: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.5,
              maxChildSize: 1,
              expand: false,
              builder: (_, controller) => SizedBox(
                    height: double.infinity,
                    child: ListView(
                      controller: controller,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: formField,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 25.0),
                            child: TextFormField(
                              controller: lokasiController,
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
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kisaran Harga (Rp)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Luas Area (meter persegi)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
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
                              padding:
                                  EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Tidur',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: 10.0, top: 10.0),
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
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
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
                                    right: 25.0, top: 10.0),
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
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Foto Properti',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 65,
                            ),
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: showOptions,
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color.fromARGB(255, 205, 166, 122)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('Select Image'),
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
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(255, 205, 166, 122)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122))))),
                            child: const Text('Pasang Iklan'),
                          ),
                        )
                      ],
                    ),
                  ));
        });
  }

  Future Jual_Komersil(BuildContext context) {
    File? image;
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
        image = File(pickedFile.path);
      });
    }

    Future getImageFromCamera() async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      setState(() {
        if (pickedFile != null) {
          image = File(pickedFile.path);
        }
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
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isDismissible: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 0.5,
              maxChildSize: 1,
              expand: false,
              builder: (_, controller) => SizedBox(
                    height: double.infinity,
                    child: ListView(
                      controller: controller,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: formField,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 25.0),
                            child: TextFormField(
                              controller: lokasiController,
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
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Kisaran Harga (Rp)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Luas Area (meter persegi)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade400),
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
                              padding:
                                  EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                'Jumlah Kamar Tidur',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: 10.0, top: 10.0),
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
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
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
                                    right: 25.0, top: 10.0),
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
                                            color: Color.fromARGB(
                                                255, 205, 166, 122)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Foto Properti',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 65,
                            ),
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: showOptions,
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color.fromARGB(255, 205, 166, 122)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 205, 166, 122))))),
                                child: const Text('Select Image'),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        image != null
                            ? Image.file(
                                image!,
                                width: 150,
                                height: 150,
                              )
                            : const Text(
                                'Pilih Foto Properti',
                                textAlign: TextAlign.center,
                              ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(255, 205, 166, 122)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 205, 166, 122))))),
                            child: const Text('Pasang Iklan'),
                          ),
                        )
                      ],
                    ),
                  ));
        });
  }
}