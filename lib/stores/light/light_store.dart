import 'package:mobx/mobx.dart';

part 'light_store.g.dart';

class LightStore = _LightStore with _$LightStore;

abstract class _LightStore with Store {
  @observable
  bool isOn = false;

  final int id;
  final String name;
  final bool dimmable;

  _LightStore({
    required this.id,
    required this.name,
    this.dimmable = false,
  });

  @computed
  String get command => isOn ? offCommand() : onCommand();

  // Command to turn the light off
  String offCommand() {
    return '*1*0*$id##';
  }

  // Command to turn the light on
  String onCommand() {
    return '*1*1*$id##';
  }

  // Command to check the light's status
  String statusCheck() {
    return "*#1*$id##";
  }

  // Action to handle incoming data and update the light's state
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

      if (idInt == null || idInt != this.id) {
        return;
      }

      final stateInt = int.tryParse(state);

      if (stateInt == null) {
        return;
      }

      isOn = stateInt >= 1;
    }
  }
}
