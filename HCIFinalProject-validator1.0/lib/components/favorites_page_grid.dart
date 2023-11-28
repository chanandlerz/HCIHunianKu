import 'package:flutter/material.dart';

class FavoritesWidget extends StatelessWidget {
  const FavoritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        // for (int i = 1; i < 11; i++)
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       padding: EdgeInsets.all(5),
              //       decoration: BoxDecoration(

              //       ),
              //     )
              //   ],
              // )

              InkWell(
                onTap: () {},
                child: Container(
                    margin: EdgeInsets.all(1),
                    child:
                        // Image.network(
                        //     'https://blog.psinv.net/wp-content/uploads/2023/06/1-e1686983943196.jpg',
                        //     height: 110,
                        //     width: 500),
                        Image.asset(
                      'assets/property 1.png',
                      height: 110,
                      width: 500,
                    )),
              ),

              Container(
                padding: EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: Text(
                  "3 hari yang lalu",
                  style: TextStyle(
                      fontSize: 8, color: Color.fromARGB(255, 184, 184, 184)),
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "RP. 1.8 Miliar",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pasar Rebo, Jakarta Timur",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Rumah Dijual",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.bed,
                    color: Colors.white,
                    size: 15,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.pink,
                  )
                ],
              ),

              SizedBox(
                height: 5,
              ),

              Container(
                height: 30,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 205, 166, 122),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Hubungi Penjual",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              )
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       padding: EdgeInsets.all(5),
              //       decoration: BoxDecoration(

              //       ),
              //     )
              //   ],
              // )

              InkWell(
                onTap: () {},
                child: Container(
                    margin: EdgeInsets.all(1),
                    child:
                        // Image.network(
                        //     'https://blog.psinv.net/wp-content/uploads/2023/06/1-e1686983943196.jpg',
                        //     height: 110,
                        //     width: 500),
                        Image.asset(
                      'assets/property 1.png',
                      height: 110,
                      width: 500,
                    )),
              ),

              Container(
                padding: EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: Text(
                  "3 hari yang lalu",
                  style: TextStyle(
                      fontSize: 8, color: Color.fromARGB(255, 184, 184, 184)),
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "RP. 1.8 Miliar",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pasar Rebo, Jakarta Timur",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Rumah Dijual",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.bed,
                    color: Colors.white,
                    size: 15,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.pink,
                  )
                ],
              ),

              SizedBox(
                height: 5,
              ),

              Container(
                height: 30,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 205, 166, 122),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Hubungi Penjual",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
