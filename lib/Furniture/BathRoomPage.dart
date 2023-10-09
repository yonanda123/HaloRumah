import 'package:flutter/material.dart';

class BathRoomPage extends StatefulWidget {
  final String username;

  BathRoomPage({required this.username});
  @override
  _BathRoomPageState createState() => _BathRoomPageState();
}

class _BathRoomPageState extends State<BathRoomPage> {
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
                  "Living Room Furniture",
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
                    buildGridView("Toilets", toilets),
                    buildGridView("Cabinet and Shelving", cabshel),
                    buildGridView("Washbasins", washbasins),
                    buildGridView("Baths and Showers", bathshow),
                    buildGridView("Bathroom Accessories", bathaccess),
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
  final List<Map<String, dynamic>> toilets = [
    {
      'image': 'assets/images/Toilet1.jfif',
    },
    {
      'image': 'assets/images/Toilet2.jfif',
    },
    {
      'image': 'assets/images/Toilet3.jfif',
    },
    {
      'image': 'assets/images/Toilet4.jfif',
    },
    {
      'image': 'assets/images/Toilet5.jfif',
    },
    {
      'image': 'assets/images/Toilet6.jfif',
    },
    {
      'image': 'assets/images/Toilet7.jfif',
    },
    {
      'image': 'assets/images/Toilet8.jfif',
    },
    {
      'image': 'assets/images/Toilet9.jfif',
    },
    {
      'image': 'assets/images/Toilet10.jfif',
    },
    // Tambahkan data lainnya untuk tabel
  ];

  // Data untuk sofa
  final List<Map<String, dynamic>> cabshel = [
    {
      'image': 'assets/images/Cabshel1.jfif',
    },
    {
      'image': 'assets/images/Cabshel2.jfif',
    },
    {
      'image': 'assets/images/Cabshel3.jfif',
    },
    {
      'image': 'assets/images/Cabshel4.jfif',
    },
    {
      'image': 'assets/images/Cabshel5.jfif',
    },
    {
      'image': 'assets/images/Cabshel6.jfif',
    },
    {
      'image': 'assets/images/Cabshel7.jfif',
    },
    {
      'image': 'assets/images/Cabshel8.jfif',
    },
    {
      'image': 'assets/images/Cabshel9.jfif',
    },
    {
      'image': 'assets/images/Cabshel10.jfif',
    },
    // Tambahkan data lainnya untuk sofa
  ];

  // Data untuk lampu
  final List<Map<String, dynamic>> washbasins = [
    {
      'image': 'assets/images/Washbasins1.jfif',
    },
    {
      'image': 'assets/images/Washbasins2.jfif',
    },
    {
      'image': 'assets/images/Washbasins3.jfif',
    },
    {
      'image': 'assets/images/Washbasins4.jfif',
    },
    {
      'image': 'assets/images/Washbasins5.jfif',
    },
    {
      'image': 'assets/images/Washbasins6.jfif',
    },
    {
      'image': 'assets/images/Washbasins7.jfif',
    },
    {
      'image': 'assets/images/Washbasins8.jfif',
    },
    {
      'image': 'assets/images/Washbasins9.jfif',
    },
    {
      'image': 'assets/images/Washbasins10.jfif',
    },
    // Tambahkan data lainnya untuk lampu
  ];

  // Data untuk lemari (cabinet)
  final List<Map<String, dynamic>> bathshow = [
    {
      'image': 'assets/images/Bathshow1.jfif',
    },
    {
      'image': 'assets/images/Bathshow2.jfif',
    },
    {
      'image': 'assets/images/Bathshow3.jfif',
    },
    {
      'image': 'assets/images/Bathshow4.jfif',
    },
    {
      'image': 'assets/images/Bathshow5.jfif',
    },
    {
      'image': 'assets/images/Bathshow6.jfif',
    },
    {
      'image': 'assets/images/Bathshow7.jfif',
    },
    {
      'image': 'assets/images/Bathshow8.jfif',
    },
    {
      'image': 'assets/images/Bathshow9.jfif',
    },
    {
      'image': 'assets/images/Bathshow10.jfif',
    },
  ];
  final List<Map<String, dynamic>> bathaccess = [
    {
      'image': 'assets/images/Bathaccess1.jfif',
    },
    {
      'image': 'assets/images/Bathaccess2.jfif',
    },
    {
      'image': 'assets/images/Bathaccess3.jfif',
    },
    {
      'image': 'assets/images/Bathaccess4.jfif',
    },
    {
      'image': 'assets/images/Bathaccess5.jfif',
    },
    {
      'image': 'assets/images/Bathaccess6.jfif',
    },
    {
      'image': 'assets/images/Bathaccess7.jfif',
    },
    {
      'image': 'assets/images/Bathaccess8.jfif',
    },
    {
      'image': 'assets/images/Bathaccess9.jfif',
    },
    {
      'image': 'assets/images/Bathaccess10.jfif',
    },
  ];
}
