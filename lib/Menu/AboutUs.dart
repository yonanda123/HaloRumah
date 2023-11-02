import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  final String username;

  AboutUsPage({required this.username});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
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
                  "About Us",
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
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/SplashScreen.png',
                          width: MediaQuery.of(context).size.width - 32,
                          height: 250,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Program Kreativitas Mahasiswa Kewirausahaan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Halo Rumah adalah hasil dari kreativitas mahasiswa dalam ajang Program Kreativitas Mahasiswa Nasional. Aplikasi ini merupakan solusi yang memudahkan dan terjangkau untuk membantu merencanakan dan membangun rumah impian. Dirancang untuk memenuhi berbagai kebutuhan, 'Halo Rumah' memungkinkan kamu menemukan konsultan ahli yang dapat diandalkan dalam proses tersebut. Muncul sebagai bukti nyata dari dedikasi para mahasiswa, aplikasi ini tidak hanya memudahkan pembangunan rumah, tetapi juga mendukung perkembangan inovasi mahasiswa di Indonesia. Mari bergabung dalam perjalanan membangun rumah impian secara cerdas dan terjangkau bersama Halo Rumah!",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify, // Justify the text
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Our Team',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Hadi Surya Wibawanto S, ST., MT, IPP",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "I Putu Sugiantara",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "Firnas Naufal",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "Heickal M. Aqil Biladt",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "Emmily Sisilia M.P.S.",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "I Kadek Riski D. P.",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
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
