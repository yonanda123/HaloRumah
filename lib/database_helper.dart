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
        role INTEGER
      )
    ''');
    // Insert your user data here
    await db.rawInsert(
      'INSERT INTO users(username, password, role) VALUES (?, ?, ?)',
      ['halorumah01', '6862c180fc5', '2'],
    );
    // Insert other user data;
  }

  // Future<int> insertUser(Map<String, dynamic> user) async {
  //   final db = await instance.database;
  //   return await db.insert('users', user);
  // }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await instance.database;
    return await db.query('users');
  }
}
