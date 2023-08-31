import 'package:flutter/material.dart';
import 'package:smart_home/domain/entities/device_entity.dart';

class RoomEntity {
  final String name;
  final int deviceCount;
  final bool status;
  final String consumingDescription;
  final IconData icon;
  final List<DeviceEntity> devices;

  RoomEntity({
    required this.name,
    required this.deviceCount,
    required this.status,
    required this.consumingDescription,
    required this.icon,
    required this.devices,
  });

  int get numberOfDevices => devices.length;
  double get totalConsumption => devices.fold(
      0, (previousValue, element) => previousValue + element.consumption);
}
