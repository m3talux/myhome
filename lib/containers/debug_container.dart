import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Observer(
            builder: (_) => Text('Status: ${socketStore.status}'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: socketStore.connect,
            child: const Text('Connect'),
          ),
          ElevatedButton(
            onPressed: socketStore.disconnect,
            child: const Text('Disconnect'),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: commandController,
            decoration: const InputDecoration(
              labelText: 'Enter Command',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              String command = commandController.text;
              if (command.isNotEmpty) {
                socketStore.sendCommand(command.trim());
              }
            },
            child: const Text('Send Command'),
          ),
          const SizedBox(height: 20),
          const Text('Logs:'),
          Observer(
            builder: (_) => Expanded(
              child: SingleChildScrollView(
                child: Text(socketStore.log),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
