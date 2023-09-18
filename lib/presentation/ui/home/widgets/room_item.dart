import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/domain/entities/room_entity.dart';
import 'package:smart_home/presentation/blocs/home/rooms/rooms_bloc.dart';
import 'package:smart_home/presentation/ui/widgets/icon_bubble.dart';
import 'package:smart_home/theme/colour_palette.dart';
import 'package:smart_home/theme/text_theme.dart';

List<Color> colors = [
  Colors.teal,
  Colors.amber,
  Colors.redAccent,
  Colors.purple,
  Colors.lime,
  Colors.blueGrey
];

class RoomItem extends StatelessWidget {
  RoomItem({super.key, required this.roomEntity, required this.index});

  final RoomEntity roomEntity;
  final int index;

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    final colourPalette = Theme.of(context).extension<ColourPalette>()!;
    final textTheme = Theme.of(context).extension<CustomTextTheme>()!;

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconBubble(
                        icon: roomEntity.icon,
                        color: colors[random.nextInt(colors.length)]),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      roomEntity.name,
                      style: textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${roomEntity.deviceCount} Devices",
                      style: textTheme.labelMedium
                          ?.copyWith(color: colourPalette.spunPearl),
                    ),
                  ],
                ),
              ),
              Switch.adaptive(
                value: roomEntity.status,
                onChanged: (value) {
                  context.read<RoomsBloc>().add(
                        UpdateRoomStatus(roomId: roomEntity.id),
                      );
                },
                activeColor: colourPalette.white,
                activeTrackColor: colourPalette.blue,
                inactiveTrackColor: colourPalette.spunPearl,
                inactiveThumbColor: colourPalette.white,
              )
            ],
          ),
          const SizedBox(
            height: 22,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.bolt,
                color: colourPalette.orange,
              ),
              Text(
                roomEntity.consumingDescription,
                style: textTheme.bodyMedium
                    ?.copyWith(color: colourPalette.spunPearl),
              )
            ],
          )
        ],
      ),
    );
  }
}
