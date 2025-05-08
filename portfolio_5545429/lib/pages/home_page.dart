import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Willkommen im Portfolio von Ngoc Linh Bui'),
      ),
      body: const Center(
        child: Text('Dies ist die Startseite deines Portfolios.'),
      ),
    );
  }
}