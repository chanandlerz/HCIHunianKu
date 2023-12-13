import 'package:app_development/components/bottom_nav_bar.dart';
import 'package:app_development/components/property_page_grid.dart';
import 'package:app_development/components/text_field_searchbar_home.dart';
import 'package:flutter/material.dart';

class PropertyPage extends StatelessWidget {
  PropertyPage({super.key});

  final searchbarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final String query = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      // appBar: AppBar(
      //   title: Text("Home Page"),
      // ),

      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 58, 58, 58),
        body: ListView(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   mainAxisSize: MainAxisSize.max,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Icon(
            //       Icons.favorite,
            //       color: Colors.pink,
            //       size: 20.0,
            //     ),

            //     SearchTextField(
            //       controller: searchbarController,
            //       hintText: 'Find Property, Land, and more...',
            //       obscureText: false,
            //     )
            //   ],
            // )
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios_new_rounded),
                        color: Color.fromARGB(255, 205, 166, 122),
                        onPressed: () {},
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: Text(
                          'Properti',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 184, 184, 184),
              thickness: 1.0,
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  SearchTextFieldHomePage(
                    controller: searchbarController,
                    hintText: 'Jakarta Timur',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const PropertyWidget(),
                ],
              ),
            )
          ],
        ),
      ),

      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.transparent,
      //   onTap: (index) {},
      //   height: 50,
      //   color: Color.fromARGB(255, 58, 58, 58),
      //   items: [
      //     IconButton(
      //         onPressed: () {
      //           Navigator.push(
      //               context, MaterialPageRoute(builder: (_) => PropertyPage()));
      //         },
      //         icon: Icon(
      //           Icons.home_filled,
      //           size: 30,
      //           color: Color.fromARGB(255, 205, 166, 122),
      //         )),
      //     // Icon(
      //     //   Icons.home_filled,
      //     //   size: 30,
      //     //   color: Color.fromARGB(255, 205, 166, 122),
      //     // ),
      //     Icon(
      //       Icons.favorite_border,
      //       size: 30,
      //       color: Color.fromARGB(255, 205, 166, 122),
      //     ),
      //     Icon(
      //       Icons.person,
      //       size: 30,
      //       color: Color.fromARGB(255, 205, 166, 122),
      //     ),
      //   ],
      // ),
      //////////////////////////////
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      //       return AboutPage();
      //     }));
      //   },
      //   child: Icon(Icons.keyboard_arrow_right),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// class PropertyPageGrid extends StatelessWidget {
//   const PropertyPageGrid({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GridView.count(
//         crossAxisCount: 2,
//         children: [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Container(
//               height: 50,
//               width: 50,
//               color: Colors.blue,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Container(
//               height: 50,
//               width: 50,
//               color: Colors.blue,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Container(
//               height: 50,
//               width: 50,
//               color: Colors.blue,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Container(
//               height: 50,
//               width: 50,
//               color: Colors.blue,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
