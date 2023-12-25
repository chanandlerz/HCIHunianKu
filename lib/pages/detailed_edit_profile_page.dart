import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:app_development/pages/edit_profile_page.dart';
import 'package:flutter/material.dart';

class EditUsername extends StatefulWidget {
  const EditUsername({super.key});

  @override
  State<EditUsername> createState() => _EditUsernameState();
}

class _EditUsernameState extends State<EditUsername> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 58, 58, 58),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            color: Color.fromARGB(255, 205, 166, 122),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProfile()));
            },
          ),
          title: Text(
            'Ubah Username',
            style: TextStyle(color: Color.fromARGB(255, 205, 166, 122)),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 58, 58, 58),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 30),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Input tidak boleh kosong";
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 205, 166, 122))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 205, 166, 122))),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 205, 166, 122))),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 205, 166, 122))),
                    labelText: '@Username',
                    labelStyle: TextStyle(color: Colors.white)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: ElevatedButton(
                child: Text('Simpan'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 205, 166, 122)),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BottomNavBar()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EditEmail extends StatefulWidget {
  const EditEmail({super.key});

  @override
  State<EditEmail> createState() => _EditEmailState();
}

class _EditEmailState extends State<EditEmail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 58, 58, 58),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            color: Color.fromARGB(255, 205, 166, 122),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProfile()));
            },
          ),
          title: Text(
            'Ubah E-mail',
            style: TextStyle(color: Color.fromARGB(255, 205, 166, 122)),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 58, 58, 58),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 30),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Input tidak boleh kosong";
                  }
                  if (!value.contains("@gmail.com")) {
                    return "use @gmail.com";
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 205, 166, 122))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 205, 166, 122))),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 205, 166, 122))),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 205, 166, 122))),
                    labelText: 'E-mail',
                    labelStyle: TextStyle(color: Colors.white)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: ElevatedButton(
                child: Text('Simpan'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 205, 166, 122)),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EditNoTelp extends StatefulWidget {
  const EditNoTelp({super.key});

  @override
  State<EditNoTelp> createState() => _EditNoTelpState();
}

class _EditNoTelpState extends State<EditNoTelp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 58, 58, 58),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            color: Color.fromARGB(255, 205, 166, 122),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProfile()));
            },
          ),
          title: Text(
            'Ubah Nomor Telepon',
            style: TextStyle(color: Color.fromARGB(255, 205, 166, 122)),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 58, 58, 58),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 30),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Input tidak boleh kosong";
                  }
                  bool numberValid = RegExp(r"^[0-9]*$").hasMatch(value);
                  if (numberValid == false) {
                    return "Input harus angka";
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 205, 166, 122))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 205, 166, 122))),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 205, 166, 122))),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 205, 166, 122))),
                    labelText: 'Nomor Telepon',
                    labelStyle: TextStyle(color: Colors.white)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: ElevatedButton(
                child: Text('Simpan'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 205, 166, 122)),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EditPassword extends StatefulWidget {
  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 58, 58, 58),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            color: Color.fromARGB(255, 205, 166, 122),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProfile()));
            },
          ),
          title: Text(
            'Ubah Password',
            style: TextStyle(color: Color.fromARGB(255, 205, 166, 122)),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 58, 58, 58),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 30),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Input tidak boleh kosong";
                  }
                  bool emailValid =
                      RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{1,}$")
                          .hasMatch(value);
                  if (emailValid == false) {
                    return "Password harus merupakan kombinasi antara huruf dan angka";
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      color: Color.fromARGB(255, 205, 166, 122),
                      onPressed: () {},
                    ),
                    errorStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 205, 166, 122))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 205, 166, 122))),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 205, 166, 122))),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 205, 166, 122))),
                    labelText: 'Password baru',
                    labelStyle: TextStyle(color: Colors.white)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 30),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Input tidak boleh kosong";
                  }
                  bool emailValid =
                      RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{1,}$")
                          .hasMatch(value);
                  if (emailValid == false) {
                    return "Password harus merupakan kombinasi antara huruf dan angka";
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      color: Color.fromARGB(255, 205, 166, 122),
                      onPressed: () {},
                    ),
                    errorStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 205, 166, 122))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 205, 166, 122))),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 205, 166, 122))),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 205, 166, 122))),
                    labelText: 'Konfirmasi password baru',
                    labelStyle: TextStyle(color: Colors.white)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: ElevatedButton(
                child: Text('Simpan'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 205, 166, 122)),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
