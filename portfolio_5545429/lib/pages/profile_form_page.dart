import 'package:flutter/material.dart';

class ProfileFormPage extends StatefulWidget {
  @override
  _ProfileFormPageState createState() => _ProfileFormPageState();

}

class _ProfileFormPageState extends State<ProfileFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '', _email = '', _about = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      showDialog(context: context, builder: (_) => AlertDialog(
        title: Text('Eingaben'),
        content: Text('Name: $_name\nEmail: $_email\nÜber mich: $_about'),
        actions: [TextButton(onPressed: () => Navigator.pop(context,
        // hinzufugen beim Absenden
         {'name': _name, 'email': _email, 'about': _about,} ),child: Text('OK')),],
      ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profil bearbeiten')),
      body: Padding(padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
         child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              onSaved: (val) => _name = val ?? '',
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Über mich'),
              maxLines:3,
              onSaved: (val) => _about = val ?? '',
            ),
            ElevatedButton(onPressed: _submitForm, child: Text('Absenden')),
          ],
         ),
         ),
         ),
    );
  }
}