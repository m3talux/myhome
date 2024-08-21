import 'package:myhome/stores/light/light_store.dart';
import 'package:myhome/stores/socket/socket_store.dart';

final lights = <LightStore>[
  LightStore(id: 11, name: 'Indirect Lights', dimmable: true),
  LightStore(id: 12, name: 'Spots 1'),
  LightStore(id: 13, name: 'Spots 2'),
  LightStore(id: 14, name: 'Floor Spots'),
  LightStore(id: 15, name: 'Outdoor Spots'),
];

final socketStore = SocketStore(lights: lights);
