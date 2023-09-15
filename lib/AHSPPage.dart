import 'package:flutter/material.dart';

class AHSP extends StatelessWidget {
  // Fungsi untuk mendefinisikan gaya teks terpusat
  TextStyle _centeredTextStyle({
    double? fontSize, // Tambahkan '?' untuk mengizinkan nilai null
    FontWeight? fontWeight, // Tambahkan '?' untuk mengizinkan nilai null
    double? lineHeight, // Tambahkan '?' untuk mengizinkan nilai null
    double? letterSpacing, // Tambahkan '?' untuk mengizinkan nilai null
    Color? textColor, // Tambahkan '?' untuk mengizinkan nilai null
  }) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: fontSize ?? 16.0, // Nilai default jika null
      fontWeight: fontWeight ?? FontWeight.normal, // Nilai default jika null
      height:
          (lineHeight ?? 1.0) / (fontSize ?? 16.0), // Nilai default jika null
      letterSpacing: letterSpacing ?? 0.0, // Nilai default jika null
      color: textColor ?? Colors.black, // Nilai default jika null
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              'REKAPITULASI AHSP PEKERJAAN',
              style: _centeredTextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                textColor: Colors.black,
              ),
            ),
            DataTable(
              columns: <DataColumn>[
                DataColumn(
                  label: Text('Nomer',
                      style: _centeredTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          textColor: Colors.white)),
                ),
                DataColumn(
                  label: Text('Uraian Pekerjaan',
                      style: _centeredTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          textColor: Colors.white)),
                ),
                DataColumn(
                  label: Text('Biaya Pekerjaan',
                      style: _centeredTextStyle(textColor: Colors.white)),
                ),
              ],
              rows: <DataRow>[
                DataRow(
                  color: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    // Warna latar belakang abu-abu (grey) untuk baris yang bukan 1.1
                    if (states.contains(MaterialState.selected)) {
                      return Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.08);
                    }
                    return Colors.grey;
                  }),
                  cells: <DataCell>[
                    DataCell(Text('1',
                        style: _centeredTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            textColor: Colors.white))),
                    DataCell(Text('PEKERJAAN PERSIAPAN',
                        style: _centeredTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            textColor: Colors.white))),
                    DataCell(Text('',
                        style: _centeredTextStyle(textColor: Colors.white))),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('1.1',
                        style: _centeredTextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400))),
                    DataCell(Text('Sub Pekerjaan 1',
                        style: _centeredTextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400))),
                    DataCell(Text('500',
                        style: _centeredTextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400))),
                  ],
                ),
                DataRow(
                  color: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    // Warna latar belakang abu-abu (grey) untuk semua baris selain 1.1
                    if (states.contains(MaterialState.selected)) {
                      return Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.08);
                    }
                    return Colors.grey;
                  }),
                  cells: <DataCell>[
                    DataCell(Text('2',
                        style: _centeredTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            textColor: Colors.white))),
                    DataCell(Text('Pekerjaan 2',
                        style: _centeredTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            textColor: Colors.white))),
                    DataCell(Text('800',
                        style: _centeredTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            textColor: Colors.white))),
                  ],
                ),
                DataRow(
                  color: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    // Warna latar belakang abu-abu (grey) untuk semua baris selain 1.1
                    if (states.contains(MaterialState.selected)) {
                      return Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.08);
                    }
                    return Colors.grey;
                  }),
                  cells: <DataCell>[
                    DataCell(Text('3',
                        style: _centeredTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            textColor: Colors.white))),
                    DataCell(Text('Pekerjaan 3',
                        style: _centeredTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            textColor: Colors.white))),
                    DataCell(Text('1200',
                        style: _centeredTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            textColor: Colors.white))),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
