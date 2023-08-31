import 'package:flutter/material.dart';
import 'package:smart_home/presentation/ui/widgets/icon_bubble.dart';
import 'package:smart_home/theme/colour_palette.dart';
import 'package:smart_home/theme/text_theme.dart';

class ConsumptionInfo extends StatelessWidget {
  const ConsumptionInfo(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon});

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colourPalette = Theme.of(context).extension<ColourPalette>()!;
    final textTheme = Theme.of(context).extension<CustomTextTheme>()!;

    return Row(
      children: [
        IconBubble(icon: icon, color: colourPalette.white!),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.bodyLarge?.copyWith(color: colourPalette.white),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              subtitle,
              style: textTheme.bodyMedium?.copyWith(color: colourPalette.white),
            )
          ],
        )
      ],
    );
  }
}
