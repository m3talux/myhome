import 'package:myhome/stores/app/app_store.dart';
import 'package:myhome/stores/navigation/navigation_store.dart';
import 'package:myhome/stores/socket/socket_store.dart';

import 'room/room_store.dart';

// final lights = <LightStore>[
//   LightStore(id: 11, name: 'Indirect Lights', dimmable: true),
//   LightStore(id: 12, name: 'Spots 1'),
//   LightStore(id: 13, name: 'Spots 2'),
//   LightStore(id: 14, name: 'Floor Spots'),
//   LightStore(id: 15, name: 'Outdoor Spots'),
// ];

final socketStore = SocketStore();
final roomStore = RoomStore();
final appStore = AppStore(socketStore, roomStore);
final navigationStore = NavigationStore();
