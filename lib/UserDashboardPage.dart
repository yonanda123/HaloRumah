import 'dart:async';
import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'package:restart_app/restart_app.dart';
import 'package:halo_rumah_flutter/Menu/Process.dart';
import 'package:halo_rumah_flutter/Menu/HomePage.dart';
import 'package:halo_rumah_flutter/Menu/SearchPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
    _loadUsers();
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

  //Update the user
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  List<Map<String, dynamic>> users = [];
  bool isHelpExpanded = false;

  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchWhatsApp({
    required String phone,
    required String message,
  }) async {
    String url() {
      if (Platform.isAndroid) {
        return "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
      } else {
        return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}"; // new line
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  Future<void> _loadUsers() async {
    final List<Map<String, dynamic>> userList =
        await _databaseHelper.getUsers();
    setState(() {
      users = userList;
    });
  }

  Future<void> _updateUsers(Map<String, dynamic> user) async {
    await _databaseHelper.updateUser(user);
    await _loadUsers();
  }

  void _editUsers(Map<String, dynamic> user) {
    final TextEditingController nameController =
        TextEditingController(text: user['name']);
    final TextEditingController addressController =
        TextEditingController(text: user['address']);
    final TextEditingController phoneController =
        TextEditingController(text: user['phone']);
    // final TextEditingController usernameController =
    //     TextEditingController(text: user['username']);
    final TextEditingController passwordController =
        TextEditingController(text: user['password']);

    File? imageFile;
    final ImagePicker _picker = ImagePicker();

    Future<void> _getImage() async {
      final XFile? pickedImage =
          await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        imageFile = pickedImage != null ? File(pickedImage.path) : null;
      });
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit User'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                if (user['image'] != null && user['image'].isNotEmpty)
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(File(user['image'])),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ElevatedButton(
                  child: Text('Choose Image'),
                  onPressed: _getImage,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                ),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: 'Phone'),
                ),
                // TextField(
                //   controller: usernameController,
                //   decoration: InputDecoration(labelText: 'Username'),
                // ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () async {
                final Map<String, dynamic> userMap = {
                  'id': user['id'],
                  'name': nameController.text,
                  'address': addressController.text,
                  'phone': phoneController.text,
                  // 'username': usernameController.text,
                  'password': passwordController.text,
                  'image': imageFile != null ? imageFile!.path : user['image'],
                };
                await _updateUsers(userMap);
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Restart Required'),
                      content: Text(
                          'Aplikasi perlu direstart untuk menerapkan pembaruan.'),
                      actions: [
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Restart.restartApp(); // Tutup dialog peringatan
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double containerHeight = isHelpExpanded ? 420.0 : 320.0;
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
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 48),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 32),
                            child: Text(
                              'Profile',
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
                      Container(
                        width: double.infinity, // Lebar sesuaikan dengan layar
                        height: 150.0, // Tinggi card
                        margin: EdgeInsets.only(
                            right: 32.0, left: 32, bottom: 32, top: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(16.0), // Radius sudut card
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // Offset bayangan
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 8, left: 8),
                              child: Container(
                                width: 100.0, // Lebar leading foto
                                child: CircleAvatar(
                                  radius: 50.0, // Radius avatar
                                  backgroundImage: FileImage(File(loggedInUser[
                                      'image'])), // Ganti dengan gambar profil Anda
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      '${loggedInUser['name']}', // Ganti dengan nama Anda
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        height: 19 / 16,
                                        letterSpacing: 0.1,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, right: 8, left: 8, bottom: 8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.account_circle,
                                          color: Colors
                                              .black, // Ganti dengan warna ikon yang Anda inginkan
                                        ),
                                        SizedBox(
                                            width:
                                                8), // Memberikan jarak antara ikon dan teks
                                        Text(
                                          '${loggedInUser['username']}', // Ganti dengan username Anda
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            height: 19 / 16,
                                            letterSpacing: 0.1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 8, right: 8, bottom: 8),
                                    child: Row(
                                      children: [
                                        Icon(Icons.phone, color: Colors.black),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          '${loggedInUser['phone']}', // Ganti dengan nomor telepon Anda
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            height: 19 / 16,
                                            letterSpacing: 0.1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 8, right: 8, bottom: 8, top: 8),
                              child: IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  _editUsers(loggedInUser);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 32,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 32),
                            child: Text(
                              'Preferensi',
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
                      Container(
                        width: double.infinity,
                        height: containerHeight,
                        margin:
                            EdgeInsets.only(right: 32.0, left: 32, bottom: 32),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ListView(
                          children: [
                            ListTile(
                              title: Text('About Us'),
                              trailing:
                                  Icon(Icons.keyboard_arrow_right_outlined),
                              leading: Icon(
                                Icons.groups_2,
                                color: Colors.black,
                              ),
                              onTap: () {
                                setState(() {
                                  Navigator.pushNamed(context, '/AboutUs');
                                });
                              },
                            ),
                            Divider(
                              thickness: 0.1,
                              indent: 15,
                              endIndent: 15,
                              color: Colors.black,
                            ),
                            ListTile(
                              title: Text('Social Media'),
                              trailing:
                                  Icon(Icons.keyboard_arrow_right_outlined),
                              leading: FaIcon(
                                FontAwesomeIcons.cameraRetro,
                                color: Colors.black,
                              ),
                              onTap: () {
                                setState(() {
                                  Navigator.pushNamed(context, '/SocialMedia');
                                });
                              },
                            ),
                            Divider(
                              thickness: 0.1,
                              indent: 15,
                              endIndent: 15,
                              color: Colors.black,
                            ),
                            ListTile(
                              title: Text('Help'),
                              trailing: Icon(
                                isHelpExpanded
                                    ? Icons.keyboard_arrow_down
                                    : Icons.keyboard_arrow_right_outlined,
                              ),
                              leading: Icon(
                                Icons.contact_support,
                                color: Colors.black,
                              ),
                              onTap: () {
                                setState(() {
                                  isHelpExpanded = !isHelpExpanded;
                                });
                              },
                            ),
                            if (isHelpExpanded)
                              Column(
                                children: [
                                  SublistItem(Icons.info, 'App Tutorial', () {
                                    launchUrl(
                                        'https://youtu.be/W7Jc7D-bcZI?si=mGctA9TH1bQS0oUL');
                                  }),
                                  SublistItem(Icons.phone, 'Contact Us', () {
                                    launchWhatsApp(
                                        phone: '+6281357795007',
                                        message: 'Halo Saya Perlu Bantuan !');
                                  }),
                                ],
                              ),
                            Divider(
                              thickness: 0.1,
                              indent: 15,
                              endIndent: 15,
                              color: Colors.black,
                            ),
                            ListTile(
                              title: Text('Logout'),
                              trailing:
                                  Icon(Icons.keyboard_arrow_right_outlined),
                              leading: Icon(
                                Icons.logout,
                                color: Colors.black,
                              ),
                              onTap: () {
                                _logout(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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

Future<void> _logout(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  Navigator.pushReplacementNamed(context, '/login');
}

class SublistItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  SublistItem(this.iconData, this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Colors.black,
      ),
      title: Text(title),
      onTap: onTap,
    );
  }
}
