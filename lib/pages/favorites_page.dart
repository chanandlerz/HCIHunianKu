import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:app_development/components/favorites_page_grid.dart';
import 'package:app_development/pages/compare.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FavoritesPage extends StatefulWidget {
  FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final searchbarController = TextEditingController();

  //final SharedPreferences prefs = SharedPreferences.getInstance();
  late List<dynamic> favorites = [];
  late List<dynamic> favoritesData = [];

  @override
  void initState() {
    super.initState();
    //fetchFavoritesData();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? loadedFavorites = prefs.getStringList('favorites');

    if (loadedFavorites != null) {
      setState(() {
        favorites = loadedFavorites;
        print('Loaded favorites: $favorites');
        fetchFavoritesData();
      });
    } else {
      print('Favorites list is empty or not found.');
    }
  }

  Future<void> fetchFavoritesData() async {
    if (favorites.isNotEmpty) {
      final Uri url =
          Uri.https('hunianku.juanfredoalexiu.repl.co', 'favoritesData');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'favorites': favorites}),
      );

      if (response.statusCode == 200) {
        print('Data fetched successfully');
        setState(() {
          favoritesData = jsonDecode(response.body);
          print(favoritesData);
        });
      } else {
        print('Failed to fetch data. Status Code: ${response.statusCode}');
        print('Error Response: ${response.body}');
      }
    } else {
      print('Favorites list is empty. Skipping API call.');
    }
  }

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
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
            child: SizedBox(
              // width: 100,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 205, 166, 122)),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ComparePage(
                                propertyId1: "",
                                propertyId2: "",
                              )));
                },
                child: Text("Compare Properties"),
              ),
            ),
          )
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 58, 58, 58),
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              FavoritesWidget(favoritesData: favoritesData),
            ],
          ),
        ],
      ),
    );
  }
}
