import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:myhome/models/models.dart';
import 'package:myhome/persistence/light_service.dart';
import 'package:myhome/stores/stores.dart';

part 'light_store.g.dart';

class LightStore = _LightStore with _$LightStore;

abstract class _LightStore with Store {
  Timer? _timer;

  @observable
  List<Light> lights = [];

  @observable
  bool loading = false;

  ObservableMap<int, bool> states = ObservableMap();

  @action
  Future<void> loadLights() async {
    loading = true;

    final LightService lightService = LightService();

    lights = await lightService.getAllLights();

    for (Light l in lights) {
      states[l.id] = false;
    }

    loading = false;
  }

  @action
  Future<void> addLight(Light light) async {
    loading = true;

    final LightService lightService = LightService();

    await lightService.addLight(light);

    lights.add(light);

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

      states[idInt] = stateInt >= 1;
    }
  }

  @action
  void launchPeriodicChecks() {
    _timer?.cancel();
    _timer = null;

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      for (Light light in lights) {
        if (light.dimmable && states[light.id] == true) {
          socketStore.sendCommand(light.statusCheck());
        }
      }
    });
  }
}
