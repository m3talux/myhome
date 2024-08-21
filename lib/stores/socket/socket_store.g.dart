// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socket_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SocketStore on _SocketStore, Store {
  late final _$statusAtom = Atom(name: '_SocketStore.status', context: context);

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
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

  late final _$startMonitoringSocketAsyncAction =
      AsyncAction('_SocketStore.startMonitoringSocket', context: context);

  @override
  Future<void> startMonitoringSocket() {
    return _$startMonitoringSocketAsyncAction
        .run(() => super.startMonitoringSocket());
  }

  late final _$startCommandSocketAsyncAction =
      AsyncAction('_SocketStore.startCommandSocket', context: context);

  @override
  Future<void> startCommandSocket() {
    return _$startCommandSocketAsyncAction
        .run(() => super.startCommandSocket());
  }

  late final _$connectAsyncAction =
      AsyncAction('_SocketStore.connect', context: context);

  @override
  Future<void> connect() {
    return _$connectAsyncAction.run(() => super.connect());
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
status: ${status},
log: ${log}
    ''';
  }
}
