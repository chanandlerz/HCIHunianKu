import 'package:app_development/components/home_page_grid.dart';
import 'package:app_development/components/text_field_searchbar_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final searchbarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String query = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Home Page"),
      // ),
      backgroundColor: const Color.fromARGB(255, 58, 58, 58),
      body: ListView(
        children: <Widget>[
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

          Column(
            children: [
              Text('test: $query'),
              const SizedBox(
                height: 20,
              ),

              // Container(
              //   padding: EdgeInsets.all(10.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     mainAxisSize: MainAxisSize.max,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Icon(
              //         Icons.favorite,
              //         color: Colors.pink,
              //         size: 20.0,
              //       ),
              //       SearchTextField(
              //         controller: searchbarController,
              //         hintText: 'Find Property, Land, and more...',
              //         obscureText: false,
              //       )
              //     ],
              //   ),
              // )

              // Icon(
              //   Icons.favorite,
              //   color: Colors.pink,
              //   size: 20.0,
              // ),

              // Row(
              //   children: [
              //     SearchTextField(
              //       controller: searchbarController,
              //       hintText: 'Find Property, Land, and more...',
              //       obscureText: false,
              //     ),
              //     Container(
              //       width: 200,
              //       height: 200,
              //       decoration: BoxDecoration(
              //         color: Colors.red,
              //       ),
              //     ),
              //   ],
              // )

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
        ],
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
      //               context, MaterialPageRoute(builder: (_) => HomePage()));
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

// class HomePageGrid extends StatelessWidget {
//   const HomePageGrid({super.key});

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
