import 'package:app_development/pages/compare.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
//import 'package:app_development/pages/pick_favorites_page.dart';

class Pick1FromFavoritesWidget extends StatefulWidget {
  final List<dynamic> favoritesData;
  const Pick1FromFavoritesWidget({Key? key, required this.favoritesData})
      : super(key: key);

  @override
  State<Pick1FromFavoritesWidget> createState() =>
      _Pick1FromFavoritesWidgetState();
}

class _Pick1FromFavoritesWidgetState extends State<Pick1FromFavoritesWidget> {
  //favoritesData = widget.favorites;
  late List<dynamic> favoritesData;

  @override
  void initState() {
    super.initState();
    //favorites = favorites;
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

  String priceHandler(var value) {
    if (value == null || value == "") {
      return "-";
    } else {
      value = value.toString().substring(2);
      double number = double.parse(value);
      if (number >= 1000000000) {
        number = number / 1000000000;
        String number2 = number.toStringAsFixed(1);
        String price = number2 + " Miliar";
        return price;
      } else if (number >= 1000000) {
        number = number / 1000000;
        String number2 = number.toStringAsFixed(1);
        String price = number2 + " Juta";
        return price;
      } else if (number >= 1000) {
        number = number / 1000;
        String number2 = number.toStringAsFixed(1);
        String price = number2 + " Ribu";
        return price;
      } else {
        return value.toString();
      }
    }
  }

  // _launchURL() async {
  //   String whatsAppLink = 'https://wa.me/+62' +
  //       favoritesData[i][17].toString().substring(1) +
  //       '?text=Halo%20saya%20tertarik%20dengan%20properti%20anda%20di%20HunianKu.';
  //   print(whatsAppLink);
  //   Uri _url = Uri.parse(whatsAppLink);
  //   if (await launchUrl(_url)) {
  //     await launchUrl(_url);
  //   } else {
  //     throw 'Could not launch $_url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    List<dynamic> favoritesData = widget.favoritesData;
    return GridView.count(
        childAspectRatio: 0.68,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        shrinkWrap: true,
        children: [
          for (int i = 0; i < favoritesData.length; i++)
            Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ComparePage(
                          propertyId1: favoritesData[i][0],
                          propertyId2: "",
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Container(
                      //       padding: EdgeInsets.all(5),
                      //       decoration: BoxDecoration(

                      //       ),
                      //     )
                      //   ],
                      // )

                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.all(1),
                          child:
                              // Image.network(
                              //     'https://blog.psinv.net/wp-content/uploads/2023/06/1-e1686983943196.jpg',
                              //     height: 110,
                              //     width: 500),
                              imageCheck(favoritesData[i][13])
                                  ? Image.memory(
                                      Base64Codec()
                                          .decode(favoritesData[i][13]),
                                      height: 110,
                                      width: 150, // Adjusted width
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      'assets/noImageAvailable.png',
                                      height: 110,
                                      width: 110, // Adjusted width
                                    ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          // "3 hari yang lalu",
                          nullCheck(favoritesData[i][14]),
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                      ),

                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          //"RP. 1.8 Miliar",
                          priceHandler("Rp" + favoritesData[i][5].toString()),
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          //"Pasar Rebo, Jakarta Timur",
                          nullCheck(favoritesData[i][4]),
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),

                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          //"Rumah Dijual",
                          nullCheck(favoritesData[i][3] +
                              " di" +
                              favoritesData[i][2]),
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ),

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.bed,
                            color: Colors.black,
                            size: 15,
                          ),
                          Icon(
                            Icons.favorite,
                            color: Colors.pink,
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      SizedBox(
                        height: 30,
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 205, 166, 122),
                          ),
                          //onPressed: _launchURL,
                          onPressed: () {},
                          child: const Text(
                            "Hubungi Penjual",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      )
                    ],
                  ),
                ))
        ]);
    // Container(
    //   padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
    //   margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(20),
    //   ),
    //   child: Column(
    //     children: [
    //       // Row(
    //       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       //   children: [
    //       //     Container(
    //       //       padding: EdgeInsets.all(5),
    //       //       decoration: BoxDecoration(

    //       //       ),
    //       //     )
    //       //   ],
    //       // )

    //       InkWell(
    //         onTap: () {},
    //         child: Container(
    //             margin: const EdgeInsets.all(1),
    //             child:
    //                 // Image.network(
    //                 //     'https://blog.psinv.net/wp-content/uploads/2023/06/1-e1686983943196.jpg',
    //                 //     height: 110,
    //                 //     width: 500),
    //                 Image.asset(
    //               'assets/property 1.png',
    //               height: 110,
    //               width: 500,
    //             )),
    //       ),

    //       Container(
    //         padding: const EdgeInsets.only(bottom: 8),
    //         alignment: Alignment.centerLeft,
    //         child: const Text(
    //           "3 hari yang lalu",
    //           style: TextStyle(fontSize: 10, color: Colors.black),
    //         ),
    //       ),

    //       Container(
    //         alignment: Alignment.centerLeft,
    //         child: const Text(
    //           "RP. 1.8 Miliar",
    //           style: TextStyle(
    //               fontSize: 20,
    //               color: Colors.black,
    //               fontWeight: FontWeight.bold),
    //         ),
    //       ),

    //       Container(
    //         alignment: Alignment.centerLeft,
    //         child: const Text(
    //           "Pasar Rebo, Jakarta Timur",
    //           style: TextStyle(
    //               fontSize: 12,
    //               color: Colors.black,
    //               fontWeight: FontWeight.w500),
    //         ),
    //       ),

    //       Container(
    //         alignment: Alignment.centerLeft,
    //         child: const Text(
    //           "Rumah Dijual",
    //           style: TextStyle(fontSize: 12, color: Colors.black),
    //         ),
    //       ),

    //       const Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Icon(
    //             Icons.bed,
    //             color: Colors.black,
    //             size: 15,
    //           ),
    //           Icon(
    //             Icons.favorite,
    //             color: Colors.pink,
    //           )
    //         ],
    //       ),

    //       const SizedBox(
    //         height: 10,
    //       ),

    //       SizedBox(
    //         height: 30,
    //         width: 150,
    //         child: ElevatedButton(
    //           style: ElevatedButton.styleFrom(
    //             backgroundColor: const Color.fromARGB(255, 205, 166, 122),
    //           ),
    //           onPressed: () {},
    //           child: const Text(
    //             "Hubungi Penjual",
    //             style: TextStyle(color: Colors.white, fontSize: 10),
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // ),
  }
}
