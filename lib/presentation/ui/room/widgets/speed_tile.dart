import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/core/constants/speed_constant.dart';
import 'package:smart_home/presentation/blocs/home/cubit/speed_cubit.dart';
import 'package:smart_home/theme/colour_palette.dart';

class SpeedTile extends StatelessWidget {
  const SpeedTile({super.key, required this.index, required this.currentSpeed});

  final int index;
  final int currentSpeed;

  @override
  Widget build(BuildContext context) {
    final colourPalette = Theme.of(context).extension<ColourPalette>()!;
    final Map<String, int> speed = speedConstant;

    return GestureDetector(
      onTap: () {
        context.read<SpeedCubit>().updateSpeed(index);
      },
      child: Container(
        width: 65,
        height: 35,
        decoration: BoxDecoration(
          color: index + 1 <= currentSpeed
              ? colourPalette.blue
              : colourPalette.lightGrayishBlue,
          borderRadius: index == speed['min']! - 1
              ? const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                )
              : index == speed['max']! - 1
                  ? const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )
                  : null,
        ),
      ),
    );
  }
}
