// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socket_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SocketStore on _SocketStore, Store {
  Computed<bool>? _$healthyComputed;

  @override
  bool get healthy => (_$healthyComputed ??=
          Computed<bool>(() => super.healthy, name: '_SocketStore.healthy'))
      .value;

  late final _$commandStatusAtom =
      Atom(name: '_SocketStore.commandStatus', context: context);

  @override
  SocketStatus get commandStatus {
    _$commandStatusAtom.reportRead();
    return super.commandStatus;
  }

  @override
  set commandStatus(SocketStatus value) {
    _$commandStatusAtom.reportWrite(value, super.commandStatus, () {
      super.commandStatus = value;
    });
  }

  late final _$monitorStatusAtom =
      Atom(name: '_SocketStore.monitorStatus', context: context);

  @override
  SocketStatus get monitorStatus {
    _$monitorStatusAtom.reportRead();
    return super.monitorStatus;
  }

  @override
  set monitorStatus(SocketStatus value) {
    _$monitorStatusAtom.reportWrite(value, super.monitorStatus, () {
      super.monitorStatus = value;
    });
  }

  late final _$logAtom = Atom(name: '_SocketStore.log', context: context);

  @override
  String get log {
    _$logAtom.reportRead();
    return super.log;
  }

  @override
  set log(String value) {
    _$logAtom.reportWrite(value, super.log, () {
      super.log = value;
    });
  }

  late final _$registerMonitoringAsyncAction =
      AsyncAction('_SocketStore.registerMonitoring', context: context);

  @override
  Future<void> registerMonitoring(dynamic Function(String) onData) {
    return _$registerMonitoringAsyncAction
        .run(() => super.registerMonitoring(onData));
  }

  late final _$startCommandSocketAsyncAction =
      AsyncAction('_SocketStore.startCommandSocket', context: context);

  @override
  Future<void> startCommandSocket() {
    return _$startCommandSocketAsyncAction
        .run(() => super.startCommandSocket());
  }

  late final _$_SocketStoreActionController =
      ActionController(name: '_SocketStore', context: context);

  @override
  void disconnect() {
    final _$actionInfo = _$_SocketStoreActionController.startAction(
        name: '_SocketStore.disconnect');
    try {
      return super.disconnect();
    } finally {
      _$_SocketStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sendCommand(String command) {
    final _$actionInfo = _$_SocketStoreActionController.startAction(
        name: '_SocketStore.sendCommand');
    try {
      return super.sendCommand(command);
    } finally {
      _$_SocketStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sendActions(List<String> commands) {
    final _$actionInfo = _$_SocketStoreActionController.startAction(
        name: '_SocketStore.sendActions');
    try {
      return super.sendActions(commands);
    } finally {
      _$_SocketStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
commandStatus: ${commandStatus},
monitorStatus: ${monitorStatus},
log: ${log},
healthy: ${healthy}
    ''';
  }
}
