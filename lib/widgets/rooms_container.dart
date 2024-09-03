import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:myhome/router/router.dart';
import 'package:myhome/router/router.gr.dart';
import 'package:myhome/stores/stores.dart';

class RoomsWidget extends StatelessWidget {
  const RoomsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'All Rooms',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 8,
        ),
        Observer(
          builder: (_) => GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: roomStore.rooms.length,
            itemBuilder: (_, index) => Card(
              color: Colors.white,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                onTap: roomStore.rooms[index].lights.isEmpty
                    ? null
                    : () => router.push(LightsRoute(roomIdx: index)),
                child: Center(
                  child: Text(
                    roomStore.rooms[index].name,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
