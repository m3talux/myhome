import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myhome/stores/stores.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class LightControl extends StatelessWidget {
  const LightControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(14.0),
              ),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Observer(
                  builder: (_) => Text(
                    roomStore.selectedLight?.name ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => roomStore.deactivateSelectedLight(),
                      child: SvgPicture.asset(
                        'assets/svg/light_off.svg',
                        width: 42,
                      ),
                    ),
                    Observer(
                      builder: (_) => ((roomStore.selectedLight?.dimmable ??
                                  false) &&
                              roomStore.states[roomStore.selectedLightId]! > 0)
                          ? SfSlider(
                              value: roomStore
                                          .states[roomStore.selectedLightId]! <
                                      2
                                  ? 2
                                  : roomStore.states[roomStore.selectedLightId],
                              onChanged: (val) {
                                roomStore
                                    .changeSelectedLightDimming(val.toInt());
                              },
                              min: 2,
                              max: 10,
                              interval: 2,
                              stepSize: 2,
                              showDividers: true,
                              activeColor: Colors.purple.shade700,
                            )
                          : Container(),
                    ),
                    GestureDetector(
                      onTap: () => roomStore.activateSelectedLight(),
                      child: SvgPicture.asset(
                        'assets/svg/light_on.svg',
                        width: 42,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
