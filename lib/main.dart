import 'package:app_development/components/add_property_jual.dart';
import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:app_development/components/filter_property_beli.dart';
import 'package:app_development/pages/comment_page.dart';
import 'package:app_development/pages/compare.dart';
import 'package:app_development/pages/create_post_page.dart';
import 'package:app_development/pages/detail_property_page.dart';
import 'package:app_development/pages/detailed_edit_profile_page.dart';
import 'package:app_development/pages/edit_profile_page.dart';
import 'package:app_development/pages/favorites_page.dart';
import 'package:app_development/pages/feeds_page.dart';
import 'package:app_development/pages/filter_property_page.dart';
import 'package:app_development/pages/list_post.dart';
import 'package:app_development/pages/listing_saya_page.dart';
import 'package:app_development/pages/login_page.dart';
import 'package:app_development/pages/notfound_property_page.dart';
import 'package:app_development/pages/pasang_iklan_page.dart';
import 'package:app_development/pages/profile_page.dart';
import 'package:app_development/pages/property_page.dart';
import 'package:app_development/pages/register_page.dart';
import 'package:app_development/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUtils {
  static const String _loggedInKey = 'isLoggedIn';

  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loggedInKey) ?? false;
  }

  static Future<void> login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loggedInKey, true);
  }

  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_loggedInKey);
  }
}

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: FutureBuilder(
//         future: _checkFirstTimeInstallation(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             bool isFirstTimeInstallation = snapshot.data as bool;
//             return isFirstTimeInstallation
//                 ? RegisterPage()
//                 : FutureBuilder(
//                     future: AuthUtils.isLoggedIn(),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.done) {
//                         bool isLoggedIn = snapshot.data as bool;
//                         return isLoggedIn ? LoginPage(udid: '',) : RegisterPage();
//                       } else {
//                         return Scaffold(body: CircularProgressIndicator());
//                       }
//                     },
//                   );
//           } else {
//             return Scaffold(body: CircularProgressIndicator());
//           }
//         },
//       ),
//       initialRoute: '/',
//       routes: {
//         '/register': (context) => RegisterPage(),
//         '/login': (context) {
//           Map<String, dynamic>? args = ModalRoute.of(context)
//               ?.settings
//               .arguments as Map<String, dynamic>;
//           String udid = args?['udid'] ?? '';
//           return LoginPage(udid: udid);
//         },
//         '/dashboard': (context) => BottomNavBar(),
//       },
//     );
//   }

//   Future<bool> _checkFirstTimeInstallation() async {
//     String udid = await FlutterUdid.udid;
//     return udid.isEmpty;
//   }
// }

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
      '/login': (context) => LoginPage(udid: '',),
      '/feeds': (context) => BottomNavBar(),
      '/profile':(context) => ProfilePage(),
      '/register': (context) => RegisterPage(),
      '/listingsaya': (context) => ListingPage(udid: ''),
      '/editprofile':(context) => EditProfile(),
      '/editusername':(context) => EditUsername(username: ''),
      },
      debugShowCheckedModeBanner: false,
      // home: BottomNavBar(),
    );
  }
}
