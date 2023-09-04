import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/core/constants/speed_constant.dart';
import 'package:smart_home/presentation/blocs/home/cubit/speed_cubit.dart';
import 'package:smart_home/presentation/ui/room/widgets/speed_tile.dart';
import 'package:smart_home/theme/text_theme.dart';

class SpeedContainer extends StatelessWidget {
  const SpeedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).extension<CustomTextTheme>()!;
    final int currentSpeed = context.watch<SpeedCubit>().state;
    final Map<String, int> speed = speedConstant;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fan Speed',
            style: textTheme.title,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = speed['min']! - 1; i < speed['max']!; i++)
                SpeedTile(
                  index: i,
                  currentSpeed: currentSpeed,
                )
            ],
          )
        ],
      ),
    );
  }
}
