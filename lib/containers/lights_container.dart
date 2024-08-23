import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 8.0),
        itemBuilder: (_, index) => LightWidget(light: lightStore.lights[index]),
        itemCount: lightStore.lights.length,
      ),
    );
  }
}
