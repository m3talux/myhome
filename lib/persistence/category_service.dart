import 'package:myhome/models/models.dart';
import 'package:myhome/persistence/persistence.dart';
import 'package:sqflite/sqflite.dart';

class CategoryService {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  Future<int> addCategory(Category category) async {
    final db = await _dbHelper.database;

    int categoryId = await db.insert(
      'Categories',
      {
        'name': category.name,
        'isPreset': category.isPreset ? 1 : 0,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    for (Light light in category.lights) {
      await db.insert(
        'CategoryLights',
        {
          'categoryId': categoryId,
          'lightId': light.id,
        },
      );
    }

    return categoryId;
  }

  Future<List<Category>> getAllCategories() async {
    final db = await _dbHelper.database;

    final List<Map<String, dynamic>> categoryMaps =
        await db.query('Categories');

    List<Category> categories = [];
    for (var categoryMap in categoryMaps) {
      int categoryId = categoryMap['id'];

      final List<Map<String, dynamic>> lightMaps = await db.query(
        'Lights',
        where:
            'id IN (SELECT lightId FROM CategoryLights WHERE categoryId = ?)',
        whereArgs: [categoryId],
      );

      List<Light> lights = lightMaps.map((lightMap) {
        return Light(
          lightMap['id'],
          lightMap['name'],
          lightMap['dimmable'] == 1,
        );
      }).toList();

      categories.add(Category(
        categoryId,
        categoryMap['name'],
        lights,
        categoryMap['isPreset'] == 1,
      ));
    }

    return categories;
  }

  Future<void> deleteCategory(int id) async {
    final db = await _dbHelper.database;
    await db.delete(
      'Categories',
      where: 'id = ?',
      whereArgs: [id],
    );
    await db.delete(
      'CategoryLights',
      where: 'categoryId = ?',
      whereArgs: [id],
    );
  }

  Future<void> addLightToCategory(int categoryId, Light light) async {
    final db = await _dbHelper.database;
    // Check if the light is already in the category
    final List<Map<String, dynamic>> existing = await db.query(
      'CategoryLights',
      where: 'categoryId = ? AND lightId = ?',
      whereArgs: [categoryId, light.id],
    );

    if (existing.isEmpty) {
      await db.insert(
        'CategoryLights',
        {
          'categoryId': categoryId,
          'lightId': light.id,
        },
      );
    }
  }

  Future<void> removeLightFromCategory(int categoryId, int lightId) async {
    final db = await _dbHelper.database;
    await db.delete(
      'CategoryLights',
      where: 'categoryId = ? AND lightId = ?',
      whereArgs: [categoryId, lightId],
    );
  }
}
