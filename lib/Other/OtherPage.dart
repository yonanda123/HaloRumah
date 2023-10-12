import 'package:flutter/material.dart';

class OtherPage extends StatefulWidget {
  final String username;

  OtherPage({required this.username});
  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
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
                  "Fitur",
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
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.only(right: 16, left: 32),
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
                                    setState(() {
                                      Navigator.pushNamed(
                                          context, '/consultation');
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                  height: 8), // Spasi antara Container dan teks
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
                            width: 16,
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
                                    setState(() {
                                      Navigator.pushNamed(
                                          context, '/UnitPrice');
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                  height: 8), // Spasi antara Container dan teks
                              Text(
                                'Unit Price',
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
                                    setState(() {
                                      Navigator.pushNamed(
                                          context, '/HouseConcept');
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                  height: 8), // Spasi antara Container dan teks
                              Text(
                                'House Concept',
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
                        right: 32,
                        left: 42,
                        top: 32,
                        bottom: 32,
                      ),
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
                                    'assets/images/Material.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pushNamed(context, '/Material');
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                  height: 8), // Spasi antara Container dan teks
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
                                    'assets/images/Furniture.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pushNamed(
                                          context, '/Furniture');
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                  height: 8), // Spasi antara Container dan teks
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
                            width: 100,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
