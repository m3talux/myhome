import 'package:myhome/models/models.dart';
import 'package:myhome/persistence/persistence.dart';
import 'package:sqflite/sqflite.dart';

class LightService {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  Future<int> addLight(Light light) async {
    final db = await _dbHelper.database;
    return db.insert(
      'Lights',
      {
        'id': light.id,
        'name': light.name,
        'dimmable': light.dimmable ? 1 : 0,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateLight(Light light) async {
    final db = await _dbHelper.database;

    await db.update(
      'Lights',
      {
        'name': light.name,
        'dimmable': light.dimmable ? 1 : 0,
      },
      where: 'id = ?',
      whereArgs: [light.id],
    );
  }

  Future<List<Light>> getAllLights() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('Lights');
    return List.generate(maps.length, (i) {
      return Light(
        maps[i]['id'],
        maps[i]['name'],
        maps[i]['dimmable'] == 1,
      );
    });
  }

  Future<List<Light>> getLightsNotInAnyCategory() async {
    final db = await _dbHelper.database;

    // Query to get all lights not in CategoryLights
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT * FROM Lights
      WHERE id NOT IN (
        SELECT lightId FROM CategoryLights
      )
    ''');

    return List.generate(maps.length, (i) {
      return Light(
        maps[i]['id'],
        maps[i]['name'],
        maps[i]['dimmable'] == 1,
      );
    });
  }

  Future<void> deleteLight(int id) async {
    final db = await _dbHelper.database;
    await db.delete(
      'Lights',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
