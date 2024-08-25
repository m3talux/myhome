import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:myhome/containers/create_light_form.dart';
import 'package:myhome/models/models.dart';
import 'package:myhome/router/router.dart';
import 'package:myhome/stores/stores.dart';

@RoutePage()
class LightScreen extends StatelessWidget {
  final Light? light; // Optional Light model

  const LightScreen({super.key, this.light});

  @override
  Widget build(BuildContext context) {
    // Determine if we are in edit mode or creation mode based on the presence of a light
    final bool isEditMode = light != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? 'Edit Light' : 'Create Light'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CreateLightForm(
          onAction: (Light light) {
            if (isEditMode) {
              lightStore.updateLight(light);
            } else {
              lightStore.addLight(light);
            }

            router.back();
          },
          // Pre-fill form fields with the existing light data if in edit mode
          initialName: light?.name ?? '',
          initialId: light?.id ?? 0,
          initialDimmable: light?.dimmable ?? false,
        ),
      ),
    );
  }
}
