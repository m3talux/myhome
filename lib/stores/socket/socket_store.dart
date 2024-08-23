import 'dart:async';
import 'dart:io';
import 'package:mobx/mobx.dart';
import 'package:myhome/models/socker_status.dart';

part 'socket_store.g.dart';

class SocketStore = _SocketStore with _$SocketStore;

abstract class _SocketStore with Store {
  Socket? _commandSocket;
  Socket? _monitoringSocket;
  Timer? _timer;

  final String host;
  final int port;

  _SocketStore({this.host = '192.168.1.35', this.port = 20000});

  @observable
  SocketStatus commandStatus = SocketStatus.disconnected;

  @observable
  SocketStatus monitorStatus = SocketStatus.disconnected;

  @computed
  bool get healthy =>
      commandStatus == SocketStatus.connected &&
      monitorStatus == SocketStatus.connected;

  @observable
  String log = '';

  final String _monitorCommand = '*99*1##';
  final String _commandCommand = '*99*9##';

  @action
  Future<void> registerMonitoring(Function(String) onData) async {
    try {
      monitorStatus = SocketStatus.connecting;

      _monitoringSocket = await Socket.connect(host, port);

      _monitoringSocket!.listen(
        (data) => onData(String.fromCharCodes(data)),
        onError: (error) {
          _monitoringSocket!.close();
          monitorStatus = SocketStatus.error;
        },
        onDone: () => monitorStatus = SocketStatus.disconnected,
      );

      _monitoringSocket!.write(_monitorCommand);

      monitorStatus = SocketStatus.connected;
    } catch (e) {
      log += 'Failed to connect to monitoring socket: $e\n';
    }
  }

  @action
  Future<void> startCommandSocket() async {
    try {
      commandStatus = SocketStatus.connecting;
      _commandSocket = await Socket.connect(host, port);
      _commandSocket!.listen(
        (_) => {},
        onError: (error) {
          _commandSocket!.close();
          commandStatus = SocketStatus.error;
        },
        onDone: () => startCommandSocket(),
      );
      _commandSocket!.write(_commandCommand);
      commandStatus = SocketStatus.connected;
    } catch (e) {
      log += 'Failed to connect to command socket: $e\n';
    }
  }

  @action
  void disconnect() {
    _monitoringSocket?.destroy();
    _monitoringSocket = null;
    _commandSocket?.destroy();
    _commandSocket = null;
    _timer?.cancel();
    _timer = null;
    monitorStatus = SocketStatus.disconnected;
    commandStatus = SocketStatus.disconnected;
    log += 'Disconnected\n';
  }

  @action
  void sendCommand(String command) {
    if (_commandSocket != null) {
      try {
        // Write the command to the socket
        _commandSocket!.write(command);

        // Log the successful sending of the command
        log += 'Successfully sent: $command\n';
      } catch (e) {
        // Log any error that occurs during sending
        log += 'Error sending command: $e\n';
      }
    } else {
      log += 'No active connection\n';
    }
  }

  @action
  void sendActions(List<String> commands) {
    for (String comm in commands) {
      sendCommand(comm);
    }
  }

  void handleResponse(String response) {
    const String ack = '*#*1##';
    const String nAck = '*#*0##';

    if (response == ack || response == nAck) {
      return;
    }

    if (response.endsWith(ack)) {
      response = response.replaceAll(ack, '');
    }

    if (response.endsWith(nAck)) {
      response = response.replaceAll(nAck, '');
    }

    if (response == '') {
      return;
    }

    log += 'Received response: $response\n';
  }
}
