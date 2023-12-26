import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:app_development/pages/login_page.dart';
import 'package:app_development/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUserStatus();
    // checkLoginStatus();
  }

  // void checkLoginStatus() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    // if (isLoggedIn) {
    //   Navigator.pushReplacementNamed(context, '/feeds');
    // } else {
    //   Navigator.pushReplacementNamed(context, '/login');
    // }
  // }

  // void checkUserStatus() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool isUserRegistered = prefs.getBool('isUserRegistered') ?? false;

  //   // Simulate a delay, such as fetching data from an API
  //   await Future.delayed(Duration(seconds: 2));

    // if (isUserRegistered) {
    //   Navigator.pushReplacementNamed(context, '/login',
    //       arguments: {'udid': ''});
    // } else {
    //   Navigator.pushReplacementNamed(context, '/register');
    // }
  // }

  void checkUserStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isUserRegistered = prefs.getBool('isUserRegistered') ?? false;
    bool isUserLoggedIn = prefs.getBool('isUserLoggedIn') ?? false;

    // Simulate a delay, such as fetching data from an API
    await Future.delayed(Duration(seconds: 2));

    if (isUserRegistered) {
      Navigator.pushReplacementNamed(context, '/login',
          arguments: {'udid': ''});
    } else {
      Navigator.pushReplacementNamed(context, '/register');
    }

    if (isUserLoggedIn) {
      Navigator.pushReplacementNamed(context, '/feeds');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  // Future getValidationData() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   var obtainedEmail = sharedPreferences.getString('full name');
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
