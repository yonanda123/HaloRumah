import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double resultLivingRoom;
  final double resultBedRoom;
  final double resultMainBedRoom;
  final double resultBathRoom;
  final double resultKitchen;
  final double resultLuasBangunan;
  final int resultRABLivingRoom;
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
    required this.resultRABLivingRoom,
    required this.resultRABMainBedRoom,
    required this.resultRABBedRoom,
    required this.resultRABKitchen,
    required this.resultRABBathRoom,
  });

  // void launchWhatsApp({
  //   required String phone,
  //   required String message,
  // }) async {
  //   String url() {
  //     if (Platform.isAndroid) {
  //       // add the [https]
  //       return "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
  //     } else {
  //       // add the [https]
  //       return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}"; // new line
  //     }
  //   }

  //   if (await canLaunch(url())) {
  //     await launch(url());
  //   } else {
  //     throw 'Could not launch ${url()}';
  //   }
  // }

  void sendLongWhatsAppMessage({
    required String phone,
    required String message,
  }) async {
    final maxLength = 4096; // Panjang maksimum pesan yang dapat dikirim

    while (message.length > 0) {
      final part = message.substring(0, maxLength);
      message = message.substring(maxLength);

      final success = await launchWhatsApp(
        phone: phone,
        message: part,
      );

      if (!success) {
        throw 'Failed to send WhatsApp message';
      }
    }
  }

  Future<bool> launchWhatsApp({
    required String phone,
    required String message,
  }) async {
    final url = Uri.encodeFull("https://wa.me/$phone/?text=$message");

    if (await canLaunch(url)) {
      await launch(url);
      return true;
    } else {
      return false;
    }
  }

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
    final totalCost = (resultRABLivingRoom * 75731499.04) +
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
                  resultRABLivingRoom * 75731499.04,
                ),
                buildText(
                  'Kamar',
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
                  '$formattedTotalCost',
                  style: TextStyle(fontSize: 16.0, fontFamily: 'inter'),
                ),
                SizedBox(height: 24.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          textStyle: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                        onPressed: () {
                          launchWhatsApp(
                              phone: '+6282331050979',
                              message:
                                  'Luas m²\n\nRuang Tamu: $resultLivingRoom m²\nKamar : $resultBedRoom\nKamar Utama : $resultMainBedRoom m²\nKamar Mandi : $resultBathRoom m²\nDapur : $resultKitchen m²\nLuas Halaman : $resultLuasBangunan m²\n\n\nRencana Anggaran Biaya\n\nRuang Tamu: Rp. ${resultRABLivingRoom * 75731499.04} \n Kamar : Rp. ${resultRABBedRoom * 76162212.76}\nKamar Utama: Rp. ${resultRABMainBedRoom * 94721113.18}\nKamar Mandi : Rp. ${resultRABBathRoom * 79072268.08}\nDapur : Rp. ${resultRABKitchen * 76920471.98}\n\nTotal Anggaran : $formattedTotalCost');
                        },
                        child: Text(
                          'Tanya Ahli',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white10,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          textStyle: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                        onPressed: onPressed,
                        child: Text(
                          'OK',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ],
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
