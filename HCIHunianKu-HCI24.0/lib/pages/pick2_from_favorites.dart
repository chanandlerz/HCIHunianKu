import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:app_development/components/pick2_favorites_grid.dart';
import 'package:app_development/pages/compare.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app_development/connection.dart';

Connection connection = Connection();

class Pick2FromFavoritesPage extends StatefulWidget {
  Pick2FromFavoritesPage({super.key});

  @override
  State<Pick2FromFavoritesPage> createState() => _Pick2FromFavoritesPageState();
}

class _Pick2FromFavoritesPageState extends State<Pick2FromFavoritesPage> {
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
      final Uri url = Uri.http(connection.url, 'favoritesData');

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
          title: Text(
            'Choose Property 2',
            style: TextStyle(color: Color.fromARGB(255, 205, 166, 122)),
          )),
      backgroundColor: const Color.fromARGB(255, 58, 58, 58),
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Pick2FromFavoritesWidget(favoritesData: favoritesData),
            ],
          ),
        ],
      ),
    );
  }
}
