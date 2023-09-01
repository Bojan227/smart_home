import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/core/constants/temp_constant.dart';
import 'package:smart_home/presentation/blocs/home/cubit/temperature_cubit.dart';
import 'package:smart_home/presentation/ui/room/widgets/temperature_box.dart';
import 'package:smart_home/presentation/ui/room/widgets/temperature_slider.dart';
import 'package:smart_home/presentation/ui/room/widgets/temperature_slider_painter.dart';
import 'package:smart_home/theme/colour_palette.dart';
import 'package:smart_home/theme/text_theme.dart';

class SliderBox extends StatelessWidget {
  const SliderBox({super.key});

  @override
  Widget build(BuildContext context) {
    final colourPalette = Theme.of(context).extension<ColourPalette>()!;
    final textTheme = Theme.of(context).extension<CustomTextTheme>()!;
    final Map<String, int> temperature = tempConstant;
    final int currentTemperature = context.watch<TemperatureCubit>().state;

    return SizedBox(
      width: 350,
      child: LayoutBuilder(
        builder: (context, constraints) {
          const inset = 32.0;
          final arcWidth = constraints.maxWidth - inset * 2;
          // final height = (arcWidth / 2) + inset * 2;
          // final arcHeight = (height - inset * 2) * 2;
          final arcRect = Rect.fromLTRB(
            inset + 10,
            30,
            arcWidth + inset - 10,
            350,
          );

          const imageInset = inset + TemperatureSliderPainer.lineWidth - 1;
          const imageTopInset = inset - TemperatureSliderPainer.lineWidth / 2;

          return Stack(
            fit: StackFit.passthrough,
            children: [
              Positioned(
                bottom: 10,
                child: Text('${temperature['min']!}\u2103',
                    style: textTheme.bodyLarge
                        ?.copyWith(color: colourPalette.blue)),
              ),
              Positioned(
                bottom: 10,
                right: 0,
                child: Text('${temperature['max']!}\u2103',
                    style: textTheme.bodyLarge
                        ?.copyWith(color: colourPalette.blue)),
              ),
              CustomPaint(
                size: const Size(320, 240),
                painter: TemperatureSliderPainer(
                    temperature['divisions']!,
                    arcRect,
                    0,
                    true,
                    currentTemperature,
                    colourPalette.lightGrayishBlue!,
                    colourPalette.blue!,
                    colourPalette.orange!),
              ),
              Positioned(
                left: imageInset + 30,
                top: imageTopInset + 30,
                right: imageInset + 30,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: colourPalette.lightGrayishOrange!,
                      borderRadius: BorderRadius.circular(105)),
                ),
              ),
              TemperatureBox(
                currentTemp: currentTemperature,
                margins: const {
                  "imageInset": imageInset,
                  "imageTopInset": imageTopInset
                },
              ),
              TemperatureSlider(
                currentTemp: currentTemperature,
                arcRect: arcRect,
              )
            ],
          );
        },
      ),
    );
  }
}
