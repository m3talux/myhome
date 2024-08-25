// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'light_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LightStore on _LightStore, Store {
  Computed<bool>? _$multiSelectionModeComputed;

  @override
  bool get multiSelectionMode => (_$multiSelectionModeComputed ??=
          Computed<bool>(() => super.multiSelectionMode,
              name: '_LightStore.multiSelectionMode'))
      .value;

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

  late final _$categoriesAtom =
      Atom(name: '_LightStore.categories', context: context);

  @override
  List<Category> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<Category> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
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

  late final _$loadDataAsyncAction =
      AsyncAction('_LightStore.loadData', context: context);

  @override
  Future<void> loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }

  late final _$addLightAsyncAction =
      AsyncAction('_LightStore.addLight', context: context);

  @override
  Future<void> addLight(Light light) {
    return _$addLightAsyncAction.run(() => super.addLight(light));
  }

  late final _$updateLightAsyncAction =
      AsyncAction('_LightStore.updateLight', context: context);

  @override
  Future<void> updateLight(Light light) {
    return _$updateLightAsyncAction.run(() => super.updateLight(light));
  }

  late final _$_LightStoreActionController =
      ActionController(name: '_LightStore', context: context);

  @override
  void clearSelectedLights() {
    final _$actionInfo = _$_LightStoreActionController.startAction(
        name: '_LightStore.clearSelectedLights');
    try {
      return super.clearSelectedLights();
    } finally {
      _$_LightStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedLight(Light light) {
    final _$actionInfo = _$_LightStoreActionController.startAction(
        name: '_LightStore.setSelectedLight');
    try {
      return super.setSelectedLight(light);
    } finally {
      _$_LightStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSelectedLight(int id) {
    final _$actionInfo = _$_LightStoreActionController.startAction(
        name: '_LightStore.removeSelectedLight');
    try {
      return super.removeSelectedLight(id);
    } finally {
      _$_LightStoreActionController.endAction(_$actionInfo);
    }
  }

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
categories: ${categories},
loading: ${loading},
multiSelectionMode: ${multiSelectionMode}
    ''';
  }
}
