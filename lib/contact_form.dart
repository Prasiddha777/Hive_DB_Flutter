import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hiveapp/models/contact.dart';

class ContactFormPage extends StatefulWidget {
  const ContactFormPage({super.key});

  @override
  State<ContactFormPage> createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  final _formkey = GlobalKey<FormState>();

  String _name = '';
  String _age = '';

  void addContact(Contact contact) {
    Hive.box('contacts').add(contact);
    // Hive.box('contacts').put(1, value)
    // print('Name:${_name} and Age:${_age}');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  onSaved: (value) => _name = value.toString(),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _age = value.toString(),
                  decoration: InputDecoration(
                    labelText: 'Age',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                _formkey.currentState?.save();
                final newContact = Contact(_name, int.parse(_age));
                addContact(newContact);
              },
              child: Text('New Contacts'),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
