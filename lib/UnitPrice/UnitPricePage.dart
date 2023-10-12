import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class UnitPrice extends StatefulWidget {
  final String username;

  UnitPrice({required this.username});

  @override
  State<UnitPrice> createState() => _UnitPriceState();
}

class _UnitPriceState extends State<UnitPrice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
                stops: [0, 0.3, 0.6, 1],
                colors: [
                  Color.fromARGB(255, 255, 0, 0),
                  Colors.white.withOpacity(0.8),
                  Colors.white.withOpacity(0.6),
                  Colors.white.withOpacity(0.4),
                ],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          Column(
            children: [
              AppBar(
                title: Text(
                  "Unit Price Page",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 19 / 16,
                    letterSpacing: 0.1,
                    color: Colors.black87,
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
              Expanded(
                child: ListView(
                  children: [
                    CustomExpansionTile(
                      logoPath: 'assets/images/1_Pekerjaan persiapan.png',
                      uraianPekerjaan: "Pekerjaan Persiapan",
                      subBab: [
                        "(K3) Pembersihan 1 m2 Lapangan dan Peralatan Rp 18,209",
                        "Pengukuran dan Pemasangan 1m' Bouwplank Rp 182,333",
                        "(K3) Pembuatan 1m2 Gudang Semen dan Peralatan Rp 1,846,393",
                      ],
                    ),
                    CustomExpansionTile(
                      logoPath: 'assets/images/2_Pekerjaan pondasi.png',
                      uraianPekerjaan: "Pekerjaan Pondasi",
                      subBab: [
                        "Penggalian 1 m3 Tanah Pondasi Rp 81,627",
                        "Pengurugan Kembali 1 m3 Galian Tanah Rp 29,825",
                        "Pengurugan 1 m3 dengan Pasir Urug Rp 240,893",
                        "(K3) Pemasangan 1 m3 Batu Kosong (Aanstamping) Rp 597,788",
                        "Pasang Pondasi Batu Kali, 1Pc 6Ps Rp 976,417",
                        "Pengurugan Surtu Padat Untuk Peninggi Lantai Bangunan Rp 156,851",
                      ],
                    ),
                    CustomExpansionTile(
                      logoPath: 'assets/images/3_Pekerjaan beton',
                      uraianPekerjaan: "Pekerjaan Beton	",
                      subBab: [
                        "Membuat 1 m3 Beton Bertulang Campuran 1 : 2 : 3 Rp 16,024,305 ",
                        "Pembesian 10 kg dengan Besi Polos atau Besi Ulir	 Rp 15,325 ",
                        "Pemasangan 1 m2 Bekisting untuk Sloof Rp 273,647 ",
                        "Pemasangan 1 m2 Bekisting untuk Kolom Rp 797,996 ",
                        "Pemasangan 1 m2 Bekisting untuk Balok Rp 849,795 ",
                        "Pembongkaran 1m3 Bekisting dan Penyiraman Beton Rp 5,180 ",
                      ],
                    ),
                    CustomExpansionTile(
                      logoPath: 'assets/images/4_Pekerjaan dinding.png',
                      uraianPekerjaan: "Pekerjaan Dinding	",
                      subBab: [
                        "Pemasangan 1 m2 Dinding Bata Merah Tebal 1/2 Batu Campuran 1SP : 4PP Rp 132,761 ",
                        "Pemasangan 1 m2 Dinding Bata Merah Tebal 1/2 Batu Campuran 1SP : 2PP Rp 145,736 ",
                        "Pemasangan 1 m2 Plesteran 1SP : 4PP Tebal 15 mm Rp 73,428 ",
                        "Pemasangan 1 m2 Plesteran 1SP : 2PP Tebal 15 mm Rp 79,986 ",
                        "Pemasangan 1 m2 Acian Rp 42,598 ",
                        "Benangan Rp 33,671 ",
                        "Pemasangan 1 m2 Dinding Keramik 10cm x 20cm Rp 1,203,708 ",
                      ],
                    ),
                    CustomExpansionTile(
                      logoPath: '5_Pekerjaan kusen pintu dan jendela.png',
                      uraianPekerjaan: "Pekerjaan Pintu dan Jendela	",
                      subBab: [
                        "Pembuatan 1 m3 Kusen Pintu / Jendela Kayu Kamper Rp 7,519,626 ",
                        "Mengerjakan 1 m2 Daun Pintu dan Daun Jendela Panel Rp 684,479 ",
                        "Pemasangan 1 bh Engsel Pintu Rp 84,354 ",
                        "Pemasangan 1 bh Engsel Jendela Rp 43,955 ",
                        "Pemasangan 1 bh Kait Angin Rp 50,522 ",
                        "Pemasangan Grendel Pintu Rp 65,031 ",
                        "Pemasangan Grendel Jendela	Rp 39,056 ",
                        "Pemasangan 1 bh Kunci Tanam Biasa Rp 274,483 ",
                        "Pemasangan 1 m2 Kaca Tebal 5mm	 Rp 282,441 ",
                      ],
                    ),
                    CustomExpansionTile(
                      logoPath: '6_Pekerjaan plafond.png',
                      uraianPekerjaan: "Pekerjaan Atap",
                      subBab: [
                        "Pemasangan m2 Atap Besi Hollow Rp 349,056 ",
                      ],
                    ),
                    CustomExpansionTile(
                      logoPath: '7_Pekerjaan lantai.png',
                      uraianPekerjaan: "Pekerjaan Lantai",
                      subBab: [
                        "Pemasangan Lantai Keramik Ukuran 30 x 30 cm Putih Rp 297,250 ",
                        "Pemasangan Lantai Keramik Ukuran 20 x 20 cm Warna/ Motif	Rp 314,644 ",
                      ],
                    ),
                    CustomExpansionTile(
                      logoPath: '8_Pekerjaan cat.png',
                      uraianPekerjaan: "Pekerjaan Cat",
                      subBab: [
                        "Pengecatan 1 m2 Tembok Baru ( 1 Lapis Plamir, 1 Lapis Cat Dasar, 2 Lapis Cat Penutup )	Rp 34,774 ",
                        "Pengecetan 1 m2 Bidang Kayu Baru ( 1 Lapis Plamir, 1 Lapis Cat Dasar, 2 Lapis Cat Penutup ) Rp 71,085 ",
                        "Pengecetan Plafond ( 1 Lapis Plamir, 1 Lapis Cat Dasar, 2 Lapis Cat Penutup ) Rp 30,567 ",
                      ],
                    ),
                    CustomExpansionTile(
                      logoPath: '9_Pekerjaan elektrikal.png',
                      uraianPekerjaan: "Pekerjaan Elektrikal",
                      subBab: [
                        "(K3) Pemasangan 1 Buah Titik Lampu Rp 713,491 ",
                        "(K3) Pemasangan 1 Buah MCB	Rp 378,211 ",
                        "Pemasangan Stop Kontak	Rp 280,493 ",
                        "Pemasangan Saklar Tunggal Rp 233,645 ",
                        "Pemasangan Saklar Ganda Rp 286,237 ",
                        "Pemasangan Lampu Jari Essential 10 Watt esk. Philips	Rp 86,474 ",
                      ],
                    ),
                    CustomExpansionTile(
                      logoPath: 'assets/images/10_Pekerjaan mekanikal.png',
                      uraianPekerjaan: "Pekerjaan Mekanikal",
                      subBab: [
                        "Pemasangan 1 m' Pipa PVC Tipe AW Diameter 1 Rp 29,238 ",
                        "Pemasangan 1 m' Pipa PVC Tipe AW Diameter 3 Rp 65,026 ",
                        "Pemasangan 1 m' Pipa PVC Tipe AW Diameter 4 Rp 193,496 ",
                        "Pemasangan 1 Buah Closed Jongkok Teraso Rp 626,519 ",
                        "Pemasangan 1 Buah Kran Diameter 1/2 atau 3/4 Rp 102,132 ",
                        "Pemasangan 1 Buah Floor Drain Rp 72,918 ",
                        "Pemasangan 1 Buah Bak Cuci Piring Stainlessteel Rp 651,265 ",
                        "Pemasangan Septic Tank Biological Filter V = 1.800 L Unit Rp 6,228,720 ",
                        "Sumur Resapan Dalam 10 m Diameter 100 cm ( per titik ) Rp 16,476,192 ",
                      ],
                    ),
                    // Tambahkan CustomExpansionTile lainnya di sini sesuai kebutuhan
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomExpansionTile extends StatelessWidget {
  final String uraianPekerjaan;
  final List<String> subBab;
  final String logoPath; // Tambahkan setter dan getter untuk logo

  CustomExpansionTile({
    required this.uraianPekerjaan,
    required this.subBab,
    required this.logoPath, // Tambahkan logoPath ke konstruktor
  });

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Ganti warna latar belakang sesuai kebutuhan
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 3), // Ubah bayangan sesuai kebutuhan
              ),
            ],
          ),
          child: Column(
            // Mengubah menjadi Column untuk membuat tombol Expanded masuk ke dalam card
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Tambahkan CircleAvatar (logo)
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          logoPath), // Gunakan logoPath yang disediakan
                      radius: 16, // Sesuaikan ukuran avatar
                    ),
                    SizedBox(width: 8),
                    Text(
                      uraianPekerjaan,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        height: 15 / 12,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ),
              Expandable(
                collapsed: Container(), // Tombol Expanded di dalam Card
                expanded: Container(), // Tombol Expanded di dalam Card
              ),
            ],
          ),
        ),
      ),
      collapsed: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Ganti warna latar belakang sesuai kebutuhan
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(""),
      ), // Tambahkan widget sesuai kebutuhan
      expanded: Padding(
        padding: const EdgeInsets.only(left: 12, bottom: 8, right: 50),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 2,
          child: Column(
            children: subBab.map((String sub) {
              return ListTile(
                title: Text(
                  sub,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 15 / 12,
                    letterSpacing: 0,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
