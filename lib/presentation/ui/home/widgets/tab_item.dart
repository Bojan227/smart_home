import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/presentation/blocs/home/cubit/tab_cubit.dart';
import 'package:smart_home/theme/colour_palette.dart';
import 'package:smart_home/theme/text_theme.dart';

class TabItem extends StatelessWidget {
  const TabItem(
      {super.key,
      required this.label,
      required this.index,
      required this.isActive});

  final String label;
  final bool isActive;
  final int index;

  @override
  Widget build(BuildContext context) {
    final colourPalette = Theme.of(context).extension<ColourPalette>()!;
    final textTheme = Theme.of(context).extension<CustomTextTheme>()!;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: colourPalette.spunPearl,
      onTap: () {
        context.read<TabCubit>().setCurrentIndex(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: isActive ? colourPalette.orange : colourPalette.white),
        child: Text(
          label,
          style: isActive
              ? textTheme.labelMedium?.copyWith(color: colourPalette.white)
              : textTheme.labelMedium,
        ),
      ),
    );
  }
}
