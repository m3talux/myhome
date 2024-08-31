import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:myhome/stores/stores.dart';

class CreateRoomForm extends StatefulWidget {
  final Function onCreated;

  const CreateRoomForm({super.key, required this.onCreated});

  @override
  State<CreateRoomForm> createState() => _CreateRoomForm();
}

class _CreateRoomForm extends State<CreateRoomForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Light Name field
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
            onSaved: (value) {
              _name = value!;
            },
          ),
          const SizedBox(height: 16),
          // Submit button
          Center(
            child: Observer(
              builder: (_) => roomStore.loading
                  ? const SizedBox(
                      width: 40,
                      height: 40,
                      child: LoadingIndicator(
                        indicatorType: Indicator.ballClipRotatePulse,
                        colors: [Colors.purple, Colors.blue, Colors.red],
                        strokeWidth: 2,
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          roomStore.addRoom(_name);

                          widget.onCreated();

                          // Optionally reset the form after successful submission
                          _formKey.currentState!.reset();
                          setState(() {
                            _name = '';
                          });
                        }
                      },
                      child: const Text('Create Room'),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
