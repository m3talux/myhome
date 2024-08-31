import 'package:mobx/mobx.dart';
import 'package:myhome/router/router.dart';
import 'package:myhome/router/router.gr.dart';
import 'package:myhome/stores/room/room_store.dart';
import 'package:myhome/stores/socket/socket_store.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  final SocketStore socketStore;
  final RoomStore roomStore;

  _AppStore(this.socketStore, this.roomStore);

  @observable
  bool loading = false;

  @action
  Future<void> init() async {
    loading = true;

    await socketStore.startCommandSocket();
    await roomStore.loadData();

    await socketStore.registerMonitoring(roomStore.onData);

    roomStore.launchPeriodicChecks();

    loading = false;

    router.replace(const HomeRoute());
  }
}
