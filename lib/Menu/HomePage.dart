import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:halo_rumah_flutter/Menu/detail_page.dart';

class HomePage extends StatefulWidget {
  final String username;
  final String name;

  HomePage({
    required this.username,
    required this.name,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController _controller = CarouselController();
  final List<Widget> myData = [
    Image.asset('assets/images/House1.jpg'),
    Image.asset('assets/images/House2.jpg'),
    Image.asset('assets/images/House3.jpg'),
    Image.asset('assets/images/House6.jpg'),
    Image.asset('assets/images/House7.jpg'),
    Image.asset('assets/images/House8.jpg'),
  ];

  int _curent = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Text(
                  'Halo, ${widget.name}',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 19 / 16,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 32, bottom: 32, left: 32, top: 16),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Do you want a consultation?',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                height: 19 / 16,
                                letterSpacing: 0.1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Check In |',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 15 / 12,
                                letterSpacing: 0,
                              ),
                            ),
                            SizedBox(width: 8.0),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.pushNamed(context, '/consultation');
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                onPrimary: Colors.white,
                                shadowColor: Colors.red,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                minimumSize: Size(42, 42),
                              ),
                              child: Text(
                                'Check In',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  height: 15 / 12,
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Image.asset(
                              'assets/images/RUMAH.png',
                              height: 80,
                              width: 64,
                            ), // Spasi antara gambar dan teks
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          child: Text(
                            'HALO RUMAH',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontSize: 8.5,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 1.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 32,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Fitur',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 19 / 16,
                    letterSpacing: 0.1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.only(right: 16, left: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color.fromARGB(255, 216, 216, 216),
                      ),
                      child: IconButton(
                        icon: Image.asset(
                          'assets/images/AskExpert.png',
                          width: 50,
                          height: 50,
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.pushNamed(context, '/consultation');
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 8), // Spasi antara Container dan teks
                    Text(
                      'Consultation',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 15 / 12, // Line height / font size
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color.fromARGB(255, 216, 216, 216),
                      ),
                      child: IconButton(
                        icon: Image.asset(
                          'assets/images/HousePrice.png',
                          width: 50,
                          height: 50,
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.pushNamed(context, '/UnitPrice');
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 8), // Spasi antara Container dan teks
                    Text(
                      'Unit Price',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 15 / 12, // Line height / font size
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color.fromARGB(255, 216, 216, 216),
                      ),
                      child: IconButton(
                        icon: Image.asset(
                          'assets/images/DesainDetail.png',
                          width: 50,
                          height: 50,
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.pushNamed(context, '/HouseConcept');
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 8), // Spasi antara Container dan teks
                    Text(
                      'House Concept',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 15 / 12, // Line height / font size
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 32,
              left: 42,
              top: 32,
              bottom: 32,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color.fromARGB(255, 216, 216, 216),
                      ),
                      child: IconButton(
                        icon: Image.asset(
                          'assets/images/Material.png',
                          width: 50,
                          height: 50,
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.pushNamed(context, '/Material');
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 8), // Spasi antara Container dan teks
                    Text(
                      'Material',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 15 / 12, // Line height / font size
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color.fromARGB(255, 216, 216, 216),
                      ),
                      child: IconButton(
                        icon: Image.asset(
                          'assets/images/Furniture.png',
                          width: 50,
                          height: 50,
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.pushNamed(context, '/Furniture');
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 8), // Spasi antara Container dan teks
                    Text(
                      'Furniture',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 15 / 12, // Line height / font size
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color.fromARGB(255, 216, 216, 216),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.more_horiz),
                        onPressed: () {
                          setState(() {
                            Navigator.pushNamed(context, '/Other');
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 8), // Spasi antara Container dan teks
                    Text(
                      'Other',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 15 / 12, // Line height / font size
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider(
                items: myData,
                carouselController: _controller,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 1.5,
                  onPageChanged: (index, reason) {
                    setState(
                      () {
                        _curent = index;
                      },
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: myData.asMap().entries.map(
                  (entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_curent == entry.key ? 0.9 : 0.4),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildTappableCard(
                        context,
                        'assets/images/Berita1.jpg',
                        'Enam Langkah Sebelum Membangun Rumah',
                        'Sebelum Anda memulai proyek pembangunan rumah, ada enam langkah penting yang perlu Anda pertimbangkan. Pertama, pastikan Anda telah memiliki tanah yang akan menjadi lokasi rumah Anda. Memiliki tanah sendiri merupakan langkah awal yang krusial karena ini dapat membantu mengendalikan biaya konstruksi dan memberikan Anda kendali atas lokasi rumah impian Anda. Kedua, dalam upaya menciptakan rumah sesuai keinginan Anda, carilah referensi desain rumah yang cocok dengan anggaran yang telah Anda tentukan. Jika Anda memiliki preferensi desain tertentu, sangat disarankan untuk berkonsultasi dengan seorang arsitek atau penyedia jasa konstruksi yang kompeten.',
                        'Ketiga, buatlah rencana anggaran biaya (RAB) yang sangat teliti. RAB adalah komponen krusial dalam proyek pembangunan rumah. Pastikan untuk mencantumkan semua komponen biaya, termasuk cadangan dana sekitar 5-10% dari total anggaran untuk mengatasi perubahan atau kejutan selama proyek berlangsung. Rencana anggaran biaya juga harus mencakup faktor risiko seperti kemungkinan kecelakaan kerja, biaya material, biaya tenaga kerja, dan potensi kerusakan peralatan selama proses pembangunan.',
                        'Selanjutnya, langkah keempat adalah seleksi tenaga kerja atau tukang yang akan bekerja pada proyek Anda. Pilih tukang dengan cermat, pastikan mereka memiliki reputasi yang baik dan dapat dipercaya. Kualitas pekerjaan tukang sangat mempengaruhi hasil akhir rumah Anda. Kelima, atur jadwal proyek dengan baik. Membangun rumah adalah proyek yang memakan waktu, jadi Anda harus menyediakan waktu untuk mengawasi proyek atau berkomunikasi dengan pihak yang bertanggung jawab. Terakhir, pertimbangkan faktor cuaca dengan cermat. Memilih waktu yang tepat untuk memulai pembangunan rumah sangat penting. Sebaiknya rumah dibangun saat musim kemarau untuk menghindari gangguan cuaca yang dapat memengaruhi jadwal proyek. Dengan memperhatikan keenam langkah ini, Anda dapat memastikan bahwa proyek pembangunan rumah Anda berjalan lebih lancar, sesuai dengan rencana, dan menghasilkan rumah yang memuaskan.'),
                    buildTappableCard(
                        context,
                        'assets/images/Berita2.png',
                        'Berbagai Kesalahan Saat Membangun Rumah',
                        'Setelah memahami saran-saran yang diperlukan dalam membangun rumah, tak boleh diabaikan pula pemahaman mengenai kesalahan umum yang sering terjadi selama proses pembangunan. Kesalahan-kesalahan ini, jika tidak diperhatikan, dapat menghambat kelancaran proyek dan berpotensi menimbulkan kerugian. Salah satu kesalahan utama yang sering terjadi adalah kurangnya riset. Merupakan langkah penting untuk mengumpulkan sebanyak mungkin referensi dan ide sebelum memulai proyek pembangunan rumah. Meneliti dan mencari informasi yang relevan adalah langkah awal yang penting.',
                        'Kedua, kurangnya realisme dalam mengelola proyek dapat menjadi masalah. Penting untuk selalu mempertimbangkan berbagai aspek, termasuk anggaran dan faktor struktural, dengan penuh realisme. Memiliki pemahaman yang kuat tentang batasan dan kendala yang mungkin muncul selama proyek adalah kunci untuk menjalankannya dengan sukses.',
                        'Dalam keseluruhan proses pembangunan rumah, seringkali terjadi kesalahan seperti terburu-buru dalam pengambilan keputusan, pemilihan bahan yang tidak sesuai, pengabaian terhadap detail-detail kecil, ketidakterorganisasian, dan kurangnya komunikasi antarpihak yang terlibat dalam proyek. Semua kesalahan ini bisa mengganggu kelancaran proyek dan berdampak negatif pada hasil akhir. Dengan memahami dan menghindari kesalahan-kesalahan ini, Anda dapat mengurangi risiko penyesalan yang mungkin muncul setelah rumah selesai dibangun. Kesadaran tentang kesalahan-kesalahan ini adalah langkah penting menuju pembangunan rumah yang sukses dan memuaskan.'),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildTappableCard(
                        context,
                        'assets/images/Berita3.jpg',
                        'Seperti Apa Material Bangunan Rumah yang Berkualitas?',
                        'Saat membangun rumah, setiap orang pasti ingin memiliki hunian yang memenuhi aspek kenyamanan, keamanan, serta tahan lama. Namun untuk dapat mewujudkannya perlu perlakuan khusus, salah satunya memperhatikan kualitas material bangunan yang digunakan. Melansir dari unggahan akun Instagram National Affordable Housing Program (NAHP) Kementerian PUPR pada Senin, , selain detail ketentuan dalam elemen rumah, kualitas dari material juga sangat penting. Baca juga: Harga Bahan Bangunan Naik, Pasar Rumah Tapak Tetap Stabil Bahan bangunan yang dipergunakan saat konstruksi harus berkualitas baik, agar tujuan dari rumah aman dan tahan lama bisa terwujud. Adapun material yang dimaksud meliputi beton, mortar, batu pondasi, besi, batu bata, dan kayu. Berikut ulasan selengkapnya.',
                        'Penting untuk memahami kualitas material bangunan yang digunakan dalam konstruksi rumah. Dalam hal beton, perbandingan yang direkomendasikan adalah 1 semen: 2 pasir: 3 kerikil: 0,5 air. Semen tipe 1 berkualitas yang sesuai dengan Standar Nasional Indonesia (SNI) harus digunakan, dengan pastikan kemasannya tidak rusak. Penggunaan pasir yang bebas dari kandungan tanah, lumpur, atau bahan organik, terutama pasir dari sungai atau darat, sangat penting. Ukuran kerikil maksimum 20 milimeter dengan gradasi yang baik dan bebas dari kontaminan seperti tanah atau lumpur juga diperlukan untuk memastikan kualitas beton yang baik. Selain itu, mortar harus dicampur dengan perbandingan 1 semen: 4 pasir bersih: air secukupnya, dan pastikan pasir yang digunakan tidak mengandung lumpur yang dapat mengganggu ikatan dengan semen. Batu pondasi harus terbuat dari batu kali atau batu gunung dengan tekstur keras dan banyak sudut untuk memperkuat ikatan dengan mortar, dan batu bulat dapat dibelah untuk mendapatkan sudut yang tajam.',
                        'Selain itu, penggunaan besi dengan diameter minimal 10 milimeter untuk besi utama dan 8 milimeter untuk besi Sengkang sangat penting, dengan pastikan besi tersebut dalam kondisi baik, tidak berkarat, lurus, dan seragam. Batu bata yang berkualitas harus memiliki tepi yang lurus dan tajam, minim retakan, tahan patah, dimensi yang sesuai, dan seragam. Sebelum pemasangan, perendaman batu bata dalam air adalah langkah yang disarankan. Terakhir, pemilihan kayu yang berkualitas harus mencakup ciri-ciri seperti keras, kering, berwarna gelap, bebas dari retakan, dan memiliki bentuk yang lurus. Material non-struktur seperti atap yang baik terbuat dari seng, genteng, atau aspal (bitumen), sedangkan material plafon dapat menggunakan triplek, GRC, atau gypsum. Penting untuk diingat bahwa penggunaan material berbahan asbes tidak diperbolehkan karena berpotensi berbahaya bagi kesehatan. Dengan memperhatikan kualitas material seperti ini, Anda dapat memastikan bahwa konstruksi rumah Anda memenuhi standar yang dibutuhkan.'),
                    buildTappableCard(
                        context,
                        'assets/images/Berita4.jpg',
                        'Material Bangunan Rumah yang Berkualitas',
                        'Kualitas material bangunan merupakan faktor kunci dalam pembangunan rumah yang memengaruhi kenyamanan, keamanan, dan ketahanan jangka panjang. Beberapa contoh material bangunan berkualitas yang perlu diperhatikan termasuk beton, mortar, batu pondasi, besi, batu bata, dan kayu. Dalam penggunaan beton, perbandingan yang tepat adalah 1 semen: 2 pasir: 3 kerikil: 0,5 air, dengan menggunakan semen tipe 1 yang sesuai dengan Standar Nasional Indonesia (SNI). Pasir harus berasal dari sumber sungai atau darat dan harus bebas dari tanah, lumpur, atau bahan organik. Kerikil dengan ukuran maksimum 20 milimeter, gradasi yang baik, dan tanpa kontaminan juga penting. Demikian juga, campuran mortar harus memiliki perbandingan yang tepat dan pasir bersih bebas dari kandungan lumpur, yang dapat mengganggu ikatan dengan semen. Pondasi yang kokoh memerlukan penggunaan batu kali atau batu gunung dengan tekstur keras dan banyak sudut.',
                        'Selain itu, besi yang digunakan dalam konstruksi harus memiliki diameter minimal 10 milimeter untuk besi utama dan 8 milimeter untuk besi Sengkang, dan harus dalam kondisi baik, tidak berkarat, lurus, dan seragam. Batu bata berkualitas memiliki tepi yang lurus, minim retakan, dimensi yang sesuai, dan harus direndam dalam air sebelum pemasangan. Kayu yang berkualitas harus memenuhi kriteria seperti keras, kering, berwarna gelap, bebas dari retakan, dan lurus.',
                        'Tidak hanya material struktur, tetapi material non-struktur seperti atap dan plafon juga harus dipertimbangkan. Material atap yang baik termasuk seng, genteng, atau aspal (bitumen), sementara material plafon dapat berupa triplek, GRC, atau gypsum. Penting untuk menghindari penggunaan material berbahan asbes karena berpotensi berbahaya bagi kesehatan. Dengan memperhatikan pemilihan material berkualitas ini, Anda dapat memastikan bahwa rumah Anda memenuhi standar kenyamanan, keamanan, dan ketahanan yang diharapkan.'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTappableCard(BuildContext context, String imagePath, String title,
      String description1, String description2, String description3) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardContainerWidth = (screenWidth - 70) / 2;
    return Container(
      width: cardContainerWidth,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                  imagePath, title, description1, description2, description3),
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
