import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MaterialBangunanPage extends StatefulWidget {
  final String username;

  MaterialBangunanPage({required this.username});

  @override
  State<MaterialBangunanPage> createState() => _MaterialBangunanPageState();
}

class _MaterialBangunanPageState extends State<MaterialBangunanPage> {
  String selectedCategory = 'Struktur';

  final List<String> categories = [
    'Struktur',
    'Arsitektur',
    'MEP',
  ];

  final Map<String, List<String>> categoryContent = {
    'Struktur': [
      'beton adalah sebuah bahan bangunan komposit yang terbuat dari kombinasi aggregat dan pengikat semen. Bentuk paling umum dari beton adalah beton semen Portland, yang terdiri dari agregat mineral (biasanya kerikil dan pasir), semen dan air.',
      'Baja adalah logam paduan berbahan dasar besi. Besi murni mempunyai sifat yang kurang kuat dan mudah berkarat, namun memiliki tingkat keuletan yang tinggi. Logam besi pada baja dipadukan dengan beberapa elemen lainnya, termasuk unsur karbon untuk memodifikasi karakteristiknya.',
      'Material ini digunakan untuk membuat struktur bangunan sebagai penyangga sebelum bangunan tersebut jadi. Umumnya, kayu dipakai untuk membuat bagian pondasi dan juga penyangga atap bangunan. Namun, kayu yang dipilih tentunya harus kuat sehingga tidak mudah rapuh diterpa berbagai cuaca.',
      'Salah satu struktur bangunan yaitu tulangan yang umumnya terbuat dari besi beton. Material ini terbilang kuat untuk menahan beban bangunan skala kecil seperti rumah keluarga. Nantinya tulangan ini diikat menggunakan besi ulir sehingga kuat menahan goncangan.',
      'Batu kali adalah batu alam yang terbentuk dari kikisan air yang terjadi secara terus-menerus. Meski tidak ada pilihan warna yang menarik, bahan ini mudah ditemukan dan tersedia dalam berbagai ukuran sehingga banyak digunakan untuk berbagai kebutuhan konstruksi seperti pertamanan, pondasi dan drainase.',
    ],
    'Arsitektur': [
      'plastik sebagai bahan, dan juga sumber utama penggunaan arsitektur , dengan tautan ke sumber daya lebih lanjut untuk masing-masing. Dan juga bahan furniture yang berguna untuk menambah keindahan ruangan.',
      'Bahan kita yang paling banyak digunakan untuk mencapai transparansi dan cahaya tanpa kaca, salah satu elemen fasad yang paling umum digunakan dalam arsitektur kontemporer. Beberapa di antaranya mengambil langkah lebih jauh, mencoba memperluas propertinya untuk menciptakan kaca responsif “cerdas”',
      'Penggunaan bambu umumnya ditentukan oleh lokasi geografis dari proyek arsitektural. Di lokasi di mana bambu masuk akal, ini adalah bahan yang sangat fleksibel, kuat , berkelanjutan yang bisa berguna dalam banyak hal.',
      'Mencerminkan segala sesuatu tentang usaha untuk kemajuan material baru kita adalah serat karbon : “lima kali lebih kuat dari baja, dua kali lebih kaku, dengan berat lebih sedikit.” Komposisi serat karbon membuatnya fleksibel untuk digunakan, memungkinkannya mengambil bentuk dari permukaan hingga batang , tergantung pada kebutuhan',
      'Dengan semua kenaikan tinggi yang melonjak tinggi di atas bumi, fasad fotovoltaik yang mengasyikkan belum menjadi norma. Karena evolusi teknologi fotovoltaik , sel mungkin tidak lagi harus terkunci di atas atap. Buku panduan desain International Energy Agency untuk photovoltaic di gedung-gedung telah tersedia secara online gratis.',
      'Menciptakan lingkungan termal yang pasif , melindungi dari hujan dan mencampur ke lingkungan alami yang serupa hanyalah beberapa hal yang bisa dilakukan jerami . Tak heran atap jerami begitu populer di masa lalu.',
    ],
    'MEP': [
      'Pipa PVC adalah jenis produk pipa termoplastik yang terbuat dari polymer PVC (Polyvinyl Chloride). Karena berbahan PVC, maka pipa ini memiliki sifat lentur, fleksibel, dan tidak mudah rusak. Pipa PVC dibanderol dengan harga yang murah dan pada saat proses pemasangannya mudah untuk dirangkai.',
      'Media untuk menghantarkan arus listrik yang terdiri dari Konduktor dan Isolator. Konduktor atau bahan penghantar listrik yang biasanya digunakan oleh Kabel Listrik adalah bahan Tembaga dan juga yang berbahan Aluminium meskipun ada juga yang menggunakan Silver (perak) dan emas sebagai bahan konduktornya namun bahan-bahan tersebut jarang digunakan karena harganya yang sangat mahal.',
    ],
  };

  final Map<String, List<String>> categoryImages = {
    'Struktur': [
      'assets/images/Stuktur1.jpg',
      'assets/images/Stuktur2.jpg',
      'assets/images/Stuktur3.jpg',
      'assets/images/Stuktur4.jpg',
      'assets/images/Stuktur5.jpg',
    ],
    'Arsitektur': [
      'assets/images/Arsitektur1.jpg',
      'assets/images/Arsitektur2.jpg',
      'assets/images/Arsitektur3.jpg',
      'assets/images/Arsitektur4.jpg',
      'assets/images/Arsitektur5.jpg',
      'assets/images/Arsitektur6.jpg',
    ],
    'MEP': [
      'assets/images/MEP1.png',
      'assets/images/MEP2.jpg',
    ],
  };

  final Map<String, List<String>> categoryName = {
    'Struktur': [
      'Beton Segar (Beton Cair)',
      'Baja Struktur',
      'Kayu balok',
      'Besi Beton (besi Tulangan)',
      'Batuan Kali',
    ],
    'Arsitektur': [
      'Plastik',
      'Kaca',
      'Bambu',
      'Serat Karbon',
      'Sel Fotovoltaik',
      'Jerami',
    ],
    'MEP': [
      'Pipa Pvc',
      'Kabel listrik',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Material Page",
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
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
              stops: [0, 0.5, 0.0, 0.0],
              colors: [
                Color.fromARGB(255, 255, 0, 0),
                Colors.white.withOpacity(0.1),
                Colors.white.withOpacity(0.1),
                Colors.white.withOpacity(0.1),
              ],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Container(
            color: Colors
                .transparent, // Background color for the category selection bar
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  final isSelected = selectedCategory == category;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.red : Colors.white10,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: Colors.red.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ]
                              : [],
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
                stops: [0, 0.25, 0.0, 0.0],
                colors: [
                  Color.fromARGB(255, 255, 0, 0),
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.1),
                ],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: StaggeredGridView.countBuilder(
                mainAxisSpacing: 16.0, // Jarak vertikal antara item
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 1, // Satu kolom
                itemCount: categoryContent[selectedCategory]?.length ?? 0,
                itemBuilder: (ctx, index) {
                  final contentItem =
                      categoryContent[selectedCategory]?[index] ?? '';
                  final imageUrl = categoryImages[selectedCategory]
                          ?[index % categoryImages[selectedCategory]!.length] ??
                      '';
                  final nameItem = categoryName[selectedCategory]?[index] ?? '';
                  return Container(
                    child: Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            imageUrl,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              nameItem,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              contentItem,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
