import 'package:app_development/components/text_field_searchbar_feeds.dart';
import 'package:flutter/material.dart';

class FeedsPage extends StatefulWidget {
  FeedsPage({super.key});

  @override
  State<FeedsPage> createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  // final formField = GlobalKey<FormState>();
  final searchbarController = TextEditingController();

  // void performSearch(String query) {
  //   Navigator.pushNamed(context, '/result', arguments: query);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 58, 58, 58),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              // SearchTextFieldFeedsPage(
              //   controller: searchbarController,
              //   hintText: 'Find Property, Land, and more...',
              //   obscureText: false,
              // ),

              // IconButton(
              //   icon: Icon(Icons.filter_alt),
              //   onPressed: showModalBottomSheet(
              //     context: context,
              //     builder: (context) => buildSheet()),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // buildButton(
                  //   text: 'testing',
                  //   onClicked: () => showModalBottomSheet(
                  //     isScrollControlled: true,
                  //     backgroundColor: Colors.transparent,
                  //     context: context,
                  //     builder: (context) => buildSheet(),
                  //   ),
                  // )

                  IconButton(
                    icon: Icon(Icons.filter_alt),
                    onPressed: () {},
                  )
                ],
              ),

              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 20,
              ),
              for (int i = 1; i < 5; i++)
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Container(
                    width: double.infinity,
                    height: 430.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
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
                                title: Text(
                                  'Bambang',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text('10 jam yang lalu'),
                                trailing: IconButton(
                                  icon: Icon(Icons.more_horiz),
                                  color: Colors.black,
                                  onPressed: () {},
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10.0),
                                child: Text(
                                    'Dicari rumah seperti dibawah ini (ga terlalu mirip gapapa) wilayah JABODETABEK.'),
                              ),
                              Container(
                                margin: EdgeInsets.all(10.0),
                                width: double.infinity,
                                height: 200.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/property 1.png'),
                                      fit: BoxFit.fitWidth,
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 55.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            IconButton(
                                              icon: Icon(Icons.favorite_border),
                                              iconSize: 35.0,
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 150,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            IconButton(
                                              icon: Icon(Icons.chat),
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
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => Container(
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
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 205, 166, 122)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        hintText: 'Lokasi Properti',
                        // suffixIcon: Icon(Icons.search_rounded),
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Color.fromARGB(255, 184, 184, 184),
                  thickness: 1.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                  child: Text(
                    'Rentang Sewa',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 20.0),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        child: Text('harian',
                            style: TextStyle(
                                color: Color.fromARGB(255, 121, 121, 121))),
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(
                                        color: Color.fromARGB(
                                            255, 205, 166, 122))))),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        child: Text('mingguan',
                            style: TextStyle(
                                color: Color.fromARGB(255, 121, 121, 121))),
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(
                                        color: Color.fromARGB(
                                            255, 205, 166, 122))))),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        child: Text('bulanan',
                            style: TextStyle(
                                color: Color.fromARGB(255, 121, 121, 121))),
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(
                                        color: Color.fromARGB(
                                            255, 205, 166, 122))))),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        child: Text('3 bulan',
                            style: TextStyle(
                                color: Color.fromARGB(255, 121, 121, 121))),
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(
                                        color: Color.fromARGB(
                                            255, 205, 166, 122))))),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        child: Text('6 bulan',
                            style: TextStyle(
                                color: Color.fromARGB(255, 121, 121, 121))),
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(
                                        color: Color.fromARGB(
                                            255, 205, 166, 122))))),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        child: Text('tahunan',
                            style: TextStyle(
                                color: Color.fromARGB(255, 121, 121, 121))),
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(
                                        color: Color.fromARGB(
                                            255, 205, 166, 122))))),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        child: Text('semua',
                            style: TextStyle(
                                color: Color.fromARGB(255, 121, 121, 121))),
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(
                                        color: Color.fromARGB(
                                            255, 205, 166, 122))))),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Color.fromARGB(255, 184, 184, 184),
                  thickness: 1.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Kisaran Harga (Rp)',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    SizedBox(
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
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 205, 166, 122)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade400),
                                  ),
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 10.0),
                                  hintText: '',
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
                Divider(
                  color: Color.fromARGB(255, 184, 184, 184),
                  thickness: 1.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Rentang Area (meter persegi)',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    SizedBox(
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
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 205, 166, 122)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade400),
                                  ),
                                  fillColor: Colors.grey.shade200,
                                  filled: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 10.0),
                                  hintText: '',
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
                Divider(
                  color: Color.fromARGB(255, 184, 184, 184),
                  thickness: 1.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Jumlah Kamar Tidur',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
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
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 205, 166, 122)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
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
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 205, 166, 122)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 10.0),
                              hintText: '',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text('Pasang Iklan'),
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 205, 166, 122)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(
                                        color: Color.fromARGB(
                                            255, 205, 166, 122))))),
                  ),
                )
              ],
            ),
          ));
}
