import 'package:flutter/material.dart';
import 'package:smart_home/domain/entities/room_entity.dart';
import 'package:smart_home/theme/colour_palette.dart';
import 'package:smart_home/theme/main_config.dart';
import 'package:smart_home/theme/text_theme.dart';

class RoomItem extends StatelessWidget {
  const RoomItem({super.key, required this.roomEntity});

  final RoomEntity roomEntity;

  @override
  Widget build(BuildContext context) {
    final colourPalette = Theme.of(context).extension<ColourPalette>()!;
    final textTheme = Theme.of(context).extension<CustomTextTheme>()!;
    final mainConfig = Theme.of(context).extension<MainConfig>()!;

    return Container(
      padding: EdgeInsets.all(mainConfig.roomCardPadding!),
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
                    roomEntity.icon,
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
                onChanged: (value) {},
                activeColor: colourPalette.white,
                activeTrackColor: colourPalette.blue,
                inactiveTrackColor: colourPalette.spunPearl,
                inactiveThumbColor: colourPalette.white,
              )
            ],
          ),
          const SizedBox(
            height: 24,
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