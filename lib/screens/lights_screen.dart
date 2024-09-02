import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:myhome/stores/stores.dart';
import 'package:myhome/widgets/light_control.dart';
import 'package:myhome/widgets/light_widget.dart';

@RoutePage()
class LightsScreen extends StatefulWidget {
  const LightsScreen({super.key, required this.roomIdx});

  final int roomIdx;

  @override
  State<LightsScreen> createState() => _LightsScreenState();
}

class _LightsScreenState extends State<LightsScreen> {
  @override
  void initState() {
    super.initState();

    roomStore.initRoomLights(widget.roomIdx);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          roomStore.rooms[widget.roomIdx].name,
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Observer(
            builder: (_) => roomStore.loading
                ? const SizedBox(
                    width: 80,
                    height: 80,
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballClipRotatePulse,
                      colors: [Colors.purple, Colors.blue, Colors.red],
                      strokeWidth: 2,
                    ),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: roomStore.rooms[widget.roomIdx].lights.length,
                    itemBuilder: (_, index) => LightWidget(
                      light: roomStore.rooms[widget.roomIdx].lights[index],
                    ),
                  ),
          ),
        ),
      ),
      bottomNavigationBar: Observer(
        builder: (_) => roomStore.selectedLightId == null
            ? Container(height: 0)
            : const LightControl(),
      ),
    );
  }

  @override
  void dispose() {
    roomStore.clearSelectedLight();

    super.dispose();
  }
}
