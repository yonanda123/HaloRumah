import 'package:flutter/material.dart';
import 'package:halo_rumah_flutter/CustomDialog.dart';

class Process extends StatefulWidget {
  const Process({super.key});

  @override
  State<Process> createState() => _ProcessState();
}

class _ProcessState extends State<Process> {
  int jumlahPintu = 1;
  int _index = 0;
  int _currentHorizontalIntValueLivingRoom = 0;
  int _currentHorizontalIntValueBedRoom = 0;
  int _currentHorizontalIntValueBathRoom = 0;
  int _currentHorizontalIntValueKitchen = 0;
  int _currentHorizontalIntValueMainBedRoom = 0;
  

  // final double _currentHorizontalDoubleValueLivingRoom =
  //     _currentHorizontalIntValueLivingRoom.toDouble();
  // double _currentHorizontalDoubleValueBedRoom =
  //     _currentHorizontalIntValueBedRoom.toDouble();
  // double _currentHorizontalDoubleValueBathRoom =
  //     _currentHorizontalIntValueBathRoom.toDouble();
  // double _currentHorizontalDoubleValueKitchen =
  //     _currentHorizontalIntValueKitchen.toDouble();
  // double _currentHorizontalDoubleValueMainBedRoom =
  //     _currentHorizontalIntValueMainBedRoom.toDouble();

  double _luasBangunan = 0.0;
  double panjangBangunan = 0.0;
  double lebarBangunan = 0.0;
  double resultLivingRoom = 0.0;
  double resultBedRoom = 0.0;
  double resultBathRoom = 0.0;
  double resultKitchen = 0.0;
  double resultMainBedRoom = 0.0;

