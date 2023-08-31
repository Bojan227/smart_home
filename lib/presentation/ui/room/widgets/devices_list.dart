import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/domain/entities/device_entity.dart';
import 'package:smart_home/presentation/blocs/home/cubit/tab_cubit.dart';
import 'package:smart_home/presentation/ui/room/widgets/device_item.dart';

class DevicesList extends StatelessWidget {
  const DevicesList({super.key, required this.devices});

  final List<DeviceEntity> devices;

  @override
  Widget build(BuildContext context) {
    final int selectedDeviceIndex = context.watch<TabCubit>().state;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        for (MapEntry entry in devices.asMap().entries)
          GestureDetector(
            onTap: () {
              context.read<TabCubit>().setCurrentIndex(entry.key);
            },
            child: DeviceItem(
              label: entry.value.name,
              icon: entry.value.iconData,
              isSelected: entry.key == selectedDeviceIndex,
            ),
          )
      ]),
    );
  }
}
