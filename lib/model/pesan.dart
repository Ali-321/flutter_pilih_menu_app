import 'package:flutter_pilih_menu_app/model/makanan.dart';

class Pesan {
  Makanan pesanMakanan = Makanan(gambar: '', nama: '', harga: 0, deskripsi: '');
  int jmlPesan = 0;

  Pesan({required this.pesanMakanan, required this.jmlPesan});
}
