import 'package:flutter/material.dart';
import 'package:flutter_pilih_menu_app/screen/detail_menu.dart';
import 'package:flutter_pilih_menu_app/model/makanan.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final List<String> entries = <String>['A', 'B', 'C', 'D'];
  final List<int> colorCodes = <int>[600, 500, 100, 200];
  final List<Makanan> items = [
    const Makanan(
        nama: 'Tempe Bacem',
        harga: 2000,
        deskripsi: 'Tempe yang Dibacem',
        gambar:
            'https://paxelmarket.co/wp-content/uploads/2021/08/tempe-bacem-keluarga-isi-10-pcs.jpg'),
    const Makanan(
        nama: 'Ayam Bakar',
        harga: 1000,
        deskripsi: 'Ayam dibakar kecap',
        gambar:
            'https://img.kurio.network/9qUFQUaXmVxMwsEe4uNT8nezbnM=/1200x900/filters:quality(80)/https://kurio-img.kurioapps.com/21/02/16/c2a5f95d-badc-4fd3-8d81-cfed0801a6e8.jpe'),
    const Makanan(
        nama: 'sate ayam',
        harga: 2000,
        deskripsi:
            'Ayam dipotong menjadi bagian kecil ditusuk dengan kayu dan dibakar',
        gambar: 'https://kbu-cdn.com/dk/wp-content/uploads/sate-ayam.jpg'),
    const Makanan(
        nama: 'sate kambing',
        harga: 5000,
        deskripsi:
            'Kambing di potong menjadi bagian kecil ditusuk dengan kayu dan dibakar',
        gambar:
            'https://pict.sindonews.net/dyn/850/pena/news/2021/07/19/185/487252/bumbu-sate-kambing-kecap-pedas-ini-resep-lengkapnya-jrb.jpg'),
    const Makanan(
        nama: 'Sate Babi',
        harga: 20000,
        deskripsi:
            'Babi di potong menjadi bagian kecil ditusuk dengan kayu dan dibakar',
        gambar:
            'https://i.pinimg.com/1200x/df/92/f9/df92f9e0814a5ce0af92aa9f85261827.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pilih Menu')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: items.length,
                padding:
                    const EdgeInsets.only(top: 1, left: 8, right: 8, bottom: 1),
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: 130,
                          width: 150,
                          child: Image(
                            image: NetworkImage(items[index].gambar),
                            fit: BoxFit.fill,
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 150,
                        child: Stack(children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${items[index].nama}\n',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      height: 1.5,
                                      color: Colors.black),
                                ),
                                TextSpan(
                                  text: '${items[index].deskripsi} \n',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      height: 1.5,
                                      color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              alignment: Alignment.bottomLeft,
                              padding: EdgeInsets.only(bottom: 12),
                              child: Text(
                                'Rp ${items[index].harga}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black54,
                                    decorationStyle: TextDecorationStyle.solid),
                              )),
                          GestureDetector(
                            child: Container(
                                alignment: Alignment.bottomRight,
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      side: const BorderSide(width: 1.0),
                                    ),
                                    onPressed: () {
                                      //Navigator.of().removeUntil
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DMenu(
                                                  gambar: items[index].gambar,
                                                  nama: items[index].nama,
                                                  harga: items[index].harga,
                                                  deskripsi:
                                                      items[index].deskripsi)));
                                    },
                                    child: Text('Pesan'))),
                          )
                        ]),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
