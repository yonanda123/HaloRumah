import 'package:flutter/material.dart';

class LivingRoomPage extends StatefulWidget {
  final String username;

  LivingRoomPage({required this.username});
  @override
  _LivingRoomPageState createState() => _LivingRoomPageState();
}

class _LivingRoomPageState extends State<LivingRoomPage> {
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
                    buildGridView("Table", tableData),
                    buildGridView("Sofa", sofaData),
                    buildGridView("Lamp", lampData),
                    buildGridView("Cabinet", cabinetData),
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
  final List<Map<String, dynamic>> tableData = [
    {
      'image': 'assets/images/Table1.jfif',
    },
    {
      'image': 'assets/images/Table2.jfif',
    },
    {
      'image': 'assets/images/Table3.jfif',
    },
    {
      'image': 'assets/images/Table4.jfif',
    },
    {
      'image': 'assets/images/Table5.jfif',
    },
    {
      'image': 'assets/images/Table6.jfif',
    },
    {
      'image': 'assets/images/Table7.jfif',
    },
    {
      'image': 'assets/images/Table8.jfif',
    },
    {
      'image': 'assets/images/Table9.jfif',
    },
    {
      'image': 'assets/images/Table10.jfif',
    },
    // Tambahkan data lainnya untuk tabel
  ];

  // Data untuk sofa
  final List<Map<String, dynamic>> sofaData = [
    {
      'image': 'assets/images/Sofa1.jfif',
    },
    {
      'image': 'assets/images/Sofa2.jfif',
    },
    {
      'image': 'assets/images/Sofa3.jfif',
    },
    {
      'image': 'assets/images/Sofa4.jfif',
    },
    {
      'image': 'assets/images/Sofa5.jfif',
    },
    {
      'image': 'assets/images/Sofa6.jfif',
    },
    {
      'image': 'assets/images/Sofa7.jfif',
    },
    {
      'image': 'assets/images/Sofa8.jfif',
    },
    {
      'image': 'assets/images/Sofa9.jfif',
    },
    {
      'image': 'assets/images/Sofa10.jfif',
    },
    // Tambahkan data lainnya untuk sofa
  ];

  // Data untuk lampu
  final List<Map<String, dynamic>> lampData = [
    {
      'image': 'assets/images/Lamp1.jfif',
    },
    {
      'image': 'assets/images/Lamp2.jfif',
    },
    {
      'image': 'assets/images/Lamp3.jfif',
    },
    {
      'image': 'assets/images/Lamp4.jfif',
    },
    {
      'image': 'assets/images/Lamp5.jfif',
    },
    {
      'image': 'assets/images/Lamp6.jfif',
    },
    {
      'image': 'assets/images/Lamp7.jfif',
    },
    {
      'image': 'assets/images/Lamp8.jfif',
    },
    {
      'image': 'assets/images/Lamp9.jfif',
    },
    {
      'image': 'assets/images/Lamp10.jfif',
    },
    // Tambahkan data lainnya untuk lampu
  ];

  // Data untuk lemari (cabinet)
  final List<Map<String, dynamic>> cabinetData = [
    {
      'image': 'assets/images/Cabinet1.jfif',
    },
    {
      'image': 'assets/images/Cabinet2.jfif',
    },
    {
      'image': 'assets/images/Cabinet3.jfif',
    },
    {
      'image': 'assets/images/Cabinet4.jfif',
    },
    {
      'image': 'assets/images/Cabinet5.jfif',
    },
    {
      'image': 'assets/images/Cabinet6.jfif',
    },
    {
      'image': 'assets/images/Cabinet7.jfif',
    },
    {
      'image': 'assets/images/Cabinet8.jfif',
    },
    {
      'image': 'assets/images/Cabinet9.jfif',
    },
    {
      'image': 'assets/images/Cabinet10.jfif',
    },
    // Tambahkan data lainnya untuk cabinet
  ];
}
