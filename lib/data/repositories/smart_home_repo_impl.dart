import 'package:flutter/cupertino.dart';
import 'package:smart_home/data/models/room_model.dart';
import 'package:smart_home/domain/entities/room_entity.dart';

import 'package:smart_home/domain/repositories/smart_home_repository.dart';

List<Room> rooms = [
  Room(
      name: 'Bedroom',
      deviceCount: 6,
      status: false,
      consumingDescription: 'Not Consuming',
      iconData: const IconData(0xe0d7, fontFamily: 'MaterialIcons')),
  Room(
      name: 'Living Room',
      deviceCount: 12,
      status: true,
      consumingDescription: 'Consuming 18 kWh',
      iconData: const IconData(0xe14d, fontFamily: 'MaterialIcons')),
  Room(
      name: 'Kitchen',
      deviceCount: 8,
      status: true,
      consumingDescription: 'Consuming 12 kWh',
      iconData: const IconData(0xe35e, fontFamily: 'MaterialIcons')),
  Room(
      name: 'Bathroom',
      deviceCount: 3,
      status: true,
      consumingDescription: 'Consuming 7 kWh',
      iconData: const IconData(0xe0cf, fontFamily: 'MaterialIcons')),
  Room(
      name: 'Bathroom',
      deviceCount: 3,
      status: true,
      consumingDescription: 'Consuming 7 kWh',
      iconData: const IconData(0xe0cf, fontFamily: 'MaterialIcons'))
];

class SmartHomeRepositoryImpl implements SmartHomeRepository {
  @override
  Future<List<RoomEntity>> getRooms() async {
    List<RoomEntity> roomsMapped = rooms.map(
      (room) {
        return RoomEntity(
            name: room.name,
            deviceCount: room.deviceCount,
            status: room.status,
            consumingDescription: room.consumingDescription,
            icon: room.iconData);
      },
    ).toList();

    return Future.value(roomsMapped);
  }

  @override
  Future<RoomEntity> updateStatus(int roomId) {
    Room room = rooms[roomId];
    Room updatedRoom = Room(
        name: room.name,
        deviceCount: room.deviceCount,
        status: !room.status,
        consumingDescription: room.consumingDescription,
        iconData: room.iconData);

    rooms[roomId] = updatedRoom;
    RoomEntity roomUpdated = RoomEntity(
        name: room.name,
        deviceCount: room.deviceCount,
        status: !room.status,
        consumingDescription: room.consumingDescription,
        icon: room.iconData);

    return Future.value(roomUpdated);
  }
}
