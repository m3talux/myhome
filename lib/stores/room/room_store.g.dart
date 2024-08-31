// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RoomStore on _RoomStore, Store {
  Computed<List<Light>>? _$lightsComputed;

  @override
  List<Light> get lights => (_$lightsComputed ??=
          Computed<List<Light>>(() => super.lights, name: '_RoomStore.lights'))
      .value;

  late final _$loadingAtom = Atom(name: '_RoomStore.loading', context: context);

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
      AsyncAction('_RoomStore.loadData', context: context);

  @override
  Future<void> loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }

  late final _$addRoomAsyncAction =
      AsyncAction('_RoomStore.addRoom', context: context);

  @override
  Future<void> addRoom(String name) {
    return _$addRoomAsyncAction.run(() => super.addRoom(name));
  }

  late final _$updateRoomAsyncAction =
      AsyncAction('_RoomStore.updateRoom', context: context);

  @override
  Future<void> updateRoom(Room room) {
    return _$updateRoomAsyncAction.run(() => super.updateRoom(room));
  }

  late final _$addLightAsyncAction =
      AsyncAction('_RoomStore.addLight', context: context);

  @override
  Future<void> addLight(Light light) {
    return _$addLightAsyncAction.run(() => super.addLight(light));
  }

  late final _$updateLightAsyncAction =
      AsyncAction('_RoomStore.updateLight', context: context);

  @override
  Future<void> updateLight(Light light) {
    return _$updateLightAsyncAction.run(() => super.updateLight(light));
  }

  late final _$_RoomStoreActionController =
      ActionController(name: '_RoomStore', context: context);

  @override
  void onData(String packet) {
    final _$actionInfo =
        _$_RoomStoreActionController.startAction(name: '_RoomStore.onData');
    try {
      return super.onData(packet);
    } finally {
      _$_RoomStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void launchPeriodicChecks() {
    final _$actionInfo = _$_RoomStoreActionController.startAction(
        name: '_RoomStore.launchPeriodicChecks');
    try {
      return super.launchPeriodicChecks();
    } finally {
      _$_RoomStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
lights: ${lights}
    ''';
  }
}
