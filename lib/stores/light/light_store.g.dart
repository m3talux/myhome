// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'light_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LightStore on _LightStore, Store {
  Computed<String>? _$commandComputed;

  @override
  String get command => (_$commandComputed ??=
          Computed<String>(() => super.command, name: '_LightStore.command'))
      .value;

  late final _$isOnAtom = Atom(name: '_LightStore.isOn', context: context);

  @override
  bool get isOn {
    _$isOnAtom.reportRead();
    return super.isOn;
  }

  @override
  set isOn(bool value) {
    _$isOnAtom.reportWrite(value, super.isOn, () {
      super.isOn = value;
    });
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
  String toString() {
    return '''
isOn: ${isOn},
command: ${command}
    ''';
  }
}
