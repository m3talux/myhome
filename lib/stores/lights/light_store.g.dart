// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'light_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LightStore on _LightStore, Store {
  late final _$lightsAtom = Atom(name: '_LightStore.lights', context: context);

  @override
  List<Light> get lights {
    _$lightsAtom.reportRead();
    return super.lights;
  }

  @override
  set lights(List<Light> value) {
    _$lightsAtom.reportWrite(value, super.lights, () {
      super.lights = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_LightStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$statesAtom = Atom(name: '_LightStore.states', context: context);

  @override
  Map<int, bool> get states {
    _$statesAtom.reportRead();
    return super.states;
  }

  @override
  set states(Map<int, bool> value) {
    _$statesAtom.reportWrite(value, super.states, () {
      super.states = value;
    });
  }

  late final _$loadLightsAsyncAction =
      AsyncAction('_LightStore.loadLights', context: context);

  @override
  Future<void> loadLights() {
    return _$loadLightsAsyncAction.run(() => super.loadLights());
  }

  late final _$addLightAsyncAction =
      AsyncAction('_LightStore.addLight', context: context);

  @override
  Future<void> addLight(Light light) {
    return _$addLightAsyncAction.run(() => super.addLight(light));
  }

  late final _$_LightStoreActionController =
      ActionController(name: '_LightStore', context: context);

  @override
  void onData(String packet) {
    final _$actionInfo =
        _$_LightStoreActionController.startAction(name: '_LightStore.onData');
    try {
      return super.onData(packet);
    } finally {
      _$_LightStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void launchPeriodicChecks() {
    final _$actionInfo = _$_LightStoreActionController.startAction(
        name: '_LightStore.launchPeriodicChecks');
    try {
      return super.launchPeriodicChecks();
    } finally {
      _$_LightStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lights: ${lights},
loading: ${loading},
states: ${states}
    ''';
  }
}
