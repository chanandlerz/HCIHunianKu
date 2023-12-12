import 'package:app_development/pages/favorites_page.dart';
import 'package:app_development/pages/login_page.dart';
import 'package:app_development/pages/pasang_iklan_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 58, 58, 58),
//       body: ListView(
//         children: <Widget>[
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),

//               Padding(
//                 padding: const EdgeInsets.only(left: 25.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Wrap(
//                       children: [
//                         SizedBox(
//                           width: 70.0,
//                           height: 70.0,
//                           child: CircleAvatar(
//                             child: ClipOval(
//                               child: Image.asset(
//                                 'assets/profile1.jpg',
//                                 width: 100.0,
//                                 height: 100.0,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         const Column(
//                           // mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           // mainAxisAlignment: MainAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.only(top: 20.0),
//                               child: Text(
//                                 '@memories',
//                                 style: TextStyle(
//                                     color: Color.fromARGB(255, 205, 166, 122),
//                                     fontSize: 25,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(right: 10.0),
//                       child: IconButton(
//                         icon: Icon(Icons.favorite),
//                         color: Color.fromARGB(255, 205, 166, 122),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => FavoritesPage()));
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//               ),

//               const SizedBox(
//                 height: 30,
//               ),

//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
//                 child: Container(
//                   width: double.infinity,
//                   height: 90.0,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           // SizedBox(
//                           //   width: 30,
//                           // ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 26.0),
//                             child: IconButton(
//                               icon: const Icon(Icons.settings),
//                               onPressed: () {},
//                               color: const Color.fromARGB(255, 205, 166, 122),
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.only(left: 10.0, right: 10.0),
//                             child: IconButton(
//                               icon: const Icon(Icons.info),
//                               onPressed: () {},
//                               color: const Color.fromARGB(255, 205, 166, 122),
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.only(left: 10.0, right: 10.0),
//                             child: IconButton(
//                               icon: const Icon(Icons.my_library_books_rounded),
//                               onPressed: () {},
//                               color: const Color.fromARGB(255, 205, 166, 122),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(right: 16.0),
//                             child: IconButton(
//                               icon: const Icon(Icons.home),
//                               onPressed: () {},
//                               color: const Color.fromARGB(255, 205, 166, 122),
//                             ),
//                           ),
//                         ],
//                       ),
// const Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Padding(
//       padding: EdgeInsets.only(left: 20.0),
//       child: Text(
//         'Pengaturan\nProfil',
//         textAlign: TextAlign.center,
//         style: TextStyle(
//             color: Color.fromARGB(255, 205, 166, 122)),
//       ),
//     ),
//     Padding(
//       padding: EdgeInsets.only(left: 10.0, right: 15.0),
//       child: Text(
//         'Info\nLangganan',
//         textAlign: TextAlign.center,
//         style: TextStyle(
//             color: Color.fromARGB(255, 205, 166, 122)),
//       ),
//     ),
//     Padding(
//       padding: EdgeInsets.only(left: 10.0, right: 25.0),
//       child: Text(
//         'Postingan\nSaya',
//         textAlign: TextAlign.center,
//         style: TextStyle(
//             color: Color.fromARGB(255, 205, 166, 122)),
//       ),
//     ),
//     Padding(
//       padding: EdgeInsets.only(right: 23.0),
//       child: Text(
//         'Listing\nSaya',
//         textAlign: TextAlign.center,
//         style: TextStyle(
//             color: Color.fromARGB(255, 205, 166, 122)),
//       ),
//     ),
//   ],
// )
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),

