import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/presentation/blocs/home/cubit/temperature_cubit.dart';
import 'package:smart_home/presentation/ui/widgets/icon_bubble.dart';
import 'package:smart_home/theme/colour_palette.dart';

class TemperatureButtons extends StatelessWidget {
  const TemperatureButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final colourPalette = Theme.of(context).extension<ColourPalette>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            context.read<TemperatureCubit>().decrementTemperature();
          },
          child: IconBubble(
            icon: Icons.remove,
            color: colourPalette.blue!,
            bubbleColor: colourPalette.white,
          ),
        ),
        const SizedBox(
          width: 92,
        ),
        GestureDetector(
          onTap: () {
            context.read<TemperatureCubit>().incrementTemperature();
          },
          child: IconBubble(
            icon: Icons.add,
            color: colourPalette.blue!,
            bubbleColor: colourPalette.white,
          ),
        )
      ],
    );
  }
}
