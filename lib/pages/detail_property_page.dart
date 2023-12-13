import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isPressedFavorite = false;

  void activeFavorite() {
    setState(() {
      if (isPressedFavorite) {
        isPressedFavorite = false;
      } else {
        isPressedFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
                  Text('Rumah Dijual',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color.fromARGB(255, 205, 166, 122))),
                  Wrap(
                    children: [
                      Text(
                        'RP 10 Miliar',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
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
                      'Tokyo, Jepang',
                      style: TextStyle(
                        color: Color.fromARGB(255, 205, 166, 122),
                        fontSize: 15,
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
                            '3 minggu yang lalu',
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        // margin: EdgeInsets.only(left: 10, right: 10),
                        child: Image.asset(
                          'assets/property 1.png',
                          height: 210,
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            margin: EdgeInsets.only(left: 10),
                            child: Image.asset(
                              'assets/property 1.png',
                              height: 100,
                              width: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            margin: EdgeInsets.only(left: 10, top: 10),
                            child: Image.asset(
                              'assets/property 1.png',
                              height: 100,
                              width: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 20, right: 10),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deskripsi',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 205, 166, 122)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Tidak main-main dengan fasilitas dan penawarannya, apartemen cantik dan stylish dengan dua kamar tidur di pusat kota ini merupakan tempat yang tepat bagi siapa pun yang ingin merasakan tinggal di pusat {location}. Terletak di dekat {things nearby}, area hunian kontemporer ini didesain dan didekorasi dalam gaya lokal, sehingga membuat Anda serasa berada di rumah - WiFi berkecepatan tinggi, Netflix, mesin cuci dan pengering, tempat tidur ukuran queen, dapur lengkap, dan bahkan peralatan makan hasil kerajinan, serta {amenities}.\n\nTamu dapat menikmati (x) kamar tidur dan (x) kamar mandi serta ruang bersama dengan pemandangan {view}.  Untuk tidur yang berkualitas, akomodasi ini menyediakan kasur yang nyaman dengan seprai mewah. Nikmati pemandangan langit luar biasa {city} saat pagi atau pun malam hari. Semua kamar mandi dilengkapi dengan sampo berkualitas, handuk tebal, dan semua keperluan mandi sehingga Anda tidak perlu repot membeli di toko.\n\nNikmati sarapan panas setiap pagi di balkon dengan meja dan kursi kecil yang tersedia atau cobalah berjalan-jalan ke sekitar dan mencoba kedai kopi dan restoran yang ada. Berjalan-jalan di malam hari juga aman karena bar tetap buka hingga tengah malam, atau jelajahi {city} dengan naik kereta dari {station name} yang hanya {distance} menit dengan berjalan kaki dari akomodasi.',
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
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
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
                              Icons.maps_home_work_rounded,
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
                                  'Tahun Dibangun',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                Text(
                                  '2004',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Wrap(
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
                                  '2',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10, right: 56),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
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
                              Icons.garage_rounded,
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
                                  '3',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Wrap(
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
                              Icons.garage,
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
                                  'Garasi',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 205, 166, 122)),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
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
                        icon: Icon(isPressedFavorite
                            ? Icons.favorite_border_rounded
                            : Icons.favorite_rounded),
                        color: isPressedFavorite
                            ? Color.fromARGB(255, 205, 166, 122)
                            : Colors.pink,
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
                  ElevatedButton(
                    child: Text('Hubungi Penjual'),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 205, 166, 122))),
                    onPressed: () {},
                  )
                ],
              ),
            )),
      ),
    );
  }
}
