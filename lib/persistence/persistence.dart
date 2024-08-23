import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'my_home.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Lights (
        id INTEGER PRIMARY KEY,
        name TEXT,
        dimmable INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE Categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        isPreset INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE CategoryLights (
        categoryId INTEGER,
        lightId INTEGER,
        FOREIGN KEY (categoryId) REFERENCES Categories(id),
        FOREIGN KEY (lightId) REFERENCES Lights(id)
      )
    ''');
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
