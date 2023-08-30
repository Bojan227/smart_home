import 'package:smart_home/domain/entities/room_entity.dart';
import 'package:smart_home/domain/repositories/smart_home_repository.dart';

class GetRoomsUseCase {
  final SmartHomeRepository smartHomeRepository;

  GetRoomsUseCase({required this.smartHomeRepository});

  Future<List<RoomEntity>> getRooms() async {
    return await smartHomeRepository.getRooms();
  }
}
