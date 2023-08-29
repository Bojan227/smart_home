import 'package:smart_home/domain/entities/room_entity.dart';

abstract class SmartHomeRepository {
  Future<List<RoomEntity>> getRooms();
}
