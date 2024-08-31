import 'package:mobx/mobx.dart';

class Light {
  int id;
  String name;
  bool dimmable;
  int room;

  Light(this.id, this.name, this.dimmable, this.room);

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
}

class Room {
  int id;
  String name;
  ObservableList<Light> lights;

  Room(this.id, this.name, this.lights);
}
