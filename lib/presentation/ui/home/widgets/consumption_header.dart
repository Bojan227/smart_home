import 'package:flutter/material.dart';
import 'package:smart_home/theme/colour_palette.dart';
import 'package:smart_home/theme/text_theme.dart';

class ConsumptionHeader extends StatelessWidget {
  const ConsumptionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).extension<CustomTextTheme>()!;
    final colourPalette = Theme.of(context).extension<ColourPalette>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Energy consumption',
          style: textTheme.bodyLarge?.copyWith(color: colourPalette.white),
        ),
        const SizedBox(
          width: 12,
        ),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: colourPalette.darkBlueWithOpacity),
            child: TextButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.calendar_month,
                color: colourPalette.white,
              ),
              label: Text(
                '16 Nov, 2022',
                style:
                    textTheme.bodyMedium?.copyWith(color: colourPalette.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
