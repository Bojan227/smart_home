import 'package:flutter/material.dart';
import 'package:smart_home/data/models/device_model.dart';

class Room {
  final String name;
  final int deviceCount;
  final bool status;
  final String consumingDescription;
  final IconData iconData;
  final List<Device> devices;

  Room(
      {required this.name,
      required this.deviceCount,
      required this.status,
      required this.consumingDescription,
      required this.iconData,
      required this.devices});
}
