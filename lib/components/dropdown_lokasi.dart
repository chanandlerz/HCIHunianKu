import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDownLokasi extends StatefulWidget {
  final Function(String) onSelected;

  const DropDownLokasi({required this.onSelected});
  @override
  State<DropDownLokasi> createState() => _DropDownLokasiState();
}

class _DropDownLokasiState extends State<DropDownLokasi> {
  String selectedValue = "Kota Administrasi Jakarta Timur";
  //widget.onSelected(value!);

  @override
  void initState() {
    super.initState();
    //widget.onSelected(selectedValue);
    Future.delayed(Duration.zero, () {
      _onChanged(selectedValue);
    });
  }

  void _onChanged(String? value) {
    setState(() {
      selectedValue = value!;
      print(selectedValue);
    });

    widget.onSelected(value!);
  }

  final List<String> items = [
    'Ambon',
    'Balikpapan',
    'Banda Aceh',
    'Bandar Lampung',
    'Bandung',
    'Banjar',
    'Banjarbaru',
    'Banjarmasin',
    'Batam',
    'Batu',
    'Baubau',
    'Bekasi',
    'Bengkulu',
    'Bima',
    'Binjai',
    'Bitung',
    'Blitar',
    'Bogor',
    'Bontang',
    'Bukittinggi',
    'Cilegon',
    'Cimahi',
    'Cirebon',
    'Denpasar',
    'Depok',
    'Dumai',
    'Gorontalo',
    'Gunungsitoli',
    'Jambi',
    'Jayapura',
    'Kediri',
    'Kendari',
    'Kota Administrasi Jakarta Barat',
    'Kota Administrasi Jakarta Pusat',
    'Kota Administrasi Jakarta Selatan',
    'Kota Administrasi Jakarta Timur',
    'Kota Administrasi Jakarta Utara',
    'Kotamobagu',
    'Kupang',
    'Langsa',
    'Lhokseumawe',
    'Lubuklinggau',
    'Madiun',
    'Magelang',
    'Makassar',
    'Malang',
    'Manado',
    'Mataram',
    'Medan',
    'Metro',
    'Mojokerto',
    'Nusantara',
    'Padang',
    'Padang Panjang',
    'Padangsidimpuan',
    'Pagar Alam',
    'Palangka Raya',
    'Palembang',
    'Palopo',
    'Palu',
    'Pangkalpinang',
    'Parepare',
    'Pariaman',
    'Pasuruan',
    'Payakumbuh',
    'Pekalongan',
    'Pekanbaru',
    'Pematangsiantar',
    'Pontianak',
    'Prabumulih',
    'Probolinggo',
    'Sabang',
    'Salatiga',
    'Samarinda',
    'Sawahlunto',
    'Semarang',
    'Serang',
    'Sibolga',
    'Singkawang',
    'Solok',
    'Sorong',
    'Subulussalam',
    'Sukabumi',
    'Sungai Penuh',
    'Surabaya',
    'Surakarta',
    'Tangerang',
    'Tangerang Selatan',
    'Tanjungbalai',
    'Tanjungpinang',
    'Tarakan',
    'Tasikmalaya',
    'Tebing Tinggi',
    'Tegal',
    'Ternate',
    'Tidore Kepulauan',
    'Tomohon',
    'Tuai',
    'Yogyakarta',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: const Row(
          children: [
            Icon(
              Icons.list,
              size: 16,
              color: Colors.white,
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                'Pilih Lokasi Properti',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: items
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: selectedValue,
        // onChanged: (String? value) {
        //   setState(() {
        //     selectedValue = value;
        //   });
        // },
        onChanged: _onChanged,
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: 160,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.transparent,
            ),
            color: Color.fromARGB(255, 205, 166, 122),
          ),
          elevation: 2,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.white,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Color.fromARGB(255, 205, 166, 122),
          ),
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 50,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
