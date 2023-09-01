import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_home/domain/entities/room_entity.dart';
import 'package:smart_home/domain/repositories/smart_home_repository.dart';
import 'package:smart_home/domain/usecases/update_room_status_usecase.dart';

class MockSmartHomeRepository extends Mock implements SmartHomeRepository {}

void main() {
  late UpdateRoomStatusUseCase useCase;
  late MockSmartHomeRepository mockSmartHomeRepository;

  setUp(() {
    mockSmartHomeRepository = MockSmartHomeRepository();
    useCase =
        UpdateRoomStatusUseCase(smartHomeRepository: mockSmartHomeRepository);
  });

  final RoomEntity tRoom = RoomEntity(
    name: 'test',
    deviceCount: 6,
    status: true,
    consumingDescription: 'test',
    icon: const IconData(1),
    devices: [],
  );

  test('should get room entity back', () async {
    //arrange
    when(() => mockSmartHomeRepository.updateStatus(any()))
        .thenAnswer((invocation) async => Future.value(tRoom));
    //act
    final res = await useCase.updateRoomStatus(1);
    // assert

    expect(res, tRoom);
    verify(() => mockSmartHomeRepository.updateStatus(1));
    verifyNoMoreInteractions(mockSmartHomeRepository);
  });
}
