import 'package:flutter/material.dart';

class BedRoomPage extends StatefulWidget {
  final String username;

  BedRoomPage({required this.username});
  @override
  _BedRoomPageState createState() => _BedRoomPageState();
}

class _BedRoomPageState extends State<BedRoomPage> {
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
                  "Bed Room Furniture",
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
                    buildGridView("Single Beds", singleBeds),
                    buildGridView("Full, Queen and King Beds", quenKing),
                    buildGridView("Childern's beds", childernBed),
                    buildGridView("Bunk Beds", bunkBeds),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildGridView(String title, List<Map<String, dynamic>> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 8, bottom: 16),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Container(
            height: 200, // Sesuaikan tinggi sesuai kebutuhan
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return buildGridItem(item);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget buildGridItem(Map<String, dynamic> item) {
    return Container(
      width: 150, // Sesuaikan lebar sesuai kebutuhan
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            item['image'],
            width: double.infinity,
            height: 184, // Sesuaikan tinggi gambar sesuai kebutuhan
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  // Data untuk tabel
  final List<Map<String, dynamic>> singleBeds = [
    {
      'image': 'assets/images/singleBed1.jfif',
    },
    {
      'image': 'assets/images/singleBed2.jfif',
    },
    {
      'image': 'assets/images/singleBed3.jfif',
    },
    {
      'image': 'assets/images/singleBed4.jfif',
    },
    {
      'image': 'assets/images/singleBed5.jfif',
    },
    {
      'image': 'assets/images/singleBed6.jfif',
    },
    {
      'image': 'assets/images/singleBed7.jfif',
    },
    {
      'image': 'assets/images/singleBed8.jfif',
    },
    {
      'image': 'assets/images/singleBed9.jfif',
    },
    {
      'image': 'assets/images/singleBed10.jfif',
    },
    // Tambahkan data lainnya untuk tabel
  ];

  // Data untuk sofa
  final List<Map<String, dynamic>> quenKing = [
    {
      'image': 'assets/images/quuen&king1.jfif',
    },
    {
      'image': 'assets/images/quuen&king2.jfif',
    },
    {
      'image': 'assets/images/quuen&king3.jfif',
    },
    {
      'image': 'assets/images/quuen&king4.jfif',
    },
    {
      'image': 'assets/images/quuen&king5.jfif',
    },
    {
      'image': 'assets/images/quuen&king6.jfif',
    },
    {
      'image': 'assets/images/quuen&king7.jfif',
    },
    {
      'image': 'assets/images/quuen&king8.jfif',
    },
    {
      'image': 'assets/images/quuen&king9.jfif',
    },
  ];

  // Data untuk lampu
  final List<Map<String, dynamic>> childernBed = [
    {
      'image': 'assets/images/ChildrenBed1.jfif',
    },
    {
      'image': 'assets/images/ChildrenBed2.jfif',
    },
    {
      'image': 'assets/images/ChildrenBed3.jfif',
    },
    {
      'image': 'assets/images/ChildrenBed4.jfif',
    },
    {
      'image': 'assets/images/ChildrenBed5.jfif',
    },
    {
      'image': 'assets/images/ChildrenBed6.jfif',
    },
    {
      'image': 'assets/images/ChildrenBed7.jfif',
    },
    {
      'image': 'assets/images/ChildrenBed8.jfif',
    },
    // Tambahkan data lainnya untuk lampu
  ];

  // Data untuk lemari (cabinet)
  final List<Map<String, dynamic>> bunkBeds = [
    {
      'image': 'assets/images/BunkBed1.jfif',
    },
    {
      'image': 'assets/images/BunkBed2.jfif',
    },
    {
      'image': 'assets/images/BunkBed3.jfif',
    },
    {
      'image': 'assets/images/BunkBed4.jfif',
    },
    {
      'image': 'assets/images/BunkBed5.jfif',
    },
    {
      'image': 'assets/images/BunkBed6.jfif',
    },
    {
      'image': 'assets/images/BunkBed7.jfif',
    },
    {
      'image': 'assets/images/BunkBed8.jfif',
    },
    {
      'image': 'assets/images/BunkBed9.jfif',
    },
    {
      'image': 'assets/images/BunkBed10.jfif',
    },
  ];
}
