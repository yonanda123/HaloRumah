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
      image TEXT
    )
  ''');

    final List<Map<String, dynamic>> usersToInsert = [
      {
        'username': 'admin',
        'password': 'admin',
        'role': 1,
        'name': 'admin',
        'address': 'admin',
        'image': 'default.png'
      },
      {
        'username': 'halorumah01',
        'password': '6862c180fc5',
        'role': 2,
        'name': 'UNKNOWN',
        'address': 'UNKNOWN',
        'image': 'default.png'
      },
      // {'username': 'halorumah02', 'password': 'b48fddc5eae', 'role': 2},
      // {'username': 'halorumah03', 'password': '9d2d76e951e', 'role': 2},
      // {'username': 'halorumah04', 'password': '2cf07f667a3', 'role': 2},
      // {'username': 'halorumah05', 'password': '0d139645fcf', 'role': 2},
      // {'username': 'halorumah06', 'password': '11057d1ff7d', 'role': 2},
      // {'username': 'halorumah07', 'password': 'f8158c2c89f', 'role': 2},
      // {'username': 'halorumah08', 'password': '566ce0a5187', 'role': 2},
      // {'username': 'halorumah09', 'password': 'f8e6878ed6e', 'role': 2},
      // {'username': 'halorumah10', 'password': '5efb773342d', 'role': 2},
      // {'username': 'halorumah11', 'password': '622026298cc', 'role': 2},
      // {'username': 'halorumah12', 'password': '40592eafbec', 'role': 2},
      // {'username': 'halorumah13', 'password': '62a1c95f1ea', 'role': 2},
      // {'username': 'halorumah14', 'password': 'e56b575797b', 'role': 2},
      // {'username': 'halorumah15', 'password': '35e43e5d088', 'role': 2},
      // {'username': 'halorumah16', 'password': '22d1c9eb93b', 'role': 2},
      // {'username': 'halorumah17', 'password': 'd491b208fe7', 'role': 2},
      // {'username': 'halorumah18', 'password': '5c5a5b29af0', 'role': 2},
      // {'username': 'halorumah19', 'password': 'e45517127bf', 'role': 2},
      // {'username': 'halorumah20', 'password': '03c676ed5a0', 'role': 2},
      // {'username': 'halorumah21', 'password': '4a5205a6a05', 'role': 2},
      // {'username': 'halorumah22', 'password': '76b9554b4fc', 'role': 2},
      // {'username': 'halorumah23', 'password': '32ac155a9f7', 'role': 2},
      // {'username': 'halorumah24', 'password': '08690b54956', 'role': 2},
      // {'username': 'halorumah25', 'password': '537eab04f2d', 'role': 2},
      // {'username': 'halorumah26', 'password': '61b176719cb', 'role': 2},
      // {'username': 'halorumah27', 'password': '7fa2270c33d', 'role': 2},
      // {'username': 'halorumah28', 'password': '77b269f7df5', 'role': 2},
      // {'username': 'halorumah29', 'password': '3ba0110b4ed', 'role': 2},
      // {'username': 'halorumah30', 'password': '8f6e8598b22', 'role': 2},
      // {'username': 'halorumah31', 'password': '963ae193355', 'role': 2},
      // {'username': 'halorumah32', 'password': '25dd2c35d62', 'role': 2},
      // {'username': 'halorumah33', 'password': 'f7808567206', 'role': 2},
      // {'username': 'halorumah34', 'password': '9f2d37efd0d', 'role': 2},
      // {'username': 'halorumah35', 'password': 'cfac21b1c15', 'role': 2},
      // {'username': 'halorumah36', 'password': '68775ab37f5', 'role': 2},
      // {'username': 'halorumah37', 'password': '2c28f5c03a0', 'role': 2},
      // {'username': 'halorumah38', 'password': 'a1d686cd50d', 'role': 2},
      // {'username': 'halorumah39', 'password': 'a573e6340d2', 'role': 2},
      // {'username': 'halorumah40', 'password': '2773d7fe483', 'role': 2},
      // Tambahkan data pengguna lainnya sesuai kebutuhan
    ];

    Batch batch = db.batch();
    for (final user in usersToInsert) {
      batch.insert('users', user);
    }
    await batch.commit();
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
}
