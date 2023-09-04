import 'package:flutter/material.dart';
import 'package:smart_home/theme/colour_palette.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final colourPalette = Theme.of(context).extension<ColourPalette>()!;

    return Stack(
      children: [
        const Icon(
          Icons.notifications_outlined,
        ),
        Positioned(
          right: 5,
          top: 4,
          child: Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: colourPalette.blue),
          ),
        ),
      ],
    );
  }
}
