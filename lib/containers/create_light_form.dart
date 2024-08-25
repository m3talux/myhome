import 'package:flutter/material.dart';
import 'package:myhome/models/models.dart';

class CreateLightForm extends StatefulWidget {
  final Function(Light) onAction;
  final String initialName;
  final int? initialId;
  final bool initialDimmable;

  const CreateLightForm({
    super.key,
    required this.onAction,
    this.initialName = '',
    this.initialId,
    this.initialDimmable = false,
  });

  @override
  State<CreateLightForm> createState() => _CreateLightFormState();
}

class _CreateLightFormState extends State<CreateLightForm> {
  final _formKey = GlobalKey<FormState>();

  // Form fields
  late String _name;
  late int? _id;
  late bool _dimmable;

  @override
  void initState() {
    super.initState();
    _name = widget.initialName;
    _id = widget.initialId;
    _dimmable = widget.initialDimmable;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Light Name field
          TextFormField(
            initialValue: _name,
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
            initialValue: _id?.toString(),
            decoration: const InputDecoration(
              labelText: 'ID',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an ID';
              }
              if (int.tryParse(value) == null || int.parse(value) == 0) {
                return 'ID must be a positive number';
              }
              return null;
            },
            onSaved: (value) {
              _id = int.tryParse(value!);
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
                  widget.onAction(Light(_id ?? 0, _name, _dimmable));

                  // Optionally reset the form after successful submission
                  _formKey.currentState!.reset();
                  setState(() {
                    _dimmable = false; // Reset the dimmable switch
                  });
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
