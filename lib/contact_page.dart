import 'package:flutter/material.dart';
import 'package:hiveapp/contact_form.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive Tutorial'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildListView(),
          ),
          ContactFormPage(),
        ],
      ),
    );
  }

// -BuildListView Method
  ListView _buildListView() {
    return ListView(
      children: [
        ListTile(
          title: Text("Name"),
          subtitle: Text('Age'),
        ),
      ],
    );
  }
}
