import 'package:flutter/material.dart';
import 'pages/slider_page.dart';
import 'pages/settings_page.dart';
import 'pages/profile_form_page.dart';
import 'pages/summary_page.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // title bei HomePage weg
      home: const HomePage(),
    );
  }
}

class MyPortfolioApp extends  StatefulWidget{
  @override
_MyPortfolioAppState createState() => _MyPortfolioAppState();} 

class _MyPortfolioAppState extends State<MyPortfolioApp> {
  // Gemeinsamer State
  double sliderValue = 50;
  String name = '', email = '', about = '';
  Map<String, bool> settings = {
    'Newsletter' : false,
    'Updates' : false,
    'Dunkler Modus' : false,
    'Offline-Modus' : false, 
  };

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Portfolio App',
      home: Scaffold(
        appBar: AppBar(title: Text('Startseite'),),
        body: Center(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              ElevatedButton(child: Text('Slider-Seite'),
              onPressed: () async{
                final newValue = await Navigator.push<double>(context,MaterialPageRoute(builder: (_) => SliderPage(initialValue: sliderValue),),);
                if (newValue != null){
                  setState(() => sliderValue = newValue);
                }
              },),

              ElevatedButton(child: Text('Profil bearbeiten'),
              onPressed: () async {
                final result = await Navigator.push<Map<String, String>>(context, MaterialPageRoute(builder: (_) => ProfileFormPage()),);
                if (result != null){
                  setState(() {
                    name = result['name'] ?? '';
                    email = result['email'] ??'';
                    about = result['about'] ?? '';
                  });
                }
              },),
              ElevatedButton(child: Text('Einstellungen'),
              onPressed: () async {
                final result = await Navigator.push<Map<String, bool>>(context,MaterialPageRoute(builder: (_) => SettingsPage(initialSettings: settings),),);
                if(result != null) {
                  setState(() => settings = result);
                  }
                },
              ),
              ElevatedButton(child: Text('Zusammenfassung'),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (_) => SummaryPage(name: name, email: email, about: about, sliderValue: sliderValue, settings: settings),),);
              },),
            ], 
          ),
        ),
      ),
    );
  }
}