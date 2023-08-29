import 'package:flutter/material.dart';
import 'package:smart_home/domain/entities/room_entity.dart';

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

  RoomEntity genereteRoomEntity() {
    return RoomEntity(
        name: name,
        deviceCount: deviceCount,
        status: status,
        consumingDescription: consumingDescription,
        icon: Icon(iconData));
  }
}
