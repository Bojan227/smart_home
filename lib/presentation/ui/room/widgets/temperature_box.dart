import 'package:flutter/material.dart';
import 'package:smart_home/theme/colour_palette.dart';
import 'package:smart_home/theme/text_theme.dart';

class TemperatureBox extends StatelessWidget {
  const TemperatureBox(
      {super.key, required this.currentTemp, required this.margins});

  final int currentTemp;
  final Map<String, double> margins;

  @override
  Widget build(BuildContext context) {
    final colourPalette = Theme.of(context).extension<ColourPalette>()!;
    final textTheme = Theme.of(context).extension<CustomTextTheme>()!;

    return Positioned(
      left: margins['imageInset']! + 50,
      top: margins['imageTopInset']! + 50,
      right: margins['imageInset']! + 50,
      bottom: 20,
      child: Container(
        decoration: BoxDecoration(
            color: colourPalette.white,
            borderRadius: BorderRadius.circular(105)),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${currentTemp + 10}',
              style: textTheme.title?.copyWith(color: colourPalette.blue),
            ),
            Text(
              '\u00B0Celsius',
              style: textTheme.bodyLarge?.copyWith(color: colourPalette.blue),
            )
          ],
        )),
      ),
    );
  }
}