//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
//                 child: Container(
//                   width: double.infinity,
//                   height: 190,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                   child: Row(
//                     children: [
//                       Column(
//                         // mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.only(left: 10.0, top: 10.0),
//                             child: Text(
//                               'Ingin menjual atau menyewakan\nproperty anda?',
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.only(left: 10.0, top: 5.0),
//                             child: Text(
//                               'Tayangkan iklan dengan\nbeberapa langkah\nmudah',
//                               style: TextStyle(
//                                   color: Color.fromARGB(255, 157, 157, 157)),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(
//                                 left: 10.0, top: 15.0, bottom: 15.0),
//                             child: SizedBox(
//                               height: 50,
//                               width: 120,
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             const FilterPasangIklan()),
//                                   );
//                                 },
//                                 style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.all<
//                                             Color>(
//                                         const Color.fromARGB(255, 51, 54, 63)),
//                                     shape: MaterialStateProperty.all<
//                                             RoundedRectangleBorder>(
//                                         RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(10.0)))),
//                                 child: const Text(
//                                   'Pasang Iklan',
//                                   style: TextStyle(
//                                       color:
//                                           Color.fromARGB(255, 205, 166, 122)),
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       Column(
//                         // crossAxisAlignment: CrossAxisAlignment.end,
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Padding(
//                             padding:
//                                 const EdgeInsets.only(bottom: 20.0, left: 50.0),
//                             child: Image.asset(
//                               'assets/profileprofile.png',
//                               width: 110,
//                               height: 110,
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),

//               const SizedBox(
//                 height: 30,
//               ),

//               Column(children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.call),
//                         onPressed: () {},
//                         color: const Color.fromARGB(255, 205, 166, 122),
//                       ),
//                       const Expanded(
//                         child: Text(
//                           'Hubungi Kami',
//                           style: TextStyle(
//                               color: Color.fromARGB(255, 205, 166, 122)),
//                         ),
//                       ),
//                       // SizedBox(
//                       //   width: 180,
//                       // ),
//                       IconButton(
//                         icon: const Icon(Icons.keyboard_arrow_right_rounded),
//                         color: const Color.fromARGB(255, 205, 166, 122),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 350,
//                   child: Divider(
//                     color: Color.fromARGB(255, 205, 166, 122),
//                     thickness: 1.0,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.share),
//                         onPressed: () {},
//                         color: const Color.fromARGB(255, 205, 166, 122),
//                       ),
//                       const Expanded(
//                         child: Text(
//                           'Undang Rekan',
//                           style: TextStyle(
//                               color: Color.fromARGB(255, 205, 166, 122)),
//                         ),
//                       ),
//                       // SizedBox(
//                       //   width: 180,
//                       // ),
//                       IconButton(
//                         icon: const Icon(Icons.keyboard_arrow_right_rounded),
//                         color: const Color.fromARGB(255, 205, 166, 122),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 350,
//                   child: Divider(
//                     color: Color.fromARGB(255, 205, 166, 122),
//                     thickness: 1.0,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.sticky_note_2_rounded),
//                         onPressed: () {},
//                         color: const Color.fromARGB(255, 205, 166, 122),
//                       ),
//                       const Expanded(
//                         child: Text(
//                           'Syarat dan Kebijakan Privasi',
//                           style: TextStyle(
//                               color: Color.fromARGB(255, 205, 166, 122)),
//                         ),
//                       ),
//                       // SizedBox(
//                       //   width: 106,
//                       // ),
//                       IconButton(
//                         icon: const Icon(Icons.keyboard_arrow_right_rounded),
//                         color: const Color.fromARGB(255, 205, 166, 122),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 350,
//                   child: Divider(
//                     color: Color.fromARGB(255, 205, 166, 122),
//                     thickness: 1.0,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10.0),
//                   child: Row(
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.logout),
//                         color: const Color.fromARGB(255, 205, 166, 122),
//                         onPressed: () async {
//                           String udid = await FlutterUdid.udid;

//                           // Navigator.push(
//                           //     context,
//                           //     MaterialPageRoute(
//                           //         builder: (context) => LoginPage(udid: udid)));

//                           Navigator.pushReplacementNamed(context, '/login',
//                               arguments: {'udid': ''});
//                         },
//                       ),
//                       const Expanded(
//                         child: Text(
//                           'Keluar',
//                           style: TextStyle(
//                               color: Color.fromARGB(255, 205, 166, 122)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ]),

//               // ElevatedButton(
//               //   onPressed: () {
//               //     logout(context);
//               //   },
//               //   child: Text('Logout'),
//               // )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//   // Future<void> logout(BuildContext context) async {
//   //   // Clear user credentials from shared preferences
//   //   final prefs = await SharedPreferences.getInstance();
//   //   await prefs.remove('username');
//   //   await prefs.remove('password');

//   //   // Navigate to the login page
//   //   Navigator.pushReplacement(
//   //     context,
//   //     MaterialPageRoute(builder: (context) => LoginPage(udid: '',)),
//   //   );
//   // }

