import 'package:flutter/material.dart';
import 'package:halo_rumah_flutter/login_page.dart';
import 'package:halo_rumah_flutter/AdminDashboardPage.dart';
import 'package:halo_rumah_flutter/UserDashboardPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:halo_rumah_flutter/shared_pref_helper.dart';
import 'package:halo_rumah_flutter/stepper_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;
  String _loggedInUsername = '';
  int _loggedInUserRole = 0; // Tambahkan variabel untuk menyimpan nilai role

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final isLoggedIn = await SharedPrefHelper.instance.isLoggedIn();
    final prefs = await SharedPreferences.getInstance();
    final loggedInUsername = prefs.getString('username') ?? '';
    final loggedInUserRole =
        prefs.getInt('role') ?? 0; // Mendapatkan nilai role

    setState(() {
      _isLoggedIn = isLoggedIn;
      _loggedInUsername = loggedInUsername;
      _loggedInUserRole = loggedInUserRole; // Mengatur nilai role
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _isLoggedIn
          ? (_loggedInUserRole == 1
              ? AdminDashboardPage(username: _loggedInUsername)
              : UserDashboardPage(username: _loggedInUsername))
          : LoginPage(),
      routes: {
        '/stepper': (context) => StepperExampleApp(),
        '/login': (context) => LoginPage(),
        '/admin_dashboard': (context) =>
            AdminDashboardPage(username: _loggedInUsername),
        '/user_dashboard': (context) =>
            UserDashboardPage(username: _loggedInUsername),
      },
    );
  }
}
