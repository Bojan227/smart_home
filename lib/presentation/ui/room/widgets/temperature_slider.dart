import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/core/constants/temp_constant.dart';
import 'package:smart_home/presentation/blocs/home/cubit/temperature_cubit.dart';
import 'package:smart_home/presentation/ui/room/widgets/temperature_slider_painter.dart';
import 'dart:math' as math;

import 'package:smart_home/theme/colour_palette.dart';

class TemperatureSlider extends StatelessWidget {
  const TemperatureSlider({
    super.key,
    required this.currentTemp,
    required this.arcRect,
  });

  final int currentTemp;
  final Rect arcRect;

  @override
  Widget build(BuildContext context) {
    final colourPalette = Theme.of(context).extension<ColourPalette>()!;
    final int divisions = tempConstant['divisions']!;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: currentTemp.toDouble(), end: currentTemp.toDouble()),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInExpo,
      builder: (context, _, child) {
        return GestureDetector(
          onPanUpdate: (details) {
            final position = details.localPosition - arcRect.center;
            final angle = math.atan2(position.dy, position.dx);
            final newValue =
                ((1 - (angle / -math.pi)) * (divisions - 1)).round();

            if (currentTemp != newValue &&
                newValue >= 0 &&
                newValue < divisions) {
              context.read<TemperatureCubit>().updateTemperature(newValue);
            }
          },
          child: CustomPaint(
            size: const Size(320, 240),
            painter: TemperatureSliderPainer(
                divisions,
                arcRect,
                (1 - (currentTemp / (divisions - 1))) * -math.pi,
                false,
                currentTemp,
                colourPalette.lightGrayishBlue!,
                colourPalette.blue!,
                colourPalette.orange!),
          ),
        );
      },
      child: const SizedBox(),
    );
  }
}
