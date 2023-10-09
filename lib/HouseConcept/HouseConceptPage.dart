import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HouseConceptPage extends StatefulWidget {
  final String username;

  HouseConceptPage({required this.username});
  @override
  State<HouseConceptPage> createState() => _HouseConceptPageState();
}

class _HouseConceptPageState extends State<HouseConceptPage> {
  // Daftar gambar konsep rumah
  final List<String> houseConceptImages = [
    'assets/images/Concept1.jpg',
    'assets/images/Concept2.jpg',
    'assets/images/Concept3.jpg',
    'assets/images/Concept4.jpg',
    'assets/images/Concept5.jpg',
    'assets/images/Concept6.jpg',
    'assets/images/Concept7.jpg',
    'assets/images/Concept8.jpg',
  ];

  // Daftar jenis rumah sesuai dengan indeks gambar
  final List<String> houseTypes = [
    'Minimalis',
    'Modern',
    'Modern Tropis',
    'Italian Klasik',
    'Amerikan klasik',
    'Kontemporer',
    'Skandinavia',
    'Industrial',
  ];

  double _generateRandomHeight() {
    final random = Random();
    // Tinggi gambar antara 100 dan 250
    return 100.0 + random.nextDouble() * 150.0;
  }

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
                  "House Concept Page",
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 4, right: 4, bottom: 16),
                        child: StaggeredGridView.countBuilder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          itemCount: houseConceptImages.length,
                          itemBuilder: (ctx, index) {
                            final imageUrl = houseConceptImages[index];
                            final houseType = houseTypes[index];
                            return Container(
                              child: Card(
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      imageUrl,
                                      height: _generateRandomHeight(),
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                    Positioned(
                                      bottom:
                                          8.0, // Sesuaikan dengan posisi yang Anda inginkan
                                      right:
                                          8.0, // Sesuaikan dengan posisi yang Anda inginkan
                                      child: Text(
                                        houseType,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                          color: Colors.white, // Warna teks
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
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
