import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/domain/entities/room_entity.dart';
import 'package:smart_home/presentation/blocs/home/cubit/tab_cubit.dart';
import 'package:smart_home/presentation/ui/room/widgets/bottom_nav_container.dart';
import 'package:smart_home/presentation/ui/room/widgets/device_box.dart';
import 'package:smart_home/presentation/ui/room/widgets/devices_list.dart';
import 'package:smart_home/presentation/ui/room/widgets/room_header.dart';
import 'package:smart_home/presentation/ui/room/widgets/slider_box.dart';
import 'package:smart_home/presentation/ui/room/widgets/temperature_buttons.dart';
import 'package:smart_home/theme/colour_palette.dart';
import 'package:smart_home/theme/main_config.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({super.key, required this.room});

  final RoomEntity room;

  @override
  Widget build(BuildContext context) {
    final mainConfig = Theme.of(context).extension<MainConfig>()!;
    final colourPalette = Theme.of(context).extension<ColourPalette>()!;
    final int selectedDeviceIndex = context.watch<TabCubit>().state;

    return Scaffold(
      bottomNavigationBar: const BottomNavContainer(),
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
                height: 10,
              ),
              DevicesList(
                devices: room.devices,
              ),
              const SizedBox(
                height: 18,
              ),
              Align(
                alignment: Alignment.center,
                child: DeviceBox(device: room.devices[selectedDeviceIndex]),
              ),
              const Align(
                alignment: Alignment.center,
                child: SliderBox(),
              ),
              const TemperatureButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
