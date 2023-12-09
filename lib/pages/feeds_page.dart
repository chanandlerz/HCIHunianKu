import 'package:app_development/pages/create_post_page.dart';
import 'package:app_development/pages/favorites_page.dart';
import 'package:flutter/material.dart';

class FeedsPage extends StatefulWidget {
  const FeedsPage({super.key});

  @override
  State<FeedsPage> createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  // final formField = GlobalKey<FormState>();
  final searchbarController = TextEditingController();
  bool favorite = false;

  void activeFavorite() {
    setState(() {
      if (favorite) {
        favorite = false;
      } else {
        favorite = true;
      }
    });
  }

  // void performSearch(String query) {
  //   Navigator.pushNamed(context, '/result', arguments: query);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 58, 58, 58),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child:
                        Wrap(alignment: WrapAlignment.start, children: <Widget>[
                      SizedBox(
                        width: 270.0,
                        height: 50.0,
                        child: TextField(
                          // autovalidateMode:
                          //     AutovalidateMode.onUserInteraction,
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return "Masukkan harga properti";
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 205, 166, 122)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 15.0),
                            hintText: 'Find Property, Land, and more...',
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 205, 166, 122),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {},
                    color: const Color.fromARGB(255, 205, 166, 122),
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FavoritesPage()));
                    },
                    color: Colors.pink,
                  )
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     // buildButton(
              //     //   text: 'testing',
              //     //   onClicked: () => showModalBottomSheet(
              //     //     isScrollControlled: true,
              //     //     backgroundColor: Colors.transparent,
              //     //     context: context,
              //     //     builder: (context) => buildSheet(),
              //     //   ),
              //     // )

              //     IconButton(
              //       icon: Icon(Icons.filter_alt),
              //       onPressed: () {},
              //     )
              //   ],
              // ),

              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              for (int i = 1; i < 5; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: Container(
                    width: double.infinity,
                    height: 420.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black45,
                                        offset: Offset(0, 2),
                                        blurRadius: 6.0,
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    child: ClipOval(
                                        child: Image.asset(
                                      'assets/profile1.jpg',
                                      width: 60.0,
                                      height: 60.0,
                                      fit: BoxFit.cover,
                                    )),
                                  ),
                                ),
                                title: const Text(
                                  'Bambang',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: const Text('10 jam yang lalu'),
                                trailing: IconButton(
                                  icon: const Icon(Icons.more_horiz),
                                  color: Colors.black,
                                  onPressed: () {},
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10.0),
                                child: const Text(
                                    'Dicari rumah seperti dibawah ini (ga terlalu mirip gapapa) wilayah JABODETABEK.'),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                width: double.infinity,
                                height: 200.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    image: const DecorationImage(
                                      image:
                                          AssetImage('assets/property 1.png'),
                                      fit: BoxFit.fitWidth,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 55.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            IconButton(
                                              icon: Icon(favorite
                                                  ? Icons.favorite_border
                                                  : Icons.favorite),
                                              color: favorite
                                                  ? Colors.black
                                                  : Colors.pink,
                                              iconSize: 35.0,
                                              onPressed: activeFavorite,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 150,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            IconButton(
                                              icon: const Icon(Icons.chat),
                                              iconSize: 35.0,
                                              onPressed: () {},
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
// Widget makeDismissible({
//   required BuildContext context,
//   required Widget child,
// }) => GestureDetector(
//       behavior: HitTestBehavior.opaque,
//       onTap: () => Navigator.of(context).pop(),
//       child: GestureDetector(onTap: () {}, child: child),
//     );

// Widget buildButton({
//   required String text,
//   required VoidCallback onClicked,
// }) =>
//     ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(fontSize: 15),
//       ),
//       onPressed: onClicked,
//     );

// Widget buildSheet() => DraggableScrollableSheet(
//       initialChildSize: 0.7,
//       minChildSize: 0.5,
//       maxChildSize: 1,
//       builder: (_, controller) => Container(
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
//         padding: EdgeInsets.all(16),
//         child: ListView(
//           controller: controller,
//           children: [
//             TextFormField(

//           )
//           ],
//         ),
//       ),
//     );

Future Sewakan_Rumah(BuildContext context) {
  final formField = GlobalKey<FormState>();
  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isDismissible: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => SizedBox(
            height: 700,
            child: ListView(
              children: [
                Form(
                  key: formField,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 25.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan lokasi properti";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        hintText: 'Lokasi Properti',
                        // suffixIcon: Icon(Icons.search_rounded),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 184, 184, 184),
                  thickness: 1.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 10.0),
                  child: Text(
                    'Rentang Sewa',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 20.0),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: const BorderSide(
                                        color: Color.fromARGB(
                                            255, 205, 166, 122))))),
                        child: const Text('harian',
                            style: TextStyle(
                                color: Color.fromARGB(255, 121, 121, 121))),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: const BorderSide(
                                        color: Color.fromARGB(
                                            255, 205, 166, 122))))),
                        child: const Text('mingguan',
                            style: TextStyle(
                                color: Color.fromARGB(255, 121, 121, 121))),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: const BorderSide(
                                        color: Color.fromARGB(
                                            255, 205, 166, 122))))),
                        child: const Text('bulanan',
                            style: TextStyle(
                                color: Color.fromARGB(255, 121, 121, 121))),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: const BorderSide(
                                        color: Color.fromARGB(
                                            255, 205, 166, 122))))),
                        child: const Text('3 bulan',
                            style: TextStyle(
                                color: Color.fromARGB(255, 121, 121, 121))),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: const BorderSide(
                                        color: Color.fromARGB(
                                            255, 205, 166, 122))))),
                        child: const Text('6 bulan',
                            style: TextStyle(
                                color: Color.fromARGB(255, 121, 121, 121))),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: const BorderSide(
                                        color: Color.fromARGB(
                                            255, 205, 166, 122))))),
                        child: const Text('tahunan',
                            style: TextStyle(
                                color: Color.fromARGB(255, 121, 121, 121))),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: const BorderSide(
                                        color: Color.fromARGB(
                                            255, 205, 166, 122))))),
                        child: const Text('semua',
                            style: TextStyle(
                                color: Color.fromARGB(255, 121, 121, 121))),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 184, 184, 184),
                  thickness: 1.0,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Kisaran Harga (Rp)',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20.0, left: 10.0, top: 18.0),
                      child: Wrap(
                          alignment: WrapAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 205.0,
                              height: 35.0,
                              child: TextFormField(
                                // autovalidateMode:
                                //     AutovalidateMode.onUserInteraction,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return "Masukkan harga properti";
                                //   }
                                //   return null;
                                // },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 205, 166, 122)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade400),
                                  ),
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 10.0),
                                  hintText: '',
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
                const Divider(
                  color: Color.fromARGB(255, 184, 184, 184),
                  thickness: 1.0,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Rentang Area (meter persegi)',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20.0, left: 10.0, top: 18.0),
                      child: Wrap(
                          alignment: WrapAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 120.0,
                              height: 35.0,
                              child: TextFormField(
                                // autovalidateMode:
                                //     AutovalidateMode.onUserInteraction,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return "Masukkan rentang area properti";
                                //   }
                                //   return null;
                                // },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 205, 166, 122)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade400),
                                  ),
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 10.0),
                                  hintText: '',
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
                const Divider(
                  color: Color.fromARGB(255, 184, 184, 184),
                  thickness: 1.0,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Jumlah Kamar Tidur',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Text(
                        'Jumlah Kamar Mandi',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Form(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 10.0),
                        child: SizedBox(
                          width: 100.0,
                          height: 35.0,
                          child: TextFormField(
                            // autovalidateMode: AutovalidateMode.onUserInteraction,
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return "Masukkan jumlah kamar tidur";
                            //   }
                            //   return null;
                            // },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 205, 166, 122)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 10.0),
                              hintText: '',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Form(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 25.0, top: 10.0),
                        child: SizedBox(
                          width: 100.0,
                          height: 35.0,
                          child: TextFormField(
                            // autovalidateMode: AutovalidateMode.onUserInteraction,
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return "Masukkan jumlah kamar mandi";
                            //   }
                            //   return null;
                            // },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 205, 166, 122)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 10.0),
                              hintText: '',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 205, 166, 122)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: const BorderSide(
                                        color: Color.fromARGB(
                                            255, 205, 166, 122))))),
                    child: const Text('Pasang Iklan'),
                  ),
                )
              ],
            ),
          ));
}
