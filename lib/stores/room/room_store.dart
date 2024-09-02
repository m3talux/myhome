import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:myhome/models/models.dart';
import 'package:myhome/persistence/light_service.dart';
import 'package:myhome/persistence/room_service.dart';
import 'package:myhome/stores/stores.dart';

part 'room_store.g.dart';

class RoomStore = _RoomStore with _$RoomStore;

abstract class _RoomStore with Store {
  Timer? _timer;

  @observable
  bool loading = false;

  @observable
  int? selectedLightId;

  ObservableList<Room> rooms = ObservableList();
  ObservableMap<int, int> states = ObservableMap();

  @computed
  List<Light> get lights {
    List<Light> res = [];

    for (Room r in rooms) {
      res.addAll(r.lights);
    }

    return res;
  }

  @computed
  Light? get selectedLight {
    if (selectedLightId == null) {
      return null;
    }

    for (Light l in lights) {
      if (l.id == selectedLightId) {
        return l;
      }
    }

    return null;
  }

  @action
  Future<void> loadData() async {
    loading = true;

    final RoomService roomService = RoomService();

    rooms.addAll(await roomService.getAllRooms());

    for (Room room in rooms) {
      for (Light l in room.lights) {
        states[l.id] = 0;
        socketStore.sendCommand(l.statusCheck());
      }
    }

    loading = false;
  }

  @action
  void setSelectedLight(int id) {
    selectedLightId = id;
  }

  @action
  void clearSelectedLight() {
    selectedLightId = null;
  }

  @action
  void activateSelectedLight() {
    if (selectedLightId == null) {
      return;
    }

    socketStore.sendCommand(selectedLight!.onCommand());
  }

  @action
  void deactivateSelectedLight() {
    if (selectedLightId == null) {
      return;
    }

    socketStore.sendCommand(selectedLight!.offCommand());
  }

  @action
  void changeSelectedLightDimming(int value) {
    if (selectedLightId == null) {
      return;
    }

    if (!selectedLight!.dimmable) {
      return;
    }

    socketStore.sendCommand(selectedLight!.onCommand(value));
    states[selectedLightId!] = value;
  }

  @action
  Future<void> addRoom(String name) async {
    loading = true;

    final RoomService roomService = RoomService();

    final int id = await roomService.addRoom(name);

    rooms.add(Room(id, name, ObservableList()));

    loading = false;
  }

  @action
  Future<void> updateRoom(Room room) async {
    loading = true;

    final RoomService roomService = RoomService();

    await roomService.updateRoom(room);

    final index = rooms.indexWhere((r) => r.id == room.id);

    rooms[index].name = room.name;

    loading = false;
  }

  @action
  Future<void> addLight(Light light) async {
    loading = true;

    final LightService lightService = LightService();

    await lightService.addLight(light);

    final index = rooms.indexWhere((r) => r.id == light.room);

    rooms[index].lights.add(light);
    states[light.id] = 0;
    socketStore.sendCommand(light.statusCheck());

    loading = false;
  }

  @action
  Future<void> updateLight(Light light) async {
    loading = true;

    final LightService lightService = LightService();

    await lightService.updateLight(light);

    final roomIndex = rooms.indexWhere((r) => r.id == light.id);
    final lightIndex =
        rooms[roomIndex].lights.indexWhere((l) => l.id == light.id);

    rooms[roomIndex].lights[lightIndex] = light;

    loading = false;
  }

  @action
  Future<void> initRoomLights(int roomIdx) async {
    loading = true;

    for (Light l in rooms[roomIdx].lights) {
      socketStore.sendCommand(l.statusCheck());
    }

    loading = false;
  }

  @action
  void onData(String packet) {
    final match = RegExp(r'^\*1\*(\d+)\*(\d+)##$').firstMatch(packet);

    if (match != null) {
      final state = match.group(1);
      final id = match.group(2);

      if (state == null || state == '' || id == null || id == '') {
        return;
      }

      final idInt = int.tryParse(id);
      final stateInt = int.tryParse(state);

      if (idInt == null || stateInt == null) {
        return;
      }

      states[idInt] = stateInt;
    }
  }

  @action
  void launchPeriodicChecks() {
    _timer?.cancel();
    _timer = null;

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      for (Room r in rooms) {
        for (Light light in r.lights) {
          if (light.dimmable && states[light.id]! >= 1) {
            socketStore.sendCommand(light.statusCheck());
          }
        }
      }
    });
  }
}
