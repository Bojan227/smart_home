import 'package:flutter/material.dart';

class Room {
  final String name;
  final int deviceCount;
  final bool status;
  final String consumingDescription;
  final IconData iconData;

  Room(
      {required this.name,
      required this.deviceCount,
      required this.status,
      required this.consumingDescription,
      required this.iconData});
}
