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
          height: 300,
          width: screenWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/property 1.png',
                    height: 200,
                    width: 350,
                    // fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
