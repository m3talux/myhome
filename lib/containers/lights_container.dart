import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:myhome/stores/stores.dart';
import 'package:myhome/widgets/light_widget.dart';

class LightsContainer extends StatefulWidget {
  const LightsContainer({super.key});

  @override
  State<LightsContainer> createState() => _LightsContainerState();
}

class _LightsContainerState extends State<LightsContainer> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ListView.builder(
        itemCount: roomStore.rooms.length,
        itemBuilder: (_, indexA) {
          final room = roomStore.rooms[indexA];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: ExpansionTile(
              title: Text(room.name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: room.lights.length,
                    itemBuilder: (_, indexB) => LightWidget(
                      light: room.lights[indexB],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
