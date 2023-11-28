import 'package:app_development/components/favorites_page_grid.dart';
import 'package:app_development/components/text_field_searchbar_favorites.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});

  final searchbarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 58, 58, 58),
      body: ListView(
        children: <Widget>[

          Column(
            children: [
              SizedBox(
                height: 20,
              ),

              SearchTextFieldFavoritesPage(
                controller: searchbarController,
                hintText: 'Find Favorites',
                obscureText: false,
              ),

              SizedBox(
                height: 10,
              ),

              FavoritesWidget(),
            ],
          ),
        ],
      ),

      
    );
  }
}