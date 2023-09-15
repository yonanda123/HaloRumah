import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double resultLivingRoom;
  final double resultBedRoom;
  final double resultMainBedRoom;
  final double resultBathRoom;
  final double resultKitchen;
  final double resultLuasBangunan;
  final int resultRABLivinRoom;
  final int resultRABMainBedRoom;
  final int resultRABBedRoom;
  final int resultRABKitchen;
  final int resultRABBathRoom;

  CustomDialog({
    required this.title,
    required this.onPressed,
    required this.resultLivingRoom,
    required this.resultBedRoom,
    required this.resultMainBedRoom,
    required this.resultBathRoom,
    required this.resultKitchen,
    required this.resultLuasBangunan,
    required this.resultRABLivinRoom,
    required this.resultRABMainBedRoom,
    required this.resultRABBedRoom,
    required this.resultRABKitchen,
    required this.resultRABBathRoom,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    final totalCost = (resultRABLivinRoom * 75731499.04) +
        (resultRABBedRoom * 76162212.76) +
        (resultRABMainBedRoom * 94721113.18) +
        (resultRABBathRoom * 79072268.08) +
        (resultRABKitchen * 76920471.98);

    final formatter = NumberFormat.currency(locale: 'id', symbol: 'Rp ');
    final formattedTotalCost = formatter.format(totalCost);

    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 48,
                left: 24,
                right: 24,
                bottom: 24), // Use consistent padding
            margin: EdgeInsets.only(top: 66.0),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 10),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to the left
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center, // Center title
                ),
                SizedBox(height: 24.0),
                Text(
                  'Luas m²',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center, // Center title
                ),
                SizedBox(height: 10.0),
                // Menampilkan daftar detail
                Text(
                  'Ruang Tamu : $resultLivingRoom m²',
                  style: TextStyle(fontSize: 16.0, fontFamily: 'inter'),
                ),
                Text(
                  'Kamar : $resultBedRoom m²',
                  style: TextStyle(fontSize: 16.0, fontFamily: 'inter'),
                ),
                Text(
                  'Kamar Utama : $resultMainBedRoom m²',
                  style: TextStyle(fontSize: 16.0, fontFamily: 'inter'),
                ),
                Text(
                  'Kamar Mandi : $resultBathRoom m²',
                  style: TextStyle(fontSize: 16.0, fontFamily: 'inter'),
                ),
                Text(
                  'Dapur : $resultKitchen m²',
                  style: TextStyle(fontSize: 16.0, fontFamily: 'inter'),
                ),
                Text(
                  'Luas Halaman : $resultLuasBangunan m²',
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
                  resultRABLivinRoom * 75731499.04,
                ),
                buildText(
                  'Kamar Utama',
                  resultRABBedRoom * 76162212.76,
                ),
                buildText(
                  'Kamar Utama',
                  resultRABMainBedRoom * 94721113.18,
                ),
                buildText(
                  'Kamar Mandi',
                  resultRABBathRoom * 79072268.08,
                ),
                buildText(
                  'Dapur',
                  resultRABKitchen * 76920471.98,
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
                SizedBox(height: 10.0),
                Text(
                  '$formattedTotalCost ',
                  style: TextStyle(fontSize: 16.0, fontFamily: 'inter'),
                ),
                SizedBox(height: 24.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: onPressed,
                    child: Text(
                      'OK',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 16.0,
            right: 16.0,
            child:
                Image.asset('assets/images/RUMAH.png', width: 100, height: 100),
          ),
        ],
      ),
    );
  }

  // Helper function to build formatted text
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
}
