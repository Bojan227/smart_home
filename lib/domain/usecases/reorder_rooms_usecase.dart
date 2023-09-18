import 'package:smart_home/domain/repositories/smart_home_repository.dart';

class ReorderRoomsUseCase {
  final SmartHomeRepository smartHomeRepository;

  ReorderRoomsUseCase({required this.smartHomeRepository});

  Future<void> reorderRooms(int oldIndex, int newIndex) async {
    return await smartHomeRepository.reorderRooms(oldIndex, newIndex);
  }
}
