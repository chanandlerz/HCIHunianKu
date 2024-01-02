import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_development/connection.dart';

Connection connection = Connection();

class DetailPage extends StatefulWidget {
  final int id;

  DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isPressedFavorite = false;
  late List<String> favorites;

  //var detailPropertyData;

  late List<dynamic> detailPropertyData = [];

  @override
  void initState() {
    super.initState();
    isPressedFavorite = false;
    favorites = [];
    fetchDetailProperty();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    favorites = prefs.getStringList('favorites') ?? [];

    setState(() {
      isPressedFavorite = favorites.contains(widget.id.toString());
    });
  }

  Future<void> activeFavorite() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //final List<String>? favorites = prefs.getStringList('favorites');
    setState(() {
      List<String> updatedFavorites = List.from(favorites);
      if (isPressedFavorite) {
        isPressedFavorite = false;
        if (updatedFavorites.contains(widget.id.toString())) {
          updatedFavorites.remove(widget.id.toString());
          //updatedFavorites.remove("46");
          print(widget.id.toString() + " removed from favorites");
        }
      } else {
        isPressedFavorite = true;
        if (!updatedFavorites.contains(widget.id.toString())) {
          //prefs.setStringList('favorites', <String>[widget.id.toString()]);
          updatedFavorites.add(widget.id.toString());
          print(widget.id.toString() + " added to favorites");
        }
      }
      prefs.setStringList('favorites', updatedFavorites);
      favorites = updatedFavorites;

      print(favorites);
    });
  }

  Future fetchDetailProperty() async {
    final Uri url = Uri.http(connection.url, 'detailProperty');
    // String udid = await FlutterUdid.udid;
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        // 'udid': udid,
        'id': widget.id,
      }),
    );

    if (response.statusCode == 200) {
      print('Data fetched successfuly');
      setState(() {
        detailPropertyData = jsonDecode(response.body);
        print(detailPropertyData);
      });
    } else {
      print('Failed to fetch data. Status Code: ${response.statusCode}');
      print('Error Response: ${response.body}');
    }
  }

  String nullCheck(var value) {
    if (value == null || value == "") {
      return value = "-";
    } else {
      return value.toString();
    }
  }

  bool imageCheck(var value) {
    if (value == null || value == "") {
      return false;
    } else {
      return true;
    }
  }

  bool isKost(var value) {
    if (value == "Kost") {
      return true;
    } else {
      return false;
    }
  }

  bool isTanah(var value) {
    if (value == "Tanah") {
      return true;
    } else {
      return false;
    }
  }

  bool isSewa(var value) {
    if (value == "Sewa") {
      return true;
    } else {
      return false;
    }
  }

  String priceHandler(var value) {
    if (value == null || value == "") {
      return "-";
    } else {
      List<String> digits = value.toString().split('').reversed.toList();
      List<String> newDigits = [];

      for (int i = 0; i < digits.length; i++) {
        if ((i + 1) % 3 == 0 && i + 1 != digits.length) {
          newDigits.add(digits[i]);
          newDigits.add('.');
        } else {
          newDigits.add(digits[i]);
        }
      }

      String newNum = newDigits.reversed.join('');
      return newNum;
    }
  }

  _launchURL() async {
    String whatsAppLink = 'https://wa.me/+62' +
        detailPropertyData[17].toString().substring(1) +
        '?text=Halo%20saya%20tertarik%20dengan%20properti%20anda%20di%20HunianKu.';
    print(whatsAppLink);
    Uri _url = Uri.parse(whatsAppLink);
    if (await launchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    if (detailPropertyData.length > 0) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 58, 58, 58),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded),
              color: Color.fromARGB(255, 205, 166, 122),
              onPressed: () {},
            ),
            title: Text(
              'Detail Properti',
              style: TextStyle(color: Color.fromARGB(255, 205, 166, 122)),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 58, 58, 58),
          body: ListView(
            children: [
              // Padding(
              //   padding: EdgeInsets.only(top: 5),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     // crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Wrap(
              //         children: [
              //           IconButton(
              //             icon: Icon(Icons.arrow_back_ios_new_rounded),
              //             color: Color.fromARGB(255, 205, 166, 122),
              //             onPressed: () {},
              //           ),
              //           Padding(
              //             padding: EdgeInsets.only(top: 14),
              //             child: Text(
              //               'Detail Properti',
              //               style: TextStyle(
              //                   fontSize: 20,
              //                   color: Color.fromARGB(255, 205, 166, 122)),
              //             ),
              //           )
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // const Divider(
              //   color: Color.fromARGB(255, 184, 184, 184),
              //   thickness: 1.0,
              // ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        nullCheck(detailPropertyData[3]) +
                            " di" +
                            nullCheck(detailPropertyData[2]),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 205, 166, 122))),
                    Wrap(
                      children: [
                        Text(
                          priceHandler(detailPropertyData[5].toString()),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 205, 166, 122)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        //'Tokyo, Jepang',
                        nullCheck(detailPropertyData[4]),
                        style: TextStyle(
                          color: Color.fromARGB(255, 205, 166, 122),
                        ),
                      ),
                      Wrap(
                        children: [
                          Icon(
                            Icons.watch_later_rounded,
                            color: Color.fromARGB(255, 184, 184, 184),
                            size: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              //'3 minggu yang lalu',
                              nullCheck(detailPropertyData[14]),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 184, 184, 184)),
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          // height: 210,
                          width: screenWidth,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          // margin: EdgeInsets.only(left: 10, right: 10),
                          child: imageCheck(detailPropertyData[13])
                              ? Image.memory(
                                  Base64Codec().decode(detailPropertyData[13]),
                                  // height: 210,
                                  // width: 250,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/noImageAvailable.png',
                                  height: 210,
                                  width: 250,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      // Column(
                      //   children: [
                      //     InkWell(
                      //       onTap: () {},
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(20)),
                      //         margin: EdgeInsets.only(left: 10),
                      //         child: Image.asset(
                      //           'assets/property 1.png',
                      //           height: 100,
                      //           width: 130,
                      //           fit: BoxFit.cover,
                      //         ),
                      //       ),
                      //     ),
                      //     InkWell(
                      //       onTap: () {},
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(20)),
                      //         margin: EdgeInsets.only(left: 10, top: 10),
                      //         child: Image.asset(
                      //           'assets/property 1.png',
                      //           height: 100,
                      //           width: 130,
                      //           fit: BoxFit.cover,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // )
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 20, right: 10),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deskripsi Properti',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 205, 166, 122)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        nullCheck(detailPropertyData[16]),
                        //'Tidak main-main dengan fasilitas dan penawarannya, apartemen cantik dan stylish dengan dua kamar tidur di pusat kota ini merupakan tempat yang tepat bagi siapa pun yang ingin merasakan tinggal di pusat {location}. Terletak di dekat {things nearby}, area hunian kontemporer ini didesain dan didekorasi dalam gaya lokal, sehingga membuat Anda serasa berada di rumah - WiFi berkecepatan tinggi, Netflix, mesin cuci dan pengering, tempat tidur ukuran queen, dapur lengkap, dan bahkan peralatan makan hasil kerajinan, serta {amenities}.\n\nTamu dapat menikmati (x) kamar tidur dan (x) kamar mandi serta ruang bersama dengan pemandangan {view}.  Untuk tidur yang berkualitas, akomodasi ini menyediakan kasur yang nyaman dengan seprai mewah. Nikmati pemandangan langit luar biasa {city} saat pagi atau pun malam hari. Semua kamar mandi dilengkapi dengan sampo berkualitas, handuk tebal, dan semua keperluan mandi sehingga Anda tidak perlu repot membeli di toko.\n\nNikmati sarapan panas setiap pagi di balkon dengan meja dan kursi kecil yang tersedia atau cobalah berjalan-jalan ke sekitar dan mencoba kedai kopi dan restoran yang ada. Berjalan-jalan di malam hari juga aman karena bar tetap buka hingga tengah malam, atau jelajahi {city} dengan naik kereta dari {station name} yang hanya {distance} menit dengan berjalan kaki dari akomodasi.',

                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 205, 166, 122)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 50, right: 10),
                child: Text(
                  'Facts and Features',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 205, 166, 122)),
                ),
              ),
              Column(
                children: [
                  if (isSewa(detailPropertyData[2]))
                    //Rentang Sewa
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.white,
                                )),
                            child: Icon(
                              Icons.watch_later_rounded,
                              color: Color.fromARGB(255, 205, 166, 122),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Rentang Sewa',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: const Color.fromARGB(
                                          255, 205, 166, 122)),
                                ),
                                Text(
                                  // 'Bulanan',
                                  nullCheck(detailPropertyData[12]),
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  // Luas Area
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: Colors.white,
                              )),
                          child: Icon(
                            Icons.fullscreen_rounded,
                            color: Color.fromARGB(255, 205, 166, 122),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Luas Area',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 205, 166, 122)),
                              ),
                              Text(
                                //'200 m²',
                                nullCheck(detailPropertyData[6]),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 205, 166, 122)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isTanah(detailPropertyData[3]))
                    //Ketinggian
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.white,
                                )),
                            child: Icon(
                              Icons.expand,
                              color: Color.fromARGB(255, 205, 166, 122),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Ketinggian',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                Text(
                                  //'200 (mdpl)',
                                  nullCheck(detailPropertyData[11]),
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (isKost(nullCheck(detailPropertyData[3])))
                    //Tipe Kost
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.white,
                                )),
                            child: Icon(
                              Icons.wc_rounded,
                              color: Color.fromARGB(255, 205, 166, 122),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Tipe Kost',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                Text(
                                  //'Campur',
                                  nullCheck(detailPropertyData[10]),
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (isKost(nullCheck(detailPropertyData[3])))
                    //Tipe Kamar Mandi
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.white,
                                )),
                            child: Icon(
                              Icons.bathtub_rounded,
                              color: Color.fromARGB(255, 205, 166, 122),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Tipe Kamar Mandi',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                Text(
                                  nullCheck(detailPropertyData[8]),
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (!isTanah(nullCheck(detailPropertyData[3])))

                    //Kamar Tidur
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.white,
                                )),
                            child: Icon(
                              Icons.bed,
                              color: Color.fromARGB(255, 205, 166, 122),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Kamar Tidur',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                Text(
                                  nullCheck(detailPropertyData[7]),
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (!isTanah(nullCheck(detailPropertyData[3])))

                    //Kamar Mandi
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.white,
                                )),
                            child: Icon(
                              Icons.bathtub_rounded,
                              color: Color.fromARGB(255, 205, 166, 122),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Kamar Mandi',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                Text(
                                  nullCheck(detailPropertyData[8]),
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),

              //username and profile
              Padding(
                padding: EdgeInsets.only(left: 10, top: 50),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: CircleAvatar(
                        child: ClipOval(
                          child:
                              // Image.asset(
                              //   'assets/profile1.jpg',
                              //   fit: BoxFit.cover,
                              // ),
                              imageCheck(detailPropertyData[19])
                                  ? Image.memory(
                                      Base64Codec()
                                          .decode(detailPropertyData[19]),
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 100,
                                    )
                                  : Image.asset(
                                      'assets/noProfile.png',
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 100,
                                    ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            // '@memories',
                            '@' + nullCheck(detailPropertyData[18]),
                            style: TextStyle(
                                color: Color.fromARGB(255, 205, 166, 122),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          bottomNavigationBar: BottomAppBar(
              height: 60,
              color: Color.fromARGB(255, 58, 58, 58),
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      children: [
                        IconButton(
                          icon: Icon(
                            isPressedFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            color: isPressedFavorite
                                ? Colors.pink
                                : Color.fromARGB(255, 205, 166, 122),
                          ),
                          // style: ButtonStyle(
                          //     backgroundColor: MaterialStateProperty.all<Color>(
                          //         isPressedFavorite
                          //             ? Colors.pink
                          //             : Color.fromARGB(255, 205, 166, 122))),
                          onPressed: activeFavorite,
                        ),
                        IconButton(
                          icon: Icon(Icons.share_rounded),
                          color: Color.fromARGB(255, 205, 166, 122),
                          onPressed: () {},
                        )
                      ],
                    ),
                    InkWell(
                      onTap: _launchURL,
                      child: ElevatedButton(
                        child: Text('Hubungi Penjual'),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 205, 166, 122))),
                        onPressed: _launchURL,
                      ),
                    )
                  ],
                ),
              )),
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