//   void _logout(BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isLoggedIn', false);

//     Navigator.of(context).pushReplacement(MaterialPageRoute(
//       builder: (context) => const LoginPage(
//         udid: '',
//       ),
//     ));
//   }
// }

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 58, 58, 58),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Wrap(
                      children: [
                        SizedBox(
                          width: 70.0,
                          height: 70.0,
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
                        const SizedBox(
                          width: 15,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Text(
                                '@memories',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 205, 166, 122),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: IconButton(
                        icon: Icon(Icons.favorite),
                        color: Color.fromARGB(255, 205, 166, 122),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FavoritesPage()));
                        },
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Container(
                    width: double.infinity,
                    height: 90.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 26.0),
                              child: IconButton(
                                icon: const Icon(Icons.settings),
                                onPressed: () {},
                                color: const Color.fromARGB(255, 205, 166, 122),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: IconButton(
                                icon: const Icon(Icons.info),
                                onPressed: () {},
                                color: const Color.fromARGB(255, 205, 166, 122),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: IconButton(
                                icon:
                                    const Icon(Icons.my_library_books_rounded),
                                onPressed: () {},
                                color: const Color.fromARGB(255, 205, 166, 122),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: IconButton(
                                icon: const Icon(Icons.home),
                                onPressed: () {},
                                color: const Color.fromARGB(255, 205, 166, 122),
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                'Pengaturan\nProfil',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 205, 166, 122)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 15.0),
                              child: Text(
                                'Info\nLangganan',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 205, 166, 122)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 25.0),
                              child: Text(
                                'Postingan\nSaya',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 205, 166, 122)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 23.0),
                              child: Text(
                                'Listing\nSaya',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 205, 166, 122)),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Container(
                  width: double.infinity,
                  height: 190,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                'Ingin menjual atau menyewakan\nproperty anda?',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10.0, top: 5.0),
                              child: Text(
                                'Tayangkan iklan dengan\nbeberapa langkah\nmudah',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 157, 157, 157)),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 15.0),
                              child: SizedBox(
                                height: 50,
                                width: 120,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const FilterPasangIklan()),
                                    );
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color.fromARGB(
                                                  255, 51, 54, 63)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10.0)))),
                                  child: const Text(
                                    'Pasang Iklan',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 205, 166, 122)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20.0, left: 50.0),
                              child: Image.asset(
                                'assets/profileprofile.png',
                                width: 110,
                                height: 110,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.call),
                        onPressed: () {},
                        color: const Color.fromARGB(255, 205, 166, 122),
                      ),
                      Expanded(
                        child: Text(
                          'Hubungi Kami',
                          style: TextStyle(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.keyboard_arrow_right_rounded),
                        color: const Color.fromARGB(255, 205, 166, 122),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 350,
                  child: Divider(
                    color: Color.fromARGB(255, 205, 166, 122),
                    thickness: 1.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.share),
                        onPressed: () {},
                        color: const Color.fromARGB(255, 205, 166, 122),
                      ),
                      Expanded(
                        child: Text(
                          'Undang Rekan',
                          style: TextStyle(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.keyboard_arrow_right_rounded),
                        color: const Color.fromARGB(255, 205, 166, 122),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 350,
                  child: Divider(
                    color: Color.fromARGB(255, 205, 166, 122),
                    thickness: 1.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.sticky_note_2_rounded),
                        onPressed: () {},
                        color: const Color.fromARGB(255, 205, 166, 122),
                      ),
                      Expanded(
                        child: Text(
                          'Syarat dan Kebijakan Privasi',
                          style: TextStyle(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.keyboard_arrow_right_rounded),
                        color: const Color.fromARGB(255, 205, 166, 122),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 350,
                  child: Divider(
                    color: Color.fromARGB(255, 205, 166, 122),
                    thickness: 1.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.logout),
                        color: const Color.fromARGB(255, 205, 166, 122),
                        onPressed: () async {
                          String udid = await FlutterUdid.udid;

                          Navigator.pushReplacementNamed(context, '/login',
                              arguments: {'udid': ''});
                        },
                      ),
                      Expanded(
                        child: Text(
                          'Keluar',
                          style: TextStyle(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
