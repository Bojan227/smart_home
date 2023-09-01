import 'package:flutter/material.dart';
import 'package:smart_home/theme/colour_palette.dart';
import 'package:smart_home/theme/text_theme.dart';

class BottomNavContainer extends StatelessWidget {
  const BottomNavContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final colourPalette = Theme.of(context).extension<ColourPalette>()!;
    final textTheme = Theme.of(context).extension<CustomTextTheme>()!;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: colourPalette.white),
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Add a new device',
          style: textTheme.bodyLarge?.copyWith(color: colourPalette.blue),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
