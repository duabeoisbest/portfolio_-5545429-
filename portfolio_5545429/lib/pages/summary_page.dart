

import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  final String name, email, about;
  final double sliderValue;
  final Map<String, bool> settings;

  const SummaryPage({
    required this.name,
    required this.email,
    required this.about,
    required this.sliderValue,
    required this.settings,
    // them phan key ? tac dung cua cais nay . alle Daten übergeben ?
    Key? key,
  }) : super(key: key);

   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Zusammenfassung')),
      body:  Padding(padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name: $name\nE-mail: $email\nÜber mich: $about'),
          SizedBox(height: 10),
          Text('Slider-Wert: {$sliderValue.round()}'),
          SizedBox(height: 10),
          Text('Einstellungen:'),
          ...settings.entries.map((e) => Text('${e.key}: ${e.value}')),
        ],
      ),
      ),
    );
   }
   }