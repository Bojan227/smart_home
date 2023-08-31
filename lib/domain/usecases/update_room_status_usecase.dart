import 'package:smart_home/domain/entities/room_entity.dart';
import 'package:smart_home/domain/repositories/smart_home_repository.dart';

class UpdateRoomStatusUseCase {
  final SmartHomeRepository smartHomeRepository;

  const UpdateRoomStatusUseCase({required this.smartHomeRepository});

  Future<RoomEntity> updateRoomStatus(int roomId) async {
    return await smartHomeRepository.updateStatus(roomId);
  }
}
