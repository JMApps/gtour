import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  final String _databaseName = 'users.db';
  final String _tableName = 'Table_of_users';
  final int _databaseVersion = 1;

  static Database? _database;

  Future<Database> get getDatabase async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await initDatabase();
      return _database!;
    }
  }

  initDatabase() async {
    String databasePath = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      databasePath,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int dbVersion) async {
    await db.execute('''CREATE TABLE $_tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        first_name TEXT,
        second_name TEXT)
        ''');
  }

  Future<int> addUser({required Map<String, dynamic> user}) async {
    final Database db = await _instance.getDatabase;
    return await db.insert(_tableName, user);
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final Database db = await _instance.getDatabase;
    return await db.query(_tableName);
  }

  Future<int> updateUser({required Map<String, dynamic> user, required int id}) async {
    final Database db = await _instance.getDatabase;
    return await db.update(_tableName, user, where: 'id == $id');
  }

  Future<int> deleteUser({required int id}) async {
    final Database db = await _instance.getDatabase;
    return await db.delete(_tableName, where: 'id == $id');
  }
}
