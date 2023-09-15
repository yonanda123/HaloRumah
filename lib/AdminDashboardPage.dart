import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AHSPPage.dart';

class AdminDashboardPage extends StatefulWidget {
  final String username;

  AdminDashboardPage({required this.username});
  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page Admin'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Business'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('School'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Logout'),
              selected: _selectedIndex == 3,
              onTap: () {
                _logout(context);
              },
            ),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topLeft,
          //       end: Alignment.centerRight,
          //       stops: [0, 0.3, 0.6, 1], // Menambahkan lebih banyak stop
          //       colors: [
          //         Color.fromARGB(255, 255, 0, 0), // Warna awal yang cerah
          //         Colors.white
          //             .withOpacity(0.8), // Warna putih dengan kejelasan 80%
          //         Colors.white
          //             .withOpacity(0.6), // Warna putih dengan kejelasan 60%
          //         Colors.white
          //             .withOpacity(0.4), // Warna putih dengan kejelasan 40%
          //       ],
          //       tileMode: TileMode
          //           .clamp, // Menggunakan TileMode.clamp agar gradient tidak terulang
          //     ),
          //   ),
          // ),
          () {
            if (_selectedIndex == 0) {
              return Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal, child: AHSP()),
                ),
              ); // Gantilah YourFirstWidget() dengan widget yang sesuai.
            } else if (_selectedIndex == 1) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Text('Text 2'),
                  ],
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [Text('Text 3')],
                  ),
                ),
              );
            }
          }(),
        ],
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacementNamed(context, '/login');
  }
}
