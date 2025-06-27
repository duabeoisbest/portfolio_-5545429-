// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  final double initialValue;

  const SliderPage({required this.initialValue, super.key});

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  late double _value;

  // Implementieren zur Erwweiterung an main.dart

@override
void initState() {
  super.initState();
  _value = widget.initialValue;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slider Test noch mal')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(

        // dong 33 cu :mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // them dong so 36
          Text('Du bist auf der SliderPage'),
          Text('Wert: ${_value.round()}'),
          Slider(
            value: _value,
            min: 0,
            max: 100,
            divisions: 100,
            label: _value.round().toString(),
            onChanged: (val) => setState(() => _value = val),
          ),
          ElevatedButton(onPressed: () => Navigator.pop(context, _value), child: Text('Zurück'),),
          
        ],
      ),
        ),
          );
  }
}