import 'package:flutter/material.dart';

class RoomEntity {
  final String name;
  final int deviceCount;
  final bool status;
  final String consumingDescription;
  final IconData icon;

  RoomEntity(
      {required this.name,
      required this.deviceCount,
      required this.status,
      required this.consumingDescription,
      required this.icon});
}
