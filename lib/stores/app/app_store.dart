import 'package:mobx/mobx.dart';
import 'package:myhome/router/router.dart';
import 'package:myhome/router/router.gr.dart';
import 'package:myhome/stores/lights/light_store.dart';
import 'package:myhome/stores/socket/socket_store.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  final SocketStore socketStore;
  final LightStore lightStore;

  _AppStore(this.socketStore, this.lightStore);

  @observable
  bool loading = false;

  @action
  Future<void> init() async {
    loading = true;

    await socketStore.startCommandSocket();
    await lightStore.loadLights();

    await socketStore.registerMonitoring(lightStore.onData);

    loading = false;

    router.replace(const HomeRoute());
  }
}
