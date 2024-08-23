import 'package:flutter/material.dart';

class CreateLightForm extends StatefulWidget {
  final Function(String, int, bool) onCreate;

  const CreateLightForm({super.key, required this.onCreate});

  @override
  State<CreateLightForm> createState() => _CreateLightFormState();
}

class _CreateLightFormState extends State<CreateLightForm> {
  final _formKey = GlobalKey<FormState>();

  // Form fields
  String _name = '';
  int _id = 0;
  bool _dimmable = false;

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

          // Light ID field
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

          // Dimmable switch
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

          // Submit button
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  widget.onCreate(_name, _id, _dimmable);

                  // Optionally reset the form after successful submission
                  _formKey.currentState!.reset();
                  setState(() {
                    _dimmable = false; // Reset the dimmable switch
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
