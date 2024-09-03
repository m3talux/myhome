import 'package:myhome/stores/app/app_store.dart';
import 'package:myhome/stores/navigation/navigation_store.dart';
import 'package:myhome/stores/socket/socket_store.dart';

import 'room/room_store.dart';

final socketStore = SocketStore();
final roomStore = RoomStore();
final appStore = AppStore(socketStore, roomStore);
final navigationStore = NavigationStore();
