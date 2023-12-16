import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final formField = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 58, 58, 58),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 58, 58, 58),
          leading: IconButton(
            icon: Icon(Icons.close),
            color: Color.fromARGB(255, 205, 166, 122),
            onPressed: () {},
          ),
          actions: [
            TextButton(
              child: Text(
                'Save',
                style: TextStyle(color: Color.fromARGB(255, 205, 166, 122)),
              ),
              onPressed: () {},
            )
          ],
        ),
        body: ListView(
          children: [
            Center(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 10),
                  child: SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: CircleAvatar(
                      child: ClipOval(
                        child: Image.asset(
                          'assets/profile1.jpg',
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  child: Text('Ubah Foto Profil'),
                  onPressed: () {},
                )
              ],
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: formField,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          'Info Profil',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
