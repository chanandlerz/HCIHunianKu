import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:app_development/pages/create_post_page.dart';
import 'package:app_development/pages/pasang_iklan_page.dart';
import 'package:flutter/material.dart';
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
  runApp(const MyApp());
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}
