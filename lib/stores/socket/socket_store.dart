import 'dart:async';
import 'dart:io';
import 'package:mobx/mobx.dart';
import 'package:myhome/stores/light/light_store.dart';

part 'socket_store.g.dart';

class SocketStore = _SocketStore with _$SocketStore;

abstract class _SocketStore with Store {
  Socket? _commandSocket;
  Socket? _monitoringSocket;
  Timer? _timer;

  final String host;
  final int port;
  final List<LightStore> lights;

  _SocketStore(
      {this.host = '192.168.1.35', this.port = 20000, required this.lights});

  @observable
  String status = 'Disconnected';

  @observable
  String log = '';

  final String _monitorCommand = '*99*1##';
  final String _commandCommand = '*99*9##';

  @action
  Future<void> startMonitoringSocket() async {
    try {
      _monitoringSocket = await Socket.connect(host, port);

      _monitoringSocket!.listen(
          (data) => handleResponse(String.fromCharCodes(data)),
          onError: (error) => _monitoringSocket!.close(),
          onDone: () => startMonitoringSocket());

      _monitoringSocket!.write(_monitorCommand);
    } catch (e) {
      log += 'Failed to connect to monitoring socket: $e\n';
    }
  }

  @action
  Future<void> startCommandSocket() async {
    try {
      _commandSocket = await Socket.connect(host, port);
      _commandSocket!.write(_commandCommand);
    } catch (e) {
      log += 'Failed to connect to command socket: $e\n';
    }
  }

  @action
  Future<void> connect() async {
    await startMonitoringSocket();
    await startCommandSocket();

    launchPeriodicChecks();
  }

  @action
  void launchPeriodicChecks() {
    _timer?.cancel();
    _timer = null;

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      for (LightStore light in lights) {
        if (light.dimmable && light.isOn) {
          sendCommand(light.statusCheck());
        }
      }
    });
  }

  @action
  void disconnect() {
    _monitoringSocket?.destroy();
    _monitoringSocket = null;
    _commandSocket?.destroy();
    _commandSocket = null;
    _timer?.cancel();
    _timer = null;
    status = 'Disconnected';
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
    for (var l in lights) {
      l.onData(response);
    }
  }
}
