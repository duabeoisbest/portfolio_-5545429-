import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _value = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slider - Seite')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            value: _value,
            min: 0,
            max: 100,
            divisions: 100,
            label: _value.round().toString(),
            onChanged: (val) => setState(() => _value = val),
          ),
          Text('Wert: (_value.round()}'),
          // missing $ zeichen inbetween ?
          Container(
            height: 100,
            width: _value,
            color: Colors.blue.withOpacity(_value / 100),
          ), 
        ],
      ),
    );
  }
}