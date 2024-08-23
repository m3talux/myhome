import 'package:flutter/material.dart';
import 'package:myhome/containers/create_light_form.dart';
import 'package:myhome/models/models.dart';
import 'package:myhome/stores/stores.dart';

class DebugContainer extends StatefulWidget {
  const DebugContainer({super.key});

  @override
  State<StatefulWidget> createState() => _DebugContainerState();
}

class _DebugContainerState extends State<DebugContainer> {
  final TextEditingController commandController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CreateLightForm(onCreate: (String name, int id, bool dimmable) {
        final light = Light(id, name, dimmable);

        lightStore.addLight(light);
      }),
    );
  }
}
