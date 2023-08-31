import 'package:flutter/material.dart';
import 'package:smart_home/theme/colour_palette.dart';
import 'package:smart_home/theme/text_theme.dart';

class DeviceItem extends StatelessWidget {
  const DeviceItem(
      {super.key,
      required this.label,
      required this.icon,
      required this.isSelected});

  final String label;
  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colourPalette = Theme.of(context).extension<ColourPalette>()!;
    final textTheme = Theme.of(context).extension<CustomTextTheme>()!;

    return Container(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: isSelected ? colourPalette.orange! : null,
              border: Border.all(
                  color: isSelected
                      ? colourPalette.orange!
                      : colourPalette.spunPearl!,
                  width: 1),
              borderRadius: BorderRadius.circular(62),
            ),
            child: Icon(
              icon,
              color:
                  isSelected ? colourPalette.white! : colourPalette.spunPearl!,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            label,
            style: textTheme.labelMedium?.copyWith(
                color: isSelected
                    ? colourPalette.orange
                    : colourPalette.spunPearl),
          )
        ],
      ),
    );
  }
}
