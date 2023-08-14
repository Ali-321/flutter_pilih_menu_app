import 'package:flutter/material.dart';

class DMenu extends StatefulWidget {
  final String gambar;
  final String nama;
  final int harga;
  final String deskripsi;

  const DMenu({
    Key? key,
    required this.gambar,
    required this.nama,
    required this.harga,
    required this.deskripsi,
  }) : super(key: key);

  @override
  State<DMenu> createState() => _DMenuState();
}

class _DMenuState extends State<DMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Text(widget.nama),
          ),
          Container(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(widget.gambar))
        ],
      ),
    );
  }
}
