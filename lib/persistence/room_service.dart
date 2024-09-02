import 'package:mobx/mobx.dart';
import 'package:myhome/models/models.dart';
import 'package:myhome/persistence/persistence.dart';
import 'package:sqflite/sqflite.dart';

class RoomService {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  // Add a new room
  Future<int> addRoom(String name) async {
    final db = await _dbHelper.database;
    return db.insert(
      'Rooms',
      {
        'name': name,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Update room details
  Future<void> updateRoom(Room room) async {
    final db = await _dbHelper.database;

    await db.update(
      'Rooms',
      {
        'name': room.name,
      },
      where: 'id = ?',
      whereArgs: [room.id],
    );
  }

  // Retrieve all rooms
  Future<List<Room>> getAllRooms() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('Rooms');
    List<Room> rooms = [];

    for (Map<String, dynamic> data in maps) {
      final List<Map<String, dynamic>> roomMaps =
          await db.query('Lights', where: 'room = ?', whereArgs: [data['id']]);

      rooms.add(
        Room(
          data['id'],
          data['name'],
          ObservableList<Light>.of(
            List.generate(
              roomMaps.length,
              (i) => Light(
                roomMaps[i]['id'],
                roomMaps[i]['name'],
                roomMaps[i]['dimmable'] == 1,
                data['id'],
              ),
            ),
          ),
        ),
      );
    }

    return rooms;
  }

  // Delete a room
  Future<void> deleteRoom(int id) async {
    final db = await _dbHelper.database;

    await db.delete(
      'Rooms',
      where: 'id = ?',
      whereArgs: [id],
    );

    await db.delete(
      'Lights',
      where: 'room = ?',
      whereArgs: [id],
    );
  }
}
