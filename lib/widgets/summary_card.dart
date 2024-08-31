import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myhome/containers/create_light_form.dart';
import 'package:myhome/containers/create_room_form.dart';
import 'package:myhome/models/models.dart';
import 'package:myhome/stores/stores.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Observer(
                builder: (_) => _SummaryCardItem(
                  title: 'Rooms',
                  count: roomStore.rooms.length,
                  form: CreateRoomForm(
                    onCreated: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
              const VerticalDivider(
                width: 0,
                thickness: .5,
                color: Colors.grey,
              ),
              Observer(
                builder: (_) => _SummaryCardItem(
                  title: 'Lights',
                  count: roomStore.lights.length,
                  form: CreateLightForm(
                    onCreated: () => Navigator.of(context).pop(),
                  ),
                  disabled: roomStore.rooms.isEmpty,
                  disabledMessage: 'Create a room first',
                ),
              ),
              const VerticalDivider(
                width: 0,
                thickness: .5,
                color: Colors.grey,
              ),
              _SummaryCardItem(
                title: 'Blinds',
                count: 5,
                form: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SummaryCardItem extends StatelessWidget {
  final String title;
  final int count;
  final Widget form;
  final bool disabled;
  final String disabledMessage;

  const _SummaryCardItem({
    required this.title,
    required this.count,
    required this.form,
    this.disabled = false,
    this.disabledMessage = '',
  });

  @override
  Widget build(BuildContext context) {
    const gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.blue, Colors.purple],
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$count',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () {
            disabled
                ? Fluttertoast.showToast(
                    msg: disabledMessage,
                    textColor: Colors.white,
                    backgroundColor: Colors.blue,
                    gravity: ToastGravity.CENTER)
                : showModalBottomSheet(
                    isScrollControlled: true,
                    useSafeArea: true,
                    context: context,
                    builder: (ctx) => Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: form,
                    ),
                  );
          },
          child: Ink(
            decoration: BoxDecoration(
              gradient: disabled ? null : gradient,
              color: disabled ? Colors.grey : null,
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
            child: const Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
