import 'package:flutter/cupertino.dart';
import 'package:smart_home/data/models/device_model.dart';
import 'package:smart_home/data/models/room_model.dart';
import 'package:smart_home/domain/entities/device_entity.dart';
import 'package:smart_home/domain/entities/room_entity.dart';

import 'package:smart_home/domain/repositories/smart_home_repository.dart';

List<Device> devices = [
  Device(
    name: 'AC',
    brand: "Samsung",
    fullName: "Air Conditioner",
    consumption: 1.5,
    status: false,
    iconData: const IconData(0xe037, fontFamily: 'MaterialIcons'),
  ),
  Device(
    name: 'Lights',
    status: false,
    brand: "Hyundai",
    fullName: "Lights",
    consumption: 1.1,
    iconData: const IconData(0xe37b, fontFamily: 'MaterialIcons'),
  ),
  Device(
    name: 'TV',
    brand: "Fuego",
    status: false,
    fullName: "TV",
    consumption: 2.2,
    iconData: const IconData(0xe188, fontFamily: 'MaterialIcons'),
  )
];

List<Room> rooms = [
  Room(
    id: 1,
    name: 'Bedroom',
    deviceCount: 6,
    status: false,
    consumingDescription: 'Not Consuming',
    iconData: const IconData(0xe0d7, fontFamily: 'MaterialIcons'),
    devices: devices,
  ),
  Room(
    id: 2,
    name: 'Living Room',
    deviceCount: 12,
    status: true,
    consumingDescription: 'Consuming 18 kWh',
    iconData: const IconData(0xe14d, fontFamily: 'MaterialIcons'),
    devices: devices,
  ),
  Room(
    id: 3,
    name: 'Kitchen',
    deviceCount: 8,
    status: true,
    consumingDescription: 'Consuming 12 kWh',
    iconData: const IconData(0xe35e, fontFamily: 'MaterialIcons'),
    devices: devices,
  ),
  Room(
    id: 4,
    name: 'Bathroom',
    deviceCount: 3,
    status: true,
    consumingDescription: 'Consuming 7 kWh',
    iconData: const IconData(0xe0cf, fontFamily: 'MaterialIcons'),
    devices: devices,
  ),
  Room(
    id: 5,
    name: 'Bathroom',
    deviceCount: 3,
    status: true,
    consumingDescription: 'Consuming 7 kWh',
    iconData: const IconData(0xe0cf, fontFamily: 'MaterialIcons'),
    devices: devices,
  )
];

class SmartHomeRepositoryImpl implements SmartHomeRepository {
  @override
  Future<List<RoomEntity>> getRooms() async {
    List<RoomEntity> roomsMapped = rooms.map(
      (room) {
        return RoomEntity(
            id: room.id,
            name: room.name,
            deviceCount: room.deviceCount,
            status: room.status,
            consumingDescription: room.consumingDescription,
            icon: room.iconData,
            devices: deviceMapper(room.devices));
      },
    ).toList();

    return Future.value(roomsMapped);
  }

  @override
  Future<RoomEntity> updateStatus(int roomId) {
    int roomIndex = rooms.indexWhere((element) => element.id == roomId);
    Room room = rooms[roomIndex];

    Room updatedRoom = Room(
        id: room.id,
        name: room.name,
        deviceCount: room.deviceCount,
        status: !room.status,
        consumingDescription: room.consumingDescription,
        iconData: room.iconData,
        devices: devices);

    rooms[roomIndex] = updatedRoom;
    RoomEntity roomUpdated = RoomEntity(
        id: room.id,
        name: room.name,
        deviceCount: room.deviceCount,
        status: !room.status,
        consumingDescription: room.consumingDescription,
        icon: room.iconData,
        devices: deviceMapper(room.devices));

    return Future.value(roomUpdated);
  }

  List<DeviceEntity> deviceMapper(List<Device> devices) {
    return devices
        .map((device) => DeviceEntity(
            name: device.name,
            brand: device.brand,
            fullName: device.fullName,
            consumption: device.consumption,
            iconData: device.iconData,
            status: device.status))
        .toList();
  }

  @override
  Future<DeviceEntity> updateDeviceStatus(int roomId, int deviceId) {
    // TODO: implement updateDeviceStatus
    throw UnimplementedError();
  }

  @override
  Future<void> reorderRooms(int oldIndex, int newIndex) async {
    final element = rooms.removeAt(oldIndex);
    rooms.insert(newIndex, element);
  }
}
