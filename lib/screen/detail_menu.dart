import 'package:flutter/material.dart';
import 'package:flutter_pilih_menu_app/model/makanan.dart';
import 'package:flutter_pilih_menu_app/model/pesan.dart';
import 'package:flutter_pilih_menu_app/screen/detail_pesan.dart';

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
  late Pesan p;
  int jPesan = 0;
  @override
  Widget build(BuildContext context) {
    p = Pesan(
        pesanMakanan: Makanan(
            gambar: widget.gambar,
            nama: widget.nama,
            harga: widget.harga,
            deskripsi: widget.deskripsi),
        jmlPesan: jPesan);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
              padding: const EdgeInsets.all(20),
              height: 350,
              child: Image.network(widget.gambar)),
          ListTile(
            title: Text(widget.nama,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 34)),
            subtitle: Text(
              '${widget.deskripsi}\n Rp ${widget.harga}',
              textAlign: TextAlign.justify,
              style: const TextStyle(height: 1.5),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: btnKurang,
                    child: const Text(
                      "-",
                      style: TextStyle(fontSize: 30),
                    )),
                Text('${jPesan}'),
                ElevatedButton(
                    onPressed: btnTambah,
                    child: const Text(
                      "+",
                      style: TextStyle(fontSize: 30),
                    )),
              ],
            ),
          ),
          SizedBox(
            width: 280,
            child:
                ElevatedButton(onPressed: btnPesan, child: const Text('Pesan')),
          )
        ],
      ),
    );
  }

  void btnTambah() {
    setState(() {
      jPesan++;
    });
  }

  void btnKurang() {
    setState(() {
      if (jPesan != 0) {
        jPesan--;
      }
    });
  }

  void btnPesan() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DPesan(pesan: p)));
  }
}
