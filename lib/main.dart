import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:halo_rumah_flutter/shared_pref_helper.dart';
import 'package:halo_rumah_flutter/login_page.dart';
import 'package:halo_rumah_flutter/AdminDashboardPage.dart';
import 'package:halo_rumah_flutter/UserDashboardPage.dart';
import 'package:halo_rumah_flutter/stepper_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:halo_rumah_flutter/Consultation/ConsultationPage.dart';
import 'package:halo_rumah_flutter/HouseConcept/HouseConceptPage.dart';
import 'package:halo_rumah_flutter/Furniture/FurniturePage.dart';
import 'package:halo_rumah_flutter/Furniture/LivingRoomPage.dart';
import 'package:halo_rumah_flutter/Furniture/KitchenPage.dart';
import 'package:halo_rumah_flutter/Furniture/BathRoomPage.dart';
import 'package:halo_rumah_flutter/Furniture/BedRoomPage.dart';
import 'package:halo_rumah_flutter/Material/MaterialPage.dart';
import 'package:halo_rumah_flutter/UnitPrice/UnitPricePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;
  String _loggedInUsername = '';
  int _loggedInUserRole = 0;
  bool _showSplashScreen =
      true; // Tambahkan variabel untuk menampilkan splash screen

  @override
  void initState() {
    super.initState();
    // Tampilkan splash screen selama 3 detik
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showSplashScreen = false; // Setelah 3 detik, sembunyikan splash screen
      });
      checkLoginStatus();
    });
  }

  Future<void> checkLoginStatus() async {
    final isLoggedIn = await SharedPrefHelper.instance.isLoggedIn();
    final prefs = await SharedPreferences.getInstance();
    final loggedInUsername = prefs.getString('username') ?? '';
    final loggedInUserRole = prefs.getInt('role') ?? 0;

    setState(() {
      _isLoggedIn = isLoggedIn;
      _loggedInUsername = loggedInUsername;
      _loggedInUserRole = loggedInUserRole;
    });

    // Pindah ke halaman yang sesuai setelah splash screen
    if (_isLoggedIn) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => (_loggedInUserRole == 1
              ? AdminDashboardPage(username: _loggedInUsername)
              : UserDashboardPage(username: _loggedInUsername)),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Gunakan SplashScreen jika _showSplashScreen adalah true, jika tidak, gunakan halaman utama
      home: _showSplashScreen
          ? SplashScreen(
              isLoggedIn: _isLoggedIn,
              loggedInUserRole: _loggedInUserRole,
              loggedInUsername: _loggedInUsername,
            )
          : (_isLoggedIn
              ? (_loggedInUserRole == 1
                  ? AdminDashboardPage(username: _loggedInUsername)
                  : UserDashboardPage(username: _loggedInUsername))
              : LoginPage()),
      routes: {
        '/stepper': (context) => StepperExampleApp(),
        '/login': (context) => LoginPage(),
        '/admin_dashboard': (context) =>
            AdminDashboardPage(username: _loggedInUsername),
        '/user_dashboard': (context) =>
            UserDashboardPage(username: _loggedInUsername),
        '/consultation': (context) =>
            ConsultationPage(username: _loggedInUsername),
        '/HouseConcept': (context) =>
            HouseConceptPage(username: _loggedInUsername),
        '/Furniture': (context) => FurniturePage(username: _loggedInUsername),
        '/LivingRoom': (context) => LivingRoomPage(username: _loggedInUsername),
        '/Kitchen': (context) => KitchenPage(username: _loggedInUsername),
        '/BathRoom': (context) => BathRoomPage(username: _loggedInUsername),
        '/BedRoom': (context) => BedRoomPage(username: _loggedInUsername),
        '/Material': (context) =>
            MaterialBangunanPage(username: _loggedInUsername),
        '/UnitPrice': (context) => UnitPrice(username: _loggedInUsername),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  final bool isLoggedIn;
  final int loggedInUserRole;
  final String loggedInUsername;

  SplashScreen({
    required this.isLoggedIn,
    required this.loggedInUserRole,
    required this.loggedInUsername,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen(
          duration: 3000,
          splash: 'assets/images/SplashScreen.png',
          nextScreen: isLoggedIn
              ? (loggedInUserRole == 1
                  ? AdminDashboardPage(username: loggedInUsername)
                  : UserDashboardPage(username: loggedInUsername))
              : LoginPage(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.scale,
        ),
      ),
    );
  }
}
