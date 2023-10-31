import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description1;
  final String description2;
  final String description3;

  DetailPage(this.imagePath, this.title, this.description1, this.description2,
      this.description3);

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
                  "Detail Page",
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
                          imagePath,
                          width: MediaQuery.of(context).size.width - 32,
                          height: 250,
                        ),
                        SizedBox(height: 16),
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 16),
                        Text(
                          description1,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify, // Justify the text
                        ),
                        SizedBox(height: 16),
                        Text(
                          description2,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify, // Justify the text
                        ),
                        SizedBox(height: 16),
                        Text(
                          description3,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify, // Justify the text
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
