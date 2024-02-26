import 'package:flutter/material.dart';
import 'package:halo_rumah_flutter/database_helper.dart';
import 'package:intl/intl.dart';

class ReportPage extends StatefulWidget {
  final String username;

  ReportPage({required this.username});
  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  List<Map<String, dynamic>> reportList = [];

  @override
  void initState() {
    super.initState();
    _fetchReportData();
  }

  Future<void> _fetchReportData() async {
    try {
      final List<Map<String, dynamic>> data =
          await DatabaseHelper.instance.getReports();
      setState(() {
        reportList = data;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> _showReportDialog(Map<String, dynamic> report) async {
    Widget buildText(String label, dynamic value) {
      final formatter = NumberFormat.currency(locale: 'id', symbol: 'Rp ');
      final formattedValue =
          (value is double) ? formatter.format(value) : value.toString();
      return Text(
        '$label : $formattedValue',
        style: TextStyle(fontSize: 16.0, fontFamily: 'inter'),
        textAlign: TextAlign.left,
      );
    }

    final formattedPrice = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
        .format(report['TotalCost'] as num);
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Detail Report'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Date: ${DateFormat('dd MMMM yyyy HH:mm:ss').format(DateTime.parse(report['date']))}',
            ),
            SizedBox(height: 8.0),
            Divider(thickness: 2),
            SizedBox(height: 8.0),
            Text(
              'Luas m²',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            // Menampilkan daftar detail
            Text(
              'Ruang Tamu : ${report['areaLivingRoom']} m²',
              style: TextStyle(fontSize: 16.0, fontFamily: 'inter'),
            ),
            Text(
              'Kamar : ${report['areaBedRoom']} m²',
              style: TextStyle(fontSize: 16.0, fontFamily: 'inter'),
            ),
            Text(
              'Kamar Utama : ${report['areaMainBedRoom']} m²',
              style: TextStyle(fontSize: 16.0, fontFamily: 'inter'),
            ),
            Text(
              'Kamar Mandi : ${report['areaBathRoom']} m²',
              style: TextStyle(fontSize: 16.0, fontFamily: 'inter'),
            ),
            Text(
              'Dapur : ${report['areaKitchen']} m²',
              style: TextStyle(fontSize: 16.0, fontFamily: 'inter'),
            ),
            Text(
              'Luas Halaman : ${report['areaYard']} m²',
              style: TextStyle(fontSize: 16.0, fontFamily: 'inter'),
            ),
            Text(
              'Luas Atap : ${report['areaRoof']} m²',
              style: TextStyle(fontSize: 16.0, fontFamily: 'inter'),
            ),
            SizedBox(height: 8.0),
            Divider(thickness: 2),
            SizedBox(height: 8.0),
            Text(
              'Rencana Anggaran Biaya',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center, // Center title
            ),
            SizedBox(height: 10.0),
            buildText(
              'Ruang Tamu',
              report['RABLivingRoom'],
            ),
            buildText(
              'Kamar',
              report['RABBedRoom'],
            ),
            buildText(
              'Kamar Utama',
              report['RABMainBedRoom'],
            ),
            buildText(
              'Kamar Mandi',
              report['RABBathRoom'],
            ),
            buildText(
              'Dapur',
              report['RABKitchen'],
            ),
            buildText(
              'Atap',
              report['RABRoof'],
            ),
            SizedBox(height: 8.0),
            Divider(thickness: 2),
            SizedBox(height: 8.0),
            Text(
              'Total Anggaran Biaya',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center, // Center title
            ),
            Text('Total Cost: $formattedPrice'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      ),
    );
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
                  "Report",
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
                  itemCount: reportList.length,
                  itemBuilder: (context, index) {
                    final report = reportList[index];
                    final formattedPrice =
                        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
                            .format(report['TotalCost'] as num);
                    return Card(
                      elevation: 3,
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        onTap: () {
                          _showReportDialog(report);
                        },
                        title: Text(
                          DateFormat('dd MMMM yyyy')
                              .format(DateTime.parse(report['date'])),
                        ),
                        subtitle: Text(formattedPrice),
                        trailing: Text(
                          DateFormat('HH.mm')
                              .format(DateTime.parse(report['date'])),
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
    );
  }
}
