import 'package:flutter/material.dart';
import 'package:portfolio_5545429/pages/profile_form_page.dart';
import 'package:portfolio_5545429/pages/settings_page.dart';
import 'package:portfolio_5545429/pages/slider_page.dart';
import 'package:portfolio_5545429/pages/summary_page.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  // Gemeinsamer State
  double sliderValue = 50;
  String name = '', email = '', about = '';
  Map<String, bool> settings = {
    'Newsletter': false,
    'Updates': false,
    'Dunkler Modus': false,
    'Offline-Modus': false,
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio App',
      home: Scaffold(
        appBar: AppBar(title: Text('Startseite')),
        body: Center(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              ElevatedButton(
                child: Text('Slider-Seite'),
                onPressed: () async {
                  final newValue = await _navigateToNextScreen<double>(
                    context,
                    SliderPage(initialValue: sliderValue),
                  );
                  if (newValue != null) {
                    setState(() => sliderValue = newValue);
                  }
                },
              ),

              ElevatedButton(
                child: Text('Profil bearbeiten'),
                onPressed: () async {
                  final result = await Navigator.of(
                    context,
                  ).push<Map<String, String>>(
                    MaterialPageRoute(builder: (context) => ProfileFormPage()),
                  );
                  if (result != null) {
                    setState(() {
                      name = result['name'] ?? '';
                      email = result['email'] ?? '';
                      about = result['about'] ?? '';
                    });
                  }
                },
              ),
              ElevatedButton(
                child: Text('Einstellungen'),
                onPressed: () async {
                  final result = await Navigator.of(
                    context,
                  ).push<Map<String, bool>>(
                    MaterialPageRoute(
                      builder:
                          (context) => SettingsPage(initialSettings: settings),
                    ),
                  );
                  if (result != null) {
                    setState(() => settings = result);
                  }
                },
              ),
              ElevatedButton(
                child: Text('Zusammenfassung'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:
                          (context) => SummaryPage(
                            name: name,
                            email: email,
                            about: about,
                            sliderValue: sliderValue,
                            settings: settings,
                          ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<T?> _navigateToNextScreen<T>(BuildContext context, Widget page) {
    return Navigator.of(
      context,
    ).push<T>(MaterialPageRoute(builder: (context) => page));
  }
}
