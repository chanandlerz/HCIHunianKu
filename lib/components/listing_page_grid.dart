import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListingWidget extends StatefulWidget {
  const ListingWidget({super.key});

  @override
  State<ListingWidget> createState() => _ListingWidgetState();
}

class _ListingWidgetState extends State<ListingWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Container(
          height: 165,
          width: screenWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Image.asset(
                        'assets/property 1.png',
                        height: 120,
                        width: 170,
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Text(
                                  'RP',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                '500 Juta',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Text('Pasar Rebo, Jakarta Timur'),
                          Text('Rumah Dijual'),
                          Row(
                            children: [
                              Icon(
                                Icons.bed,
                                color: Color.fromARGB(255, 205, 166, 122),
                                size: 15,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 3, right: 5),
                                child: Text('3'),
                              ),
                              Icon(
                                Icons.bathtub_rounded,
                                color: Color.fromARGB(255, 205, 166, 122),
                                size: 15,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 3),
                                child: Text('2'),
                              )
                            ],
                          ),
                          Container(
                            width: 30,
                            height: 12,
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              'Aktif',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          )
                        ],
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      width: 160,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 205, 166, 122))),
                        child: Text(
                          'Ubah Status',
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 160,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 205, 166, 122))),
                        child: Text(
                          'Ubah Deskripsi',
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
