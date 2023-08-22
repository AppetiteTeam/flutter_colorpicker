import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import './pickers/hsv_picker.dart';
import './pickers/material_picker.dart';
import './pickers/block_picker.dart';

void main() => runApp(const MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool lightTheme = true;
  Color currentColor = Colors.amber;
  List<Color> currentColors = [Colors.yellow, Colors.green];
  List<Color> colorHistory = [];

  void changeColor(Color color) => setState(() => currentColor = color);
  void changeColors(List<Color> colors) => setState(() => currentColors = colors);

  @override
  Widget build(BuildContext context) {
    final foregroundColor = useWhiteForeground(currentColor) ? Colors.white : Colors.black;
    return Scaffold(
      body: Center(
        child: ColorPicker(
          header: const Text('Hello'),
          footer: const Text('Footer'),
          pickerColor: Colors.indigo,
          onColorChanged: (value) {},
          colorPickerWidth: 160.0,
          enableLightness: true,
          displayThumbColor: true,
          paletteType: PaletteType.hsvWithHue,
          labelTypes: const [],
        ),
      ),
    );
  }
}
