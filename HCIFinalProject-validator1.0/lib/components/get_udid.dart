import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Device ID Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            String deviceId = await getDeviceId(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondPage(deviceId: deviceId),
              ),
            );
          },
          child: Text('Get Device ID and Navigate'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String deviceId;

  SecondPage({required this.deviceId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text('Device ID: $deviceId'),
      ),
    );
  }
}

Future<String> getDeviceId(BuildContext context) async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceId;

  if (Theme.of(context).platform == TargetPlatform.iOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    deviceId = iosInfo.identifierForVendor; // iOS device ID
  } else {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceId = androidInfo.androidId; // Android device ID
  }

  return deviceId;
}
