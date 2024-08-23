class Light {
  int id;
  String name;
  bool dimmable;

  Light(this.id, this.name, this.dimmable);

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

class Category {
  int id;
  String name;
  List<Light> lights;
  bool isPreset;

  Category(this.id, this.name, this.lights, this.isPreset);
}
