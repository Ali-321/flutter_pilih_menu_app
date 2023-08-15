import 'package:flutter/material.dart';
import 'package:flutter_pilih_menu_app/main.dart';
import 'package:flutter_pilih_menu_app/model/pesan.dart';
import 'package:flutter_pilih_menu_app/screen/menu.dart';

class DPesan extends StatelessWidget {
  final Pesan pesan;
  const DPesan({super.key, required this.pesan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesan"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${pesan.pesanMakanan.nama} \n Rp ${pesan.pesanMakanan.harga} X ${pesan.jmlPesan} \n Berhasil Disimpan \n Total Bayar :\n Rp ${hargaTot()}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, height: 2),
            ),
            ElevatedButton(
                onPressed: () => {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const MyApp()),
                          (Route<dynamic> route) => false)
                    },
                child: const Text('Kembali ke Menu')),
          ],
        ),
      ),
    );
  }

  int hargaTot() {
    return pesan.pesanMakanan.harga * pesan.jmlPesan;
  }
}
