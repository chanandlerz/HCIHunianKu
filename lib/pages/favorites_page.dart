import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:app_development/components/favorites_page_grid.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});

  final searchbarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: SizedBox(
            width: 335,
            height: 50,
            child: TextField(
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return "Masukkan lokasi properti";
              //   }
              //   return null;
              // },
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 205, 166, 122)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  hintText: 'Find Favorites',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 205, 166, 122),
                  )
                  // suffixIcon: Icon(Icons.search_rounded),
                  ),
            ),
          )),
      backgroundColor: const Color.fromARGB(255, 58, 58, 58),
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const FavoritesWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
