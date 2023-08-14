import 'package:flutter/material.dart';
import 'package:flutter_pilih_menu_app/detail_menu/d_menu.dart';
import 'package:flutter_pilih_menu_app/makanan.dart';

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
            'https://img.kurio.network/9qUFQUaXmVxMwsEe4uNT8nezbnM=/1200x900/filters:quality(80)/https://kurio-img.kurioapps.com/21/02/16/c2a5f95d-badc-4fd3-8d81-cfed0801a6e8.jpe'),
    const Makanan(
        nama: 'Ayam Bakar',
        harga: 5000,
        deskripsi: 'Ayam dibakar kecap',
        gambar:
            'https://img.kurio.network/9qUFQUaXmVxMwsEe4uNT8nezbnM=/1200x900/filters:quality(80)/https://kurio-img.kurioapps.com/21/02/16/c2a5f95d-badc-4fd3-8d81-cfed0801a6e8.jpe'),
    const Makanan(
        nama: 'sate ayam',
        harga: 2000,
        deskripsi:
            'Ayam dipotong menjadi bagian kecil ditusuk dengan kayu dan dibakar',
        gambar:
            'https://img.kurio.network/9qUFQUaXmVxMwsEe4uNT8nezbnM=/1200x900/filters:quality(80)/https://kurio-img.kurioapps.com/21/02/16/c2a5f95d-badc-4fd3-8d81-cfed0801a6e8.jpe'),
    const Makanan(
        nama: 'sate kambing',
        harga: 5000,
        deskripsi:
            'Kambing di potong menjadi bagian kecil ditusuk dengan kayu dan dibakar',
        gambar:
            'https://img.kurio.network/9qUFQUaXmVxMwsEe4uNT8nezbnM=/1200x900/filters:quality(80)/https://kurio-img.kurioapps.com/21/02/16/c2a5f95d-badc-4fd3-8d81-cfed0801a6e8.jpe'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 80,
              alignment: Alignment.bottomLeft,
              child: const Text("Pilih Menu",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
          ),
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
                                '${items[index].harga}',
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
                                      DMenu(
                                          gambar: items[index].gambar,
                                          nama: items[index].nama,
                                          harga: items[index].harga,
                                          deskripsi: items[index].deskripsi);
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
