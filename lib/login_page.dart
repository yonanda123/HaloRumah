import 'package:flutter/material.dart';
import 'package:halo_rumah_flutter/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    final users = await DatabaseHelper.instance.getUsers();
    final loggedInUser = users.firstWhere(
      (user) => user['username'] == username && user['password'] == password,
      orElse: () => {},
    );

    if (loggedInUser.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('username', username);
      await prefs.setInt('role', loggedInUser['role']);

      int role = loggedInUser['role'];
      if (role == 1) {
        Navigator.pushReplacementNamed(context, '/admin_dashboard');
      } else if (role == 2) {
        Navigator.pushReplacementNamed(context, '/user_dashboard');
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid username or password'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
    _usernameController.clear();
    _passwordController.clear();
  }

  void launchWhatsApp({
    required String phone,
    required String message,
  }) async {
    String url() {
      if (Platform.isAndroid) {
        // add the [https]
        return "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
      } else {
        // add the [https]
        return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}"; // new line
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/BG.png', // Ganti dengan path gambar BG.PNG
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 56.0),
                    // Gambar RUMAH.PNG
                    Center(
                      child: Image.asset(
                        'assets/images/RUMAH.png',
                        height: 100,
                        width: 100,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Text "Selamat Datang"
                    Text(
                      'Selamat Datang',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.0),
                    // Text "HALO RUMAH"
                    Text(
                      'HALO RUMAH',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 42.0),
                    TextFormField(
                      controller: _usernameController,
                      cursorColor: Color(0xFF000000),
                      decoration: InputDecoration(
                        labelText: "Enter Username",
                        fillColor: Colors.white,
                        labelStyle: TextStyle(
                          color: Color(0xFF000000),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      cursorColor: Color(0xFF000000),
                      decoration: InputDecoration(
                        labelText: "Password",
                        fillColor: Colors.white,
                        labelStyle: TextStyle(
                          color: Color(0xFF000000),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        onPrimary: Colors.white,
                        shadowColor: Colors.red,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        minimumSize: Size(289, 42),
                      ),
                      onPressed: _login,
                      child: Text('Login'),
                    ),
                    SizedBox(height: 8.0),
                    TextButton(
                      onPressed: () {
                        launchWhatsApp(
                            phone: '+6281357795007',
                            message:
                                'Halo Saya Ingin Membeli Aplikasi Halo Rumah !');
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Color(0xFF000000),
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      child: Text('Tap Here to Get Account Access !!'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
