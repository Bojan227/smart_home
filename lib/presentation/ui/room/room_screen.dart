import 'package:flutter/material.dart';
import 'package:smart_home/domain/entities/room_entity.dart';
import 'package:smart_home/presentation/ui/room/widgets/devices_list.dart';
import 'package:smart_home/presentation/ui/room/widgets/room_header.dart';
import 'package:smart_home/theme/colour_palette.dart';
import 'package:smart_home/theme/main_config.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({super.key, required this.room});

  final RoomEntity room;

  @override
  Widget build(BuildContext context) {
    final mainConfig = Theme.of(context).extension<MainConfig>()!;
    final colourPalette = Theme.of(context).extension<ColourPalette>()!;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [colourPalette.lightGrayishBlue!, colourPalette.white!],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
          ),
          padding:
              EdgeInsets.symmetric(horizontal: mainConfig.homeScreenPadding!),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoomHeader(title: room.name),
              const SizedBox(
                height: 18,
              ),
              DevicesList(
                devices: room.devices,
              )
            ],
          ),
        ),
      ),
    );
  }
}
