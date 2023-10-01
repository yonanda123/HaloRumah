import 'dart:async';
import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'package:restart_app/restart_app.dart';
import 'package:halo_rumah_flutter/Menu/Process.dart';
import 'package:halo_rumah_flutter/Menu/HomePage.dart';
import 'package:halo_rumah_flutter/Menu/Profile.dart';
import 'package:halo_rumah_flutter/Menu/SearchPage.dart';

class UserDashboardPage extends StatefulWidget {
  final String username;

  UserDashboardPage({required this.username});
  @override
  State<UserDashboardPage> createState() => _UserDashboardPageState();
}

class _UserDashboardPageState extends State<UserDashboardPage> {
  int _selectedIndex = 0;

  Map<String, dynamic> loggedInUser = {};

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserFromDatabase();
  }

  Future<void> _getUserFromDatabase() async {
    try {
      final user =
          await DatabaseHelper.instance.getUserByUsername(widget.username);
      setState(() {
        loggedInUser = user;
      });
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Restart Required'),
            content:
                Text('Aplikasi perlu direstart untuk menerapkan pembaruan.'),
            actions: [
              TextButton(
                onPressed: () {
                  Restart.restartApp();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
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
                stops: [0, 0.3, 0.6, 1], // Menambahkan lebih banyak stop
                colors: [
                  Color.fromARGB(255, 255, 0, 0), // Warna awal yang cerah
                  Colors.white
                      .withOpacity(0.8), // Warna putih dengan kejelasan 80%
                  Colors.white
                      .withOpacity(0.6), // Warna putih dengan kejelasan 60%
                  Colors.white
                      .withOpacity(0.4), // Warna putih dengan kejelasan 40%
                ],
                tileMode: TileMode
                    .clamp, // Menggunakan TileMode.clamp agar gradient tidak terulang
              ),
            ),
          ),
          () {
            if (_selectedIndex == 0) {
              return HomePage(
                username: '${loggedInUser['username']}',
                name: '${loggedInUser['name']}',
              );
            } else if (_selectedIndex == 1) {
              return SearchPage();
            } else if (_selectedIndex == 2) {
              return Process();
            } else {
              return Profile(
                username: '${loggedInUser['username']}',
                name: '${loggedInUser['name']}',
                image: '${loggedInUser['image']}',
                phone: '${loggedInUser['phone']}',
                password: '${loggedInUser['password']}',
                address: '${loggedInUser['address']}',
              );
            }
          }(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color.fromARGB(255, 164, 164, 164),
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
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
      ),
    );
  }
}
