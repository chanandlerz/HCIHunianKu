import 'package:app_development/pages/favorites_page.dart';
import 'package:app_development/pages/feeds_page.dart';
import 'package:app_development/pages/profile_page.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  // Daftar halaman yang ingin di-navigate
  final List<Widget> _pages = [FeedsPage(), FavoritesPage(), ProfilePage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 58, 58, 58),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedIconTheme: IconThemeData(
          color: Color.fromARGB(255, 205, 166, 122),
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
        ),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
