import 'package:app_development/components/listing_page_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListingPage extends StatefulWidget {
  const ListingPage({super.key});

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 58, 58, 58),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios_new_rounded),
                        color: Color.fromARGB(255, 205, 166, 122),
                        onPressed: () {},
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: Text(
                          'Listing Properti Anda',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                      )
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.tune_rounded),
                    color: Color.fromARGB(255, 205, 166, 122),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 184, 184, 184),
              thickness: 1.0,
            ),
            for (int i = 1; i < 10; i++)
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: ListingWidget(),
              ),
          ],
        ),
      ),
    );
  }
}
