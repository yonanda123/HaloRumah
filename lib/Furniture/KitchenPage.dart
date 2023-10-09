import 'package:flutter/material.dart';

class KitchenPage extends StatefulWidget {
  final String username;

  KitchenPage({required this.username});
  @override
  _KitchenPageState createState() => _KitchenPageState();
}

class _KitchenPageState extends State<KitchenPage> {
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
                  "Kitchen Room Furniture",
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
                    buildGridView("Kitchen Sets", KitchenSets),
                    buildGridView("Kitchen Cabinets", KitchenCabinet),
                    buildGridView("Hanging Kitchen Cabinets", Hanging),
                    buildGridView("Bars", Bars),
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
  final List<Map<String, dynamic>> KitchenSets = [
    {
      'image': 'assets/images/KitchenSets1.jfif',
    },
    {
      'image': 'assets/images/KitchenSets2.jfif',
    },
    {
      'image': 'assets/images/KitchenSets3.jfif',
    },
    {
      'image': 'assets/images/KitchenSets4.jfif',
    },
    {
      'image': 'assets/images/KitchenSets5.jfif',
    },
    {
      'image': 'assets/images/KitchenSets6.jfif',
    },
    // Tambahkan data lainnya untuk tabel
  ];

  // Data untuk sofa
  final List<Map<String, dynamic>> KitchenCabinet = [
    {
      'image': 'assets/images/KitchenCabinet1.jfif',
    },
    {
      'image': 'assets/images/KitchenCabinet2.jfif',
    },
    {
      'image': 'assets/images/KitchenCabinet3.jfif',
    },
    {
      'image': 'assets/images/KitchenCabinet4.jfif',
    },
    {
      'image': 'assets/images/KitchenCabinet5.jfif',
    },
    {
      'image': 'assets/images/KitchenCabinet6.jfif',
    },
    {
      'image': 'assets/images/KitchenCabinet7.jfif',
    },
    {
      'image': 'assets/images/KitchenCabinet8.jfif',
    },
    {
      'image': 'assets/images/KitchenCabinet9.jfif',
    },
    {
      'image': 'assets/images/KitchenCabinet10.jfif',
    },
    // Tambahkan data lainnya untuk sofa
  ];

  // Data untuk lampu
  final List<Map<String, dynamic>> Hanging = [
    {
      'image': 'assets/images/Hanging1.jfif',
    },
    {
      'image': 'assets/images/Hanging2.png',
    },
    {
      'image': 'assets/images/Hanging3.jfif',
    },
    {
      'image': 'assets/images/Hanging4.jfif',
    },
    {
      'image': 'assets/images/Hanging5.jfif',
    },
    {
      'image': 'assets/images/Hanging6.jfif',
    },
    {
      'image': 'assets/images/Hanging7.jfif',
    },
    // Tambahkan data lainnya untuk lampu
  ];

  // Data untuk lemari (cabinet)
  final List<Map<String, dynamic>> Bars = [
    {
      'image': 'assets/images/Bars1.jfif',
    },
    {
      'image': 'assets/images/Bars2.jfif',
    },
    {
      'image': 'assets/images/Bars3.jfif',
    },
    {
      'image': 'assets/images/Bars4.png',
    },
    {
      'image': 'assets/images/Bars5.jfif',
    },
    {
      'image': 'assets/images/Bars7.jfif',
    },
    {
      'image': 'assets/images/Bars8.jfif',
    },
    {
      'image': 'assets/images/Bars9.jfif',
    },
    {
      'image': 'assets/images/Bars10.jfif',
    },
  ];
}
