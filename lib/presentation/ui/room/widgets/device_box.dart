import 'package:flutter/material.dart';
import 'package:smart_home/domain/entities/device_entity.dart';
import 'package:smart_home/theme/colour_palette.dart';
import 'package:smart_home/theme/main_config.dart';
import 'package:smart_home/theme/text_theme.dart';

class DeviceBox extends StatelessWidget {
  const DeviceBox({super.key, required this.device});

  final DeviceEntity device;

  @override
  Widget build(BuildContext context) {
    final colourPalette = Theme.of(context).extension<ColourPalette>()!;
    final textTheme = Theme.of(context).extension<CustomTextTheme>()!;
    final mainConfig = Theme.of(context).extension<MainConfig>()!;

    return Container(
      width: 250,
      padding: EdgeInsets.all(mainConfig.cardPadding!),
      decoration: BoxDecoration(
        color: colourPalette.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                device.fullName,
                style: textTheme.bodyLarge,
              ),
              Switch.adaptive(
                value: device.status,
                onChanged: (value) {},
                activeColor: colourPalette.white,
                activeTrackColor: colourPalette.blue,
                inactiveTrackColor: colourPalette.spunPearl,
                inactiveThumbColor: colourPalette.white,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                device.brand,
                style: textTheme.labelMedium
                    ?.copyWith(color: colourPalette.spunPearl),
              ),
              Text(
                "${device.consumption}kwh",
                style: textTheme.labelMedium
                    ?.copyWith(color: colourPalette.orange),
              )
            ],
          )
        ],
      ),
    );
  }
}
