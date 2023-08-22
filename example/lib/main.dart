import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() => runApp(const MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color currentColor = const Color(0xFFF5F5F5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ColorPicker(
          header: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Hello'),
              Text('GG'),
            ],
          ),
          footer: const Text('Footer'),
          pickerColor: currentColor,
          onColorChanged: (value) {
            currentColor = value;
            setState(() {});
          },
          colorPickerWidth: 160.0,
          displayThumbColor: true,
        ),
      ),
    );
  }
}
