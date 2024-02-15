import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:halo_rumah_flutter/database_helper.dart';

class AdminDashboardPage extends StatefulWidget {
  final String username;

  AdminDashboardPage({required this.username});
  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  List<Map<String, dynamic>> ahspList = [];

  @override
  void initState() {
    super.initState();
    _fetchAHSPData();
  }

  Future<void> _fetchAHSPData() async {
    try {
      final List<Map<String, dynamic>> data =
          await DatabaseHelper.instance.getAHSPs();
      setState(() {
        ahspList = data;
      });
    } catch (e) {
      print("Error: $e");
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
                  "AHSP LIST",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 24,
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
                child: ListView.builder(
                  itemCount: ahspList.length,
                  itemBuilder: (context, index) {
                    final ahsp = ahspList[index];
                    final formattedPrice =
                        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
                            .format(ahsp['price'] as num);
                    return Card(
                      elevation: 3,
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        title: Text(ahsp['name']),
                        subtitle: Text(formattedPrice),
                        trailing: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _showEditDialog(context, ahsp);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _logout(context);
        },
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        child: Icon(Icons.logout),
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacementNamed(context, '/login');
  }

  Future<void> _showEditDialog(
      BuildContext context, Map<String, dynamic> ahsp) async {
    TextEditingController nameController =
        TextEditingController(text: ahsp['name']);
    TextEditingController priceController =
        TextEditingController(text: ahsp['price'].toString());

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit AHSP'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(labelText: 'Price'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final newName = nameController.text;
                final newPrice = double.parse(priceController.text);

                await DatabaseHelper.instance.updateAHSP({
                  'id': ahsp['id'],
                  'name': newName,
                  'price': newPrice,
                });

                _fetchAHSPData();

                Navigator.of(context).pop();
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
