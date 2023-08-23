import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_slider/carousel_slider.dart';

class UserDashboardPage extends StatefulWidget {
  final String username;

  UserDashboardPage({required this.username});
  @override
  State<UserDashboardPage> createState() => _UserDashboardPageState();
}

class _UserDashboardPageState extends State<UserDashboardPage> {
  int _selectedIndex = 0;

  int _curent = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> myData = [
    Image.asset('assets/images/House1.jpg'),
    Image.asset('assets/images/House2.jpg'),
    Image.asset('assets/images/House3.jpg'),
  ];

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    // Gantikan dengan CarouselSlider
    //CarouselSlider,
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: Create',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            () {
              if (_selectedIndex == 0) {
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
                              'Halo, Rumah02',
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                            // Tambahkan aksi yang diinginkan di sini
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.red,
                                            onPrimary: Colors.white,
                                            shadowColor: Colors.red,
                                            elevation: 3,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
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
                        padding: EdgeInsets.only(right: 32, left: 32),
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
                                      setState(() {});
                                    },
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        8), // Spasi antara Container dan teks
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
                                      'assets/images/HouseType.png',
                                      width: 50,
                                      height: 50,
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                    },
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        8), // Spasi antara Container dan teks
                                Text(
                                  'House Type',
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
                                      setState(() {});
                                    },
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        8), // Spasi antara Container dan teks
                                Text(
                                  'Desain Detail',
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
                                      'assets/images/Material.png',
                                      width: 50,
                                      height: 50,
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                    },
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        8), // Spasi antara Container dan teks
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
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 90,
                          right: 56,
                          top: 32,
                          bottom: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                      'assets/images/Furniture.png',
                                      width: 50,
                                      height: 50,
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                    },
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        8), // Spasi antara Container dan teks
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
                              width: 40,
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
                                      setState(() {});
                                    },
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        8), // Spasi antara Container dan teks
                                Text(
                                  'House Price',
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
                              aspectRatio: 1.8,
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
                                  onTap: () =>
                                      _controller.animateToPage(entry.key),
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
                                          .withOpacity(
                                              _curent == entry.key ? 0.9 : 0.4),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: 32,
                          left: 32,
                          bottom: 32,
                          top: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  // Handle tap for the first card here
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/Berita1.png',
                                        width: 200,
                                        height: 100,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Binngung Cara Bikin Rumah ?',
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
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  // Handle tap for the second card here
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/Berita1.png',
                                        width: 200,
                                        height: 100,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Binngung Cara Bikin Rumah ?',
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
                            )
                          ],
                        ),
                      ),
                      // Expanded(
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(
                      //         left: 32, right: 32, bottom: 32),
                      //     child: GridView.builder(
                      //       gridDelegate:
                      //           SliverGridDelegateWithFixedCrossAxisCount(
                      //         crossAxisCount: 2,
                      //         crossAxisSpacing: 10.0,
                      //         mainAxisSpacing: 10.0,
                      //       ),
                      //       itemCount: 4,
                      //       itemBuilder: (BuildContext context, int index) {
                      //         if (index == 0) {
                      //           return GestureDetector(
                      //             onTap: () {},
                      //             child: Card(
                      //               shape: RoundedRectangleBorder(
                      //                 borderRadius:
                      //                     BorderRadius.circular(10.0),
                      //               ),
                      //               child: Column(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.start,
                      //                 children: [
                      //                   Image.asset(
                      //                       'assets/images/Berita1.png'),
                      //                   Padding(
                      //                     padding: EdgeInsets.all(8.0),
                      //                     child: Column(
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         Text(
                      //                           'Binngung Cara Bikin Rumah ?',
                      //                           style: TextStyle(
                      //                             fontWeight: FontWeight.bold,
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           );
                      //         } else if (index == 1) {
                      //           return GestureDetector(
                      //             onTap: () {},
                      //             child: Card(
                      //               shape: RoundedRectangleBorder(
                      //                 borderRadius:
                      //                     BorderRadius.circular(10.0),
                      //               ),
                      //               child: Column(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.start,
                      //                 children: [
                      //                   Image.asset(
                      //                       'assets/images/Berita2.png'),
                      //                   Padding(
                      //                     padding: EdgeInsets.all(8.0),
                      //                     child: Column(
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         Text(
                      //                           'Binngung Cara Bikin Rumah ?',
                      //                           style: TextStyle(
                      //                             fontWeight: FontWeight.bold,
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           );
                      //         }
                      //       },
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ); // Gantilah YourFirstWidget() dengan widget yang sesuai.
              } else if (_selectedIndex == 1) {
                return Container(
                  color: Colors.red,
                );
              } else {
                return ElevatedButton(
                  onPressed: () {
                    _logout(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Warna latar belakang tombol
                    onPrimary: Colors.white, // Warna teks tombol
                  ),
                  child: Text('Logout'),
                );
              }
            }(),
          ],
        ),
        // Tampilkan widget lain jika _selectedIndex bukan 0
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(58, 134, 235, 50),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[600],
        onTap: _onItemTapped,
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacementNamed(context, '/login');
  }
}
