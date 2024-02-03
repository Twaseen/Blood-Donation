import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonorInputPage extends StatefulWidget {
  @override
  _DonorInputPageState createState() => _DonorInputPageState();
}

class _DonorInputPageState extends State<DonorInputPage> {
  final _formKey = GlobalKey<FormState>();
  late String _name, _contactNumber;

  void addDonor() {
    FirebaseFirestore.instance.collection('donors').add({
      'name': _name,
      'contactNumber': _contactNumber,
      'createdAt': Timestamp.now(),
    });
    _formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donor Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Contact Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a contact number';
                  }
                  return null;
                },
                onSaved: (value) => _contactNumber = value!,
              ),
              ElevatedButton(onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
                  addDonor();
                }
              }, child: Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}