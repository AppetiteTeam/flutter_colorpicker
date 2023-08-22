library hsv_picker;

import 'package:flutter/material.dart';
import 'palette.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({
    Key? key,
    required this.pickerColor,
    required this.onColorChanged,
    this.displayThumbColor = false,
    this.colorPickerWidth = 300.0,
    this.pickerAreaBorderRadius = const BorderRadius.all(Radius.zero),
    this.header,
    this.footer,
  }) : super(key: key);

  final Color pickerColor;
  final ValueChanged<Color> onColorChanged;
  final bool displayThumbColor;
  final double colorPickerWidth;
  final BorderRadius pickerAreaBorderRadius;
  final Widget? header;
  final Widget? footer;

  Widget colorPickerSlider(TrackType trackType) {
    return ColorPickerSlider(
      trackType,
      HSVColor.fromColor(pickerColor),
      (HSVColor color) {
        onColorChanged(color.toColor());
      },
      displayThumbColor: displayThumbColor,
    );
  }

  void onColorChanging(HSVColor color) {
    onColorChanged(color.toColor());
  }

  Widget colorPicker() {
    return ClipRRect(
      borderRadius: pickerAreaBorderRadius,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ColorPickerArea(HSVColor.fromColor(pickerColor), onColorChanging),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: colorPickerWidth,
          height: colorPickerWidth,
          child: colorPicker(),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (header != null) header!,
              Column(
                children: <Widget>[
                  SizedBox(height: 30.0, child: colorPickerSlider(TrackType.hue)),
                  SizedBox(height: 30.0, child: colorPickerSlider(TrackType.lightness)),
                ],
              ),
              if (footer != null) footer!,
            ],
          ),
        ),
      ],
    );
  }
}
