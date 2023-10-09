import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FurniturePage extends StatefulWidget {
  final String username;

  FurniturePage({required this.username});

  @override
  State<FurniturePage> createState() => _FurniturePageState();
}

class _FurniturePageState extends State<FurniturePage> {
  List<Map<String, dynamic>> furnitures = [
    {
      'image': 'assets/images/Search_LivingRoom_1.jpeg',
      'furniture_type': 'Living Room',
      'rating': 4,
    },
    {
      'image': 'assets/images/Search_Kitchen_1.jpeg',
      'furniture_type': 'Kitchen',
      'rating': 5,
    },
    {
      'image': 'assets/images/Search_BathRoom_1.jpeg',
      'furniture_type': 'Bath Room',
      'rating': 3,
    },
    {
      'image': 'assets/images/Search_BedRoom_1.jpeg',
      'furniture_type': 'Bed Room',
      'rating': 3,
    },
    // Tambahkan furnitur lain sesuai kebutuhan
  ];

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
                  "Furniture Page",
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
                child: Padding(
                  padding: const EdgeInsets.all(
                      16.0), // Sesuaikan dengan jumlah padding yang Anda inginkan
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: furnitures.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Map<String, dynamic> furniture = furnitures[index];
                      final int rating = furniture['rating'];
                      return GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            Navigator.pushNamed(context, '/LivingRoom');
                          } else if (index == 1) {
                            Navigator.pushNamed(context, '/Kitchen');
                          } else if (index == 2) {
                            Navigator.pushNamed(context, '/BathRoom');
                          } else if (index == 3) {
                            Navigator.pushNamed(context, '/BedRoom');
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage(furniture['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: List.generate(
                                        rating,
                                        (starIndex) {
                                          return Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 18.0,
                                          );
                                        },
                                      ),
                                    ),
                                    Text(
                                      furniture['furniture_type'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    staggeredTileBuilder: (int index) =>
                        StaggeredTile.count(1, 1),
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
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
