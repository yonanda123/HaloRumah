import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String databasePath = await getDatabasesPath();
    final String path = join(databasePath, 'my_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
    CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT,
      password TEXT,
      role INTEGER,
      name TEXT,
      address TEXT,
      image TEXT,
      phone TEXT
    )
  ''');

    await db.execute('''
    CREATE TABLE AHSP(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      price REAL
    )
  ''');

    await db.execute('''
    CREATE TABLE report(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      date TIMESTAMP,
      areaLivingRoom REAL,
      areaBedRoom REAL,
      areaMainBedRoom REAL,
      areaBathRoom REAL,
      areaKitchen REAL,
      areaYard REAL,
      areaRoof REAL,
      RABLivingRoom REAL,
      RABBedRoom REAL,
      RABMainBedRoom REAL,
      RABBathRoom REAL,
      RABKitchen REAL,
      RABRoof REAL,
      TotalCost REAL
    )
  ''');

    final List<Map<String, dynamic>> usersToInsert = [
      {
        'username': 'admin',
        'password': 'admin',
        'role': 1,
        'name': 'admin',
        'address': 'admin',
        'image': 'default.png',
        'phone': '008233334444'
      },
      {
        'username': 'halorumah01',
        'password': '6862c180fc5',
        'role': 2,
        'name': 'unknown',
        'address': 'unknown',
        'image': 'default.png',
        'phone': '00000000000'
      },
    ];

    Batch batch = db.batch();
    for (final user in usersToInsert) {
      batch.insert('users', user);
    }
    await batch.commit();

    final List<Map<String, dynamic>> ahspToInsert = [
      {'name': 'Ruang Tamu', 'price': 75731499.04},
      {'name': 'Kamar', 'price': 76162212.76},
      {'name': 'Kamar Utama', 'price': 94721113.18},
      {'name': 'Kamar Mandi', 'price': 79072268.08},
      {'name': 'Dapur', 'price': 76920471.98},
      {'name': 'Atap', 'price': 349056},
    ];

    Batch ahspBatch = db.batch();
    for (final ahsp in ahspToInsert) {
      ahspBatch.insert('AHSP', ahsp);
    }
    await ahspBatch.commit();
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await instance.database;
    return await db.query('users');
  }

  Future<int> updateUser(Map<String, dynamic> users) async {
    final db = await instance.database;
    final int id = users['id'];
    return await db.update(
      'users',
      users,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<Map<String, dynamic>> getUserByUsername(String username) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
    );
    if (result.isNotEmpty) {
      return result.first;
    } else {
      throw Exception('User not found');
    }
  }

  Future<int> insertAHSP(Map<String, dynamic> ahsp) async {
    final db = await instance.database;
    return await db.insert('AHSP', ahsp);
  }

  Future<int> updateAHSP(Map<String, dynamic> ahsp) async {
    final db = await instance.database;
    final int id = ahsp['id'];
    return await db.update(
      'AHSP',
      ahsp,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAHSP(int id) async {
    final db = await instance.database;
    return await db.delete(
      'AHSP',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> getAHSPs() async {
    final db = await instance.database;
    return await db.query('AHSP');
  }

  Future<int> insertReport(Map<String, dynamic> report) async {
    final db = await instance.database;
    return await db.insert('report', report);
  }

  Future<List<Map<String, dynamic>>> getReports() async {
    final db = await instance.database;
    return await db.query('report');
  }
}
