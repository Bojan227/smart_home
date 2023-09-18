import 'package:smart_home/domain/entities/device_entity.dart';
import 'package:smart_home/domain/entities/room_entity.dart';

abstract class SmartHomeRepository {
  Future<List<RoomEntity>> getRooms();
  Future<RoomEntity> updateStatus(int roomId);
  Future<DeviceEntity> updateDeviceStatus(int roomId, int deviceId);
  Future<void> reorderRooms(int oldIndex, int newIndex);
}
