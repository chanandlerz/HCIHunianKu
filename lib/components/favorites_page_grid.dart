import 'package:flutter/material.dart';

class FavoritesWidget extends StatelessWidget {
  const FavoritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        // for (int i = 1; i < 11; i++)
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
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
                    margin: const EdgeInsets.all(1),
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
                padding: const EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "3 hari yang lalu",
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "RP. 1.8 Miliar",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Pasar Rebo, Jakarta Timur",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Rumah Dijual",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.bed,
                    color: Colors.black,
                    size: 15,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.pink,
                  )
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 30,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 205, 166, 122),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Hubungi Penjual",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
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
                    margin: const EdgeInsets.all(1),
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
                padding: const EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "3 hari yang lalu",
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "RP. 1.8 Miliar",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Pasar Rebo, Jakarta Timur",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Rumah Dijual",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.bed,
                    color: Colors.black,
                    size: 15,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.pink,
                  )
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 30,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 205, 166, 122),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Hubungi Penjual",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