  final TextEditingController panjangTanahController = TextEditingController();
  final TextEditingController lebarTanahController = TextEditingController();
  final TextEditingController panjangBangunanController =
      TextEditingController();
  final TextEditingController lebarBangunanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.light(primary: Colors.red),
      ),
      child: Stepper(
        type: StepperType.horizontal,
        currentStep: _index,
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
              if (_index == 0) {
                _currentHorizontalIntValueBedRoom = 0;
                _currentHorizontalIntValueLivingRoom = 0;
                _currentHorizontalIntValueBathRoom = 0;
                _currentHorizontalIntValueKitchen = 0;
                _currentHorizontalIntValueMainBedRoom = 0;
              }
            });
          }
        },
        onStepContinue: () {
          if (_index == 0) {
            double panjangTanah =
                double.tryParse(panjangTanahController.text) ?? 0;
            double lebarTanah = double.tryParse(lebarTanahController.text) ?? 0;
            panjangBangunan =
                double.tryParse(panjangBangunanController.text) ?? 0;
            lebarBangunan = double.tryParse(lebarBangunanController.text) ?? 0;

            double luasTanah = panjangTanah * lebarTanah;
            _luasBangunan = panjangBangunan * lebarBangunan;

            if (_luasBangunan >= luasTanah) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Perbandingan Luas'),
                    content: Text('Luas bangunan lebih besar dari luas tanah.'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            } else {
              // Move to the next step
              setState(() {
                _index += 1;
              });
            }
          } else if (_index == 1) {
            if (_currentHorizontalIntValueLivingRoom == 0 ||
                _currentHorizontalIntValueBedRoom == 0 ||
                _currentHorizontalIntValueBathRoom == 0 ||
                _currentHorizontalIntValueKitchen == 0 ||
                _currentHorizontalIntValueMainBedRoom == 0) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Periksa Ruangan'),
                    content: Text(
                        'Semua ruangan harus memiliki nilai lebih dari 0.'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomDialog(
                    title: "Detail Pembangunan",
                    resultLivingRoom: resultLivingRoom,
                    resultBedRoom: resultBedRoom,
                    resultMainBedRoom: resultMainBedRoom,
                    resultBathRoom: resultBathRoom,
                    resultKitchen: resultKitchen,
                    resultLuasBangunan: _luasBangunan,
                    resultRABLivinRoom: _currentHorizontalIntValueLivingRoom,
                    resultRABBedRoom: _currentHorizontalIntValueBedRoom,
                    resultRABMainBedRoom: _currentHorizontalIntValueMainBedRoom,
                    resultRABBathRoom: _currentHorizontalIntValueBathRoom,
                    resultRABKitchen: _currentHorizontalIntValueKitchen,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  );
                },
              );
            }
          }
        },
        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              if (_index != 0)
                TextButton(
                  onPressed: details.onStepCancel,
                  child: const Text('CANCEL'),
                ),
              SizedBox(width: 8),
              TextButton(
                onPressed: details.onStepContinue,
                child: const Text('NEXT'),
              ),
            ],
          );
        },
        steps: <Step>[
          Step(
            isActive: _index >= 0,
            title: const Text('Step 1'),
            content: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Luas Tanah',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 19 / 16,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: panjangTanahController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Panjang Tanah',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.crop_landscape),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        panjangTanahController.clear();
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16.0), // Jarak antar TextField
                TextField(
                  controller: lebarTanahController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Lebar Tanah',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.crop_portrait),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        lebarTanahController.clear();
                      },
                    ),
                  ),
                ),
                SizedBox(height: 24.0), // Jarak antar TextField
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Luas Bangunan',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 19 / 16,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: panjangBangunanController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Panjang Bangunan',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.home),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        panjangBangunanController.clear();
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16.0), // Jarak antar TextField
                TextField(
                  controller: lebarBangunanController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Lebar Bangunan',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.house),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        // Fungsi untuk menghapus input
                        lebarBangunanController.clear();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Step(
            isActive: _index >= 1,
            title: Text('Step 2'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Image.asset(
                                    'assets/images/livingroom.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  onPressed: () {},
                                ),
                                SizedBox(width: 24),
                                Text(
                                  'Ruang Tamu',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(width: 8),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () => setState(() {
                                        if (_currentHorizontalIntValueLivingRoom >
                                            0) {
                                          final newValue =
                                              _currentHorizontalIntValueLivingRoom -
                                                  1;
                                          _currentHorizontalIntValueLivingRoom =
                                              newValue.clamp(0, 2);
                                          _luasBangunan += 9;
                                          resultLivingRoom =
                                              _currentHorizontalIntValueLivingRoom *
                                                  9;
                                        }
                                      }),
                                    ),
                                    Text(
                                        '$_currentHorizontalIntValueLivingRoom'),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () => setState(() {
                                        if (_currentHorizontalIntValueLivingRoom <
                                                2 &&
                                            _luasBangunan >= 9) {
                                          final newValue =
                                              _currentHorizontalIntValueLivingRoom +
                                                  1;
                                          _currentHorizontalIntValueLivingRoom =
                                              newValue.clamp(0, 2);
                                          _luasBangunan -= 9;
                                          resultLivingRoom =
                                              _currentHorizontalIntValueLivingRoom *
                                                  9;
                                        }
                                      }),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Luas ${resultLivingRoom} m²',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Visibility(
                          visible: _currentHorizontalIntValueLivingRoom > 1,
                          child: Container(
                            padding: EdgeInsets.only(top: 16),
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Alert: ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      color: Colors.red,
                                      fontWeight: FontWeight
                                          .w900, // Set FontWeight.w700 for 'Alert'
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'Your living room value is greater than 1.',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      color: Colors.red,
                                      fontWeight: FontWeight
                                          .w500, // Set FontWeight.w500 for the alert message
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Image.asset(
                                    'assets/images/bedroom.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  onPressed: () {},
                                ),
                                SizedBox(width: 24),
                                Text(
                                  'Kamar',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(width: 8),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () => setState(() {
                                        if (_currentHorizontalIntValueBedRoom >
                                            0) {
                                          final newValue =
                                              _currentHorizontalIntValueBedRoom -
                                                  1;
                                          _currentHorizontalIntValueBedRoom =
                                              newValue.clamp(0, 5);
                                          _luasBangunan += 9;
                                          resultBedRoom =
                                              _currentHorizontalIntValueBedRoom *
                                                  9;
                                        }
                                      }),
                                    ),
                                    Text('$_currentHorizontalIntValueBedRoom'),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () => setState(() {
                                        if (_currentHorizontalIntValueBedRoom <
                                                5 &&
                                            _luasBangunan >= 9) {
                                          final newValue =
                                              _currentHorizontalIntValueBedRoom +
                                                  1;
                                          _currentHorizontalIntValueBedRoom =
                                              newValue.clamp(0, 5);
                                          _luasBangunan -= 9;
                                          resultBedRoom =
                                              _currentHorizontalIntValueBedRoom *
                                                  9;
                                        }
                                      }),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Luas ${resultBedRoom} m²',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Visibility(
                          visible: _currentHorizontalIntValueBedRoom > 3,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Alert: ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      color: Colors.red,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'Your bedroom value is greater than 1.',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Image.asset(
                                    'assets/images/main_bedRoom.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  onPressed: () {},
                                ),
                                SizedBox(width: 24),
                                Text(
                                  'Kamar Utama',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(width: 8),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () => setState(() {
                                        if (_currentHorizontalIntValueMainBedRoom >
                                            0) {
                                          final newValue =
                                              _currentHorizontalIntValueMainBedRoom -
                                                  1;
                                          _currentHorizontalIntValueMainBedRoom =
                                              newValue.clamp(0, 5);
                                          _luasBangunan += 13.5;
                                          resultMainBedRoom =
                                              _currentHorizontalIntValueMainBedRoom *
                                                  13.5;
                                        }
                                      }),
                                    ),
                                    Text(
                                        '$_currentHorizontalIntValueMainBedRoom'),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () => setState(() {
                                        if (_currentHorizontalIntValueMainBedRoom <
                                                5 &&
                                            _luasBangunan >= 13.5) {
                                          final newValue =
                                              _currentHorizontalIntValueMainBedRoom +
                                                  1;
                                          _currentHorizontalIntValueMainBedRoom =
                                              newValue.clamp(0, 5);
                                          _luasBangunan -= 13.5;
                                          resultMainBedRoom =
                                              _currentHorizontalIntValueMainBedRoom *
                                                  13.5;
                                        }
                                      }),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Luas ${resultMainBedRoom} m²',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Visibility(
                          visible: _currentHorizontalIntValueMainBedRoom > 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Alert: ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      color: Colors.red,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'Your main bedroom value is greater than 1.',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Image.asset(
                                    'assets/images/bathroom.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  onPressed: () {},
                                ),
                                SizedBox(width: 24),
                                Text(
                                  'Kamar Mandi',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(width: 8),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () => setState(() {
                                        if (_currentHorizontalIntValueBathRoom >
                                            0) {
                                          final newValue =
                                              _currentHorizontalIntValueBathRoom -
                                                  1;
                                          _currentHorizontalIntValueBathRoom =
                                              newValue.clamp(0, 3);
                                          _luasBangunan += 2.25;
                                          resultBathRoom =
                                              _currentHorizontalIntValueBathRoom *
                                                  2.25;
                                        }
                                      }),
                                    ),
                                    Text('$_currentHorizontalIntValueBathRoom'),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () => setState(() {
                                        if (_currentHorizontalIntValueBathRoom <
                                                3 &&
                                            _luasBangunan >= 2.25) {
                                          final newValue =
                                              _currentHorizontalIntValueBathRoom +
                                                  1;
                                          _currentHorizontalIntValueBathRoom =
                                              newValue.clamp(0, 3);
                                          _luasBangunan -= 2.25;
                                          resultBathRoom =
                                              _currentHorizontalIntValueBathRoom *
                                                  2.25;
                                        }
                                      }),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Luas ${resultBathRoom} m²',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Visibility(
                          visible: _currentHorizontalIntValueBathRoom > 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Alert: ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      color: Colors.red,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'Your bathroom value is greater than 1.',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Image.asset(
                                    'assets/images/kitchen.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  onPressed: () {},
                                ),
                                SizedBox(width: 24),
                                Text(
                                  'Dapur',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(width: 8),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () => setState(() {
                                        if (_currentHorizontalIntValueKitchen >
                                            0) {
                                          final newValue =
                                              _currentHorizontalIntValueKitchen -
                                                  1;
                                          _currentHorizontalIntValueKitchen =
                                              newValue.clamp(0, 2);
                                          _luasBangunan += 9;
                                          resultKitchen =
                                              _currentHorizontalIntValueKitchen *
                                                  9;
                                        }
                                      }),
                                    ),
                                    Text('$_currentHorizontalIntValueKitchen'),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () => setState(() {
                                        if (_currentHorizontalIntValueKitchen <
                                                2 &&
                                            _luasBangunan >= 9) {
                                          final newValue =
                                              _currentHorizontalIntValueKitchen +
                                                  1;
                                          _currentHorizontalIntValueKitchen =
                                              newValue.clamp(0, 2);
                                          _luasBangunan -= 9;
                                          resultKitchen =
                                              _currentHorizontalIntValueKitchen *
                                                  9;
                                        }
                                      }),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Luas ${resultKitchen} m²',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Visibility(
                          visible: _currentHorizontalIntValueKitchen > 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Alert: ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      color: Colors.red,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'Your kitchen value is greater than 1.',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Luas Bangunan : $_luasBangunan m²',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
