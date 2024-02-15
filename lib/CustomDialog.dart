import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:halo_rumah_flutter/database_helper.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final List<Map<String, dynamic>> ahspData;
  final double areaLivingRoom;
  final double areaBedRoom;
  final double areaMainBedRoom;
  final double areaBathRoom;
  final double areaKitchen;
  final double areaLuasBangunan;
  final double luasBangunan;
  final int amountLivingRoom;
  final int amountMainBedRoom;
  final int amountBedRoom;
  final int amountKitchen;
  final int amountBathRoom;

  CustomDialog({
    required this.title,
    required this.onPressed,
    required this.ahspData,
    required this.areaLivingRoom,
    required this.areaBedRoom,
    required this.areaMainBedRoom,
    required this.areaBathRoom,
    required this.areaKitchen,
    required this.areaLuasBangunan,
    required this.luasBangunan,
    required this.amountLivingRoom,
    required this.amountMainBedRoom,
    required this.amountBedRoom,
    required this.amountKitchen,
    required this.amountBathRoom,
  });

  void sendLongWhatsAppMessage({
    required String phone,
    required String message,
  }) async {
    final maxLength = 4096;

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
    final ruangTamuPrice = ahspData
        .firstWhere((ahsp) => ahsp['name'] == 'Ruang Tamu')['price'] as double;
    final kamarPrice = ahspData
        .firstWhere((ahsp) => ahsp['name'] == 'Kamar')['price'] as double;
    final kamarUtamaPrice = ahspData
        .firstWhere((ahsp) => ahsp['name'] == 'Kamar Utama')['price'] as double;
    final kamarMandiPrice = ahspData
        .firstWhere((ahsp) => ahsp['name'] == 'Kamar Mandi')['price'] as double;
    final dapurPrice = ahspData
        .firstWhere((ahsp) => ahsp['name'] == 'Dapur')['price'] as double;
    final atapPrice = ahspData
        .firstWhere((ahsp) => ahsp['name'] == 'Atap')['price'] as double;
    final totalCost = (amountLivingRoom * 75731499.04) +
        (amountBedRoom * 76162212.76) +
        (amountMainBedRoom * 94721113.18) +
        (amountBathRoom * 79072268.08) +
        (amountKitchen * 76920471.98) +
        (luasBangunan * 349056);

    final formatter = NumberFormat.currency(locale: 'id', symbol: 'Rp ');
    final TotalCost = formatter.format(totalCost);

    final double RABLivingRoom = amountLivingRoom * ruangTamuPrice;
    final double RABBedRoom = amountBedRoom * kamarPrice;
    final double RABMainBedRoom = amountMainBedRoom * kamarUtamaPrice;
    final double RABBathRoom = amountBathRoom * kamarMandiPrice;
    final double RABKitchen = amountKitchen * dapurPrice;
    final double RABLuasBangunan = luasBangunan * atapPrice;

    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 48, left: 24, right: 24, bottom: 24),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.0),
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
                  'Ruang Tamu : $areaLivingRoom m²',
                  style: TextStyle(fontSize: 16.0, fontFamily: 'inter'),
                ),
                Text(
                  'Kamar : $areaBedRoom m²',
                  style: TextStyle(fontSize: 16.0, fontFamily: 'inter'),
                ),
                Text(
                  'Kamar Utama : $areaMainBedRoom m²',
                  style: TextStyle(fontSize: 16.0, fontFamily: 'inter'),
                ),
                Text(
                  'Kamar Mandi : $areaBathRoom m²',
                  style: TextStyle(fontSize: 16.0, fontFamily: 'inter'),
                ),
                Text(
                  'Dapur : $areaKitchen m²',
                  style: TextStyle(fontSize: 16.0, fontFamily: 'inter'),
                ),
                Text(
                  'Luas Halaman : $areaLuasBangunan m²',
                  style: TextStyle(fontSize: 16.0, fontFamily: 'inter'),
                ),
                Text(
                  'Luas Atap : $luasBangunan m²',
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
                  RABLivingRoom,
                ),
                buildText(
                  'Kamar',
                  RABBedRoom,
                ),
                buildText(
                  'Kamar Utama',
                  RABMainBedRoom,
                ),
                buildText(
                  'Kamar Mandi',
                  RABBathRoom,
                ),
                buildText(
                  'Dapur',
                  RABKitchen,
                ),
                buildText(
                  'Atap',
                  RABLuasBangunan,
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
                  '$TotalCost',
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
                              phone: '+6281357795007',
                              message:
                                  'Luas m²\n\nRuang Tamu: $areaLivingRoom m²\nKamar : $areaBedRoom\nKamar Utama : $areaMainBedRoom m²\nKamar Mandi : $areaBathRoom m²\nDapur : $areaKitchen m²\nLuas Halaman : $areaLuasBangunan m²\n\n\nRencana Anggaran Biaya\n\nRuang Tamu: Rp. ${amountLivingRoom * ruangTamuPrice} \n Kamar : Rp. ${amountBedRoom * kamarPrice}\nKamar Utama: Rp. ${amountMainBedRoom * kamarUtamaPrice}\nKamar Mandi : Rp. ${amountBathRoom * kamarMandiPrice}\nDapur : Rp. ${amountKitchen * dapurPrice}\nAtap : Rp. ${luasBangunan * atapPrice}\n\nTotal Anggaran : $TotalCost');
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
                        onPressed: () async {
                          final Map<String, dynamic> reportData = {
                            'date': DateTime.now().toIso8601String(),
                            'areaLivingRoom': areaLivingRoom,
                            'areaBedRoom': areaBedRoom,
                            'areaMainBedRoom': areaMainBedRoom,
                            'areaBathRoom': areaBathRoom,
                            'areaKitchen': areaKitchen,
                            'areaYard': areaLuasBangunan,
                            'areaRoof': luasBangunan,
                            'RABLivingRoom': RABLivingRoom,
                            'RABBedRoom': RABBedRoom,
                            'RABMainBedRoom': RABMainBedRoom,
                            'RABBathRoom': RABBathRoom,
                            'RABKitchen': RABKitchen,
                            'RABRoof': RABLuasBangunan,
                            'TotalCost': totalCost,
                          };
                          try {
                            await DatabaseHelper.instance
                                .insertReport(reportData);
                            print('Data tersimpan dalam tabel report');
                          } catch (e) {
                            print('Gagal menyimpan data: $e');
                          }
                          onPressed();
                        },
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
