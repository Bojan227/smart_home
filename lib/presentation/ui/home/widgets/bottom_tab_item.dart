import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/presentation/blocs/home/cubit/tab_cubit.dart';
import 'package:smart_home/theme/colour_palette.dart';

class BottomTabItem extends StatelessWidget {
  const BottomTabItem({
    super.key,
    required this.index,
    required this.iconData,
    required this.selectedIndex,
  });

  final int index;
  final IconData iconData;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final colourPalette = Theme.of(context).extension<ColourPalette>()!;

    Color color =
        selectedIndex == index ? colourPalette.blue! : colourPalette.spunPearl!;
    return Expanded(
        child: SizedBox(
      height: double.infinity,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => context.read<TabCubit>().setCurrentIndex(index),
          child: Icon(
            iconData,
            color: color,
          ),
        ),
      ),
    ));
  }
}
