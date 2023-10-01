import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class CustomConsultationTile extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String avatarPath;
  final VoidCallback? onTap; // Fungsi onTap sebagai argumen opsional

  CustomConsultationTile({
    required this.name,
    required this.phoneNumber,
    required this.avatarPath,
    this.onTap, // Inisialisasi fungsi onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Gunakan onTap yang diterima dari konstruktor
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 20,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Card(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(16.0),
            leading: CircleAvatar(
              radius: 32,
              backgroundColor: Colors.blue,
              backgroundImage: AssetImage(avatarPath),
            ),
            title: Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.blue,
                  size: 18.0,
                ),
                SizedBox(width: 8.0),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            subtitle: Row(
              children: [
                Icon(
                  Icons.phone,
                  color: Colors.blue,
                  size: 18.0,
                ),
                SizedBox(width: 8.0),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    phoneNumber,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ConsultationPage extends StatefulWidget {
  final String username;

  ConsultationPage({required this.username});

  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
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

  // Fungsi untuk menangani tindakan saat item diklik
  void handleConsultationItemClick({
    required String phone,
    required String message,
  }) async {
    // Gunakan fungsi launchWhatsApp dengan parameter yang sesuai
    launchWhatsApp(phone: phone, message: message);
  }

  final List<Map<String, dynamic>> consultationList = [
    {
      'name': 'Jamar Rizqi Afdholy, S.T., M.T.',
      'phoneNumber': '+628115122771',
      'avatarPath': 'assets/images/Amar.jpg',
    },
    {
      'name': 'Komang Ayu Laksmi H.S., S.T.,M.Ars.',
      'phoneNumber': '+6287860199675',
      'avatarPath': 'assets/images/Ayu.jpg',
    },
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
                  "Consultation Page",
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
              // Isi konten konsultasi Anda di sini
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 24, left: 24),
                  child: ListView.builder(
                    itemCount: consultationList.length,
                    itemBuilder: (context, index) {
                      final consultation = consultationList[index];
                      return CustomConsultationTile(
                        name: consultation['name'] ?? '',
                        phoneNumber: consultation['phoneNumber'] ?? '',
                        avatarPath: consultation['avatarPath'] ?? '',
                        onTap: () {
                          handleConsultationItemClick(
                            phone: consultation['phoneNumber'] ?? '',
                            message: 'Hello', // Pesan yang ingin Anda kirim
                          );
                        },
                      );
                    },
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
