import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myhome/stores/light/light_store.dart';
import 'package:myhome/stores/stores.dart';

class LightWidget extends StatefulWidget {
  final LightStore light;

  const LightWidget({super.key, required this.light});

  @override
  State<LightWidget> createState() => _LightWidgetState();
}

class _LightWidgetState extends State<LightWidget> {
  @override
  void initState() {
    super.initState();

    socketStore.sendCommand(widget.light.statusCheck());
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Bounceable(
        onTap: () {
          socketStore
              .sendActions([widget.light.command, widget.light.statusCheck()]);
        },
        child: Card(
          elevation: 4.0,
          shadowColor: widget.light.isOn ? Colors.yellow : Colors.black54,
          color: Colors.white,
          child: Container(
            width: 100,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  widget.light.isOn
                      ? 'assets/svg/light_on.svg'
                      : 'assets/svg/light_off.svg',
                  width: 36,
                ),
                Text(
                  widget.light.name,
                  style: const TextStyle(fontSize: 10.0),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
