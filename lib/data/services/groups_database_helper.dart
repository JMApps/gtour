import 'package:gtour/data/model/group.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class GroupsDatabaseHelper {
  static final GroupsDatabaseHelper _instance =
      GroupsDatabaseHelper._internal();

  factory GroupsDatabaseHelper() => _instance;

  GroupsDatabaseHelper._internal();

  final String _databaseName = 'groups.db';
  final String _tableName = 'Table_of_groups';
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
        users TEXT,
        data_travel TEXT,
        data_entry TEXT)
        ''');
  }

  Future<int> addGroup({required Group group}) async {
    final Database db = await _instance.getDatabase;
    return await db.insert(_tableName, group.toMap());
  }

  Future<List<Map<String, dynamic>>> getGroups() async {
    final Database db = await _instance.getDatabase;
    return await db.query(_tableName);
  }
}
