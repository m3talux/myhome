import 'package:flutter/material.dart';
import 'package:myhome/models/models.dart';
import 'package:myhome/stores/stores.dart';

class CreateLightForm extends StatefulWidget {
  final Function onCreated;

  const CreateLightForm({super.key, required this.onCreated});

  @override
  State<CreateLightForm> createState() => _CreateLightFormState();
}

class _CreateLightFormState extends State<CreateLightForm> {
  final _formKey = GlobalKey<FormState>();

  // Form fields
  String _name = '';
  int _id = 0;
  bool _dimmable = false;
  int? _selectedRoom;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DropdownButtonFormField<int>(
            value: _selectedRoom,
            hint: const Text('Select a room'),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            items: roomStore.rooms.map((room) {
              return DropdownMenuItem<int>(
                value: room.id,
                child: Text(room.name),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedRoom = value;
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Please select a room';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
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
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'ID',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an ID';
              }
              if (int.tryParse(value) == null) {
                return 'ID must be a number';
              }
              return null;
            },
            onSaved: (value) {
              _id = int.parse(value!);
            },
          ),
          const SizedBox(height: 16),
          Row(
            children: <Widget>[
              const Text('Dimmable'),
              Switch(
                value: _dimmable,
                onChanged: (bool value) {
                  setState(() {
                    _dimmable = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  roomStore
                      .addLight(Light(_id, _name, _dimmable, _selectedRoom!));

                  widget.onCreated();

                  _formKey.currentState!.reset();
                  setState(() {
                    _name = '';
                    _dimmable = false;
                    _selectedRoom = null;
                  });
                }
              },
              child: const Text('Create Light'),
            ),
          ),
        ],
      ),
    );
  }
}
