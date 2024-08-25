import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myhome/stores/stores.dart';

class LightWidget extends StatefulWidget {
  final int lightIndex;

  const LightWidget({super.key, required this.lightIndex});

  @override
  State<LightWidget> createState() => _LightWidgetState();
}

class _LightWidgetState extends State<LightWidget> {
  @override
  void initState() {
    super.initState();

    socketStore.sendCommand(lightStore.lights[widget.lightIndex].statusCheck());
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Card(
        elevation: 4.0,
        shadowColor:
            lightStore.states[lightStore.lights[widget.lightIndex].id] == true
                ? Colors.yellow
                : Colors.black54,
        color: Colors.white,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          onTap: () {
            lightStore.isSelected(lightStore.lights[widget.lightIndex].id)
                ? lightStore.removeSelectedLight(
                    lightStore.lights[widget.lightIndex].id)
                : lightStore.multiSelectionMode
                    ? lightStore
                        .setSelectedLight(lightStore.lights[widget.lightIndex])
                    : socketStore.sendActions([
                        lightStore.states[
                                    lightStore.lights[widget.lightIndex].id] ==
                                true
                            ? lightStore.lights[widget.lightIndex].offCommand()
                            : lightStore.lights[widget.lightIndex].onCommand(),
                        lightStore.lights[widget.lightIndex].statusCheck()
                      ]);
          },
          onLongPress: lightStore
                  .isSelected(lightStore.lights[widget.lightIndex].id)
              ? null
              : () {
                  lightStore
                      .setSelectedLight(lightStore.lights[widget.lightIndex]);
                },
          child: Stack(
            children: [
              Container(
                width: 100,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      lightStore.states[
                                  lightStore.lights[widget.lightIndex].id] ==
                              true
                          ? 'assets/svg/light_on.svg'
                          : 'assets/svg/light_off.svg',
                      width: 36,
                    ),
                    Text(
                      lightStore.lights[widget.lightIndex].name,
                      style: const TextStyle(fontSize: 10.0),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: lightStore
                    .isSelected(lightStore.lights[widget.lightIndex].id),
                child: Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      color: Colors.black54.withOpacity(0.5),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.remove_circle_outline,
                        color: Colors.blue,
                        size: 48,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
