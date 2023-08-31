import 'package:flutter/material.dart';
import 'package:smart_home/presentation/ui/widgets/icon_bubble.dart';
import 'package:smart_home/theme/colour_palette.dart';
import 'package:smart_home/theme/text_theme.dart';

class RoomHeader extends StatelessWidget {
  const RoomHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final colourPalette = Theme.of(context).extension<ColourPalette>()!;
    final textTheme = Theme.of(context).extension<CustomTextTheme>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: IconBubble(
            icon: Icons.arrow_back_ios,
            color: Colors.black,
            bubbleColor: colourPalette.white,
          ),
        ),
        Text(
          title,
          style: textTheme.bodyLarge?.copyWith(color: colourPalette.darkBlue),
        ),
        const Icon(
          Icons.more_horiz,
          color: Colors.black,
        )
      ],
    );
  }
}
