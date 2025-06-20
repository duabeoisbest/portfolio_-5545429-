import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  final double initialValue;

  const SliderPage({required this.initialValue, Key? key}) : super(key: key);

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
          // mo rong cho elevatedbutton
          SizedBox(height:20),
          ElevatedButton(
              child: Text('Zurück'),
              onPressed: () => Navigator.pop(context, _value),
              )

        ],
      ),
    );
  }
}