import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String selectedCategory = 'Living Room';

  // Daftar kategori
  final List<String> categories = [
    'Living Room',
    'Kitchen Room',
    'Bed Room',
    'Bath Room',
  ];

  // Daftar konten sesuai dengan kategori
  final Map<String, List<String>> categoryContent = {
    'Living Room': [
      'Content 1-1',
      'Content 1-2',
      'Content 1-3',
      'Content 1-4',
      'Content 1-5',
      'Content 1-6',
      'Content 1-7',
      'Content 1-8',
      'Content 1-9',
      'Content 1-10',
      'Content 1-11',
      'Content 1-12',
      'Content 1-13',
      'Content 1-14',
      'Content 1-15',
      'Content 1-16',
      'Content 1-17',
      'Content 1-18',
      'Content 1-19',
      'Content 1-20',
    ],
    'Kitchen Room': [
      'Content 2-1',
      'Content 2-2',
      'Content 2-3',
      'Content 2-4',
      'Content 2-5',
      'Content 2-6',
      'Content 2-7',
      'Content 2-8',
      'Content 2-9',
      'Content 2-10',
      'Content 2-11',
      'Content 2-12',
      'Content 2-13',
      'Content 2-14',
      'Content 2-15',
      'Content 2-16',
      'Content 2-17',
    ],
    'Bed Room': [
      'Content 3-1',
      'Content 3-2',
      'Content 3-3',
      'Content 3-4',
      'Content 3-5',
      'Content 3-6',
      'Content 3-7',
      'Content 3-8',
      'Content 3-9',
      'Content 3-10',
      'Content 3-11',
      'Content 3-12',
      'Content 3-13',
      'Content 3-14',
      'Content 3-15',
      'Content 3-16',
      'Content 3-17',
    ],
    'Bath Room': [
      'Content 4-1',
      'Content 4-2',
      'Content 4-3',
      'Content 4-4',
      'Content 4-5',
      'Content 4-6',
      'Content 4-7',
      'Content 4-8',
      'Content 4-9',
      'Content 4-10',
      'Content 4-11',
      'Content 4-12',
      'Content 4-13',
      'Content 4-14',
      'Content 4-15',
      'Content 4-16',
      'Content 4-17',
      'Content 4-18',
      'Content 4-19',
      'Content 4-20',
    ],
  };

  final Map<String, List<String>> categoryImages = {
    'Living Room': [
      'assets/images/Search_LivingRoom_1.jpeg',
      'assets/images/Search_LivingRoom_2.jpeg',
      'assets/images/Search_LivingRoom_3.jpeg',
      'assets/images/Search_LivingRoom_4.jpeg',
      'assets/images/Search_LivingRoom_5.jpeg',
      'assets/images/Search_LivingRoom_6.jpeg',
      'assets/images/Search_LivingRoom_7.jpeg',
      'assets/images/Search_LivingRoom_8.jpeg',
      'assets/images/Search_LivingRoom_9.jpeg',
      'assets/images/Search_LivingRoom_10.jpeg',
      'assets/images/Search_LivingRoom_11.jpeg',
      'assets/images/Search_LivingRoom_12.jpeg',
      'assets/images/Search_LivingRoom_13.jpeg',
      'assets/images/Search_LivingRoom_14.jpeg',
      'assets/images/Search_LivingRoom_15.jpeg',
      'assets/images/Search_LivingRoom_16.jpeg',
      'assets/images/Search_LivingRoom_17.jpeg',
      'assets/images/Search_LivingRoom_18.jpeg',
      'assets/images/Search_LivingRoom_19.jpeg',
      'assets/images/Search_LivingRoom_20.jpeg',
    ],
    'Kitchen Room': [
      'assets/images/Search_Kitchen_1.jpeg',
      'assets/images/Search_Kitchen_2.jpeg',
      'assets/images/Search_Kitchen_3.jpeg',
      'assets/images/Search_Kitchen_4.jpeg',
      'assets/images/Search_Kitchen_5.jpeg',
      'assets/images/Search_Kitchen_6.jpeg',
      'assets/images/Search_Kitchen_7.jpeg',
      'assets/images/Search_Kitchen_8.jpeg',
      'assets/images/Search_Kitchen_9.jpeg',
      'assets/images/Search_Kitchen_10.jpeg',
      'assets/images/Search_Kitchen_11.jpeg',
      'assets/images/Search_Kitchen_12.jpeg',
      'assets/images/Search_Kitchen_13.jpeg',
      'assets/images/Search_Kitchen_14.jpeg',
      'assets/images/Search_Kitchen_15.jpeg',
      'assets/images/Search_Kitchen_16.jpeg',
      'assets/images/Search_Kitchen_17.jpeg',
    ],
    'Bed Room': [
      'assets/images/Search_Kitchen_1.jpeg',
      'assets/images/Search_Kitchen_2.jpeg',
      'assets/images/Search_Kitchen_3.jpeg',
      'assets/images/Search_Kitchen_4.jpeg',
      'assets/images/Search_Kitchen_5.jpeg',
      'assets/images/Search_Kitchen_6.jpeg',
      'assets/images/Search_Kitchen_7.jpeg',
      'assets/images/Search_Kitchen_8.jpeg',
      'assets/images/Search_Kitchen_9.jpeg',
      'assets/images/Search_Kitchen_10.jpeg',
      'assets/images/Search_Kitchen_11.jpeg',
      'assets/images/Search_Kitchen_12.jpeg',
      'assets/images/Search_Kitchen_13.jpeg',
      'assets/images/Search_Kitchen_14.jpeg',
      'assets/images/Search_Kitchen_15.jpeg',
      'assets/images/Search_Kitchen_16.jpeg',
      'assets/images/Search_Kitchen_17.jpeg',
    ],
    'Bath Room': [
      'assets/images/Search_BathRoom_1.jpeg',
      'assets/images/Search_BathRoom_2.jpeg',
      'assets/images/Search_BathRoom_3.jpeg',
      'assets/images/Search_BathRoom_4.jpeg',
      'assets/images/Search_BathRoom_5.jpeg',
      'assets/images/Search_BathRoom_6.jpeg',
      'assets/images/Search_BathRoom_7.jpeg',
      'assets/images/Search_BathRoom_8.jpeg',
      'assets/images/Search_BathRoom_9.jpeg',
      'assets/images/Search_BathRoom_10.jpeg',
      'assets/images/Search_BathRoom_11.jpeg',
      'assets/images/Search_BathRoom_12.jpeg',
      'assets/images/Search_BathRoom_13.jpeg',
      'assets/images/Search_BathRoom_14.jpeg',
      'assets/images/Search_BathRoom_15.jpeg',
      'assets/images/Search_BathRoom_16.jpeg',
      'assets/images/Search_BathRoom_17.jpeg',
      'assets/images/Search_BathRoom_18.jpeg',
      'assets/images/Search_BathRoom_19.jpeg',
      'assets/images/Search_BathRoom_20.jpeg',
    ],
  };

  // Create a shuffled list for 'Living Room' images
  Map<String, List<String>> shuffledCategoryImages = {};

  @override
  void initState() {
    super.initState();
    // Shuffle the 'Living Room' images initially
    shuffledCategoryImages['Living Room'] =
        List.from(categoryImages['Living Room'] ?? [])..shuffle();
    shuffledCategoryImages['Kitchen Room'] =
        List.from(categoryImages['Kitchen Room'] ?? [])..shuffle();
    shuffledCategoryImages['Bed Room'] =
        List.from(categoryImages['Bed Room'] ?? [])..shuffle();
    shuffledCategoryImages['Bath Room'] =
        List.from(categoryImages['Bath Room'] ?? [])..shuffle();
  }

  // Function to shuffle images for a specific category
  void shuffleImagesForCategory(String category) {
    setState(() {
      shuffledCategoryImages[category] =
          List.from(categoryImages[category] ?? [])..shuffle();
    });
  }

  double _generateRandomAspectRatio() {
    final random = Random();
    // Rasio aspek antara 0.7 dan 1.3
    return 0.7 + random.nextDouble() * 0.6;
  }

  double _generateRandomHeight() {
    final random = Random();
    // Tinggi gambar antara 100 dan 250
    return 100.0 + random.nextDouble() * 150.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Page",
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0), // Adjust the height as needed
          child: Container(
            color:
                Colors.white, // Background color for the category selection bar
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
                stops: [0, 0.15, 0.0, 0.0],
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
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 4, right: 4, top: 16, bottom: 16),
                  child: SingleChildScrollView(
                    child: StaggeredGridView.countBuilder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      itemCount: categoryContent[selectedCategory]?.length ?? 0,
                      itemBuilder: (ctx, index) {
                        final contentItem =
                            categoryContent[selectedCategory]?[index] ?? '';
                        final imageUrl =
                            shuffledCategoryImages[selectedCategory]![index %
                                shuffledCategoryImages[selectedCategory]!
                                    .length];
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
                                  height: _generateRandomHeight(),
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    contentItem,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
