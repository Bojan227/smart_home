import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:smart_home/domain/entities/room_entity.dart';
import 'package:smart_home/domain/repositories/smart_home_repository.dart';

import 'package:smart_home/domain/usecases/get_rooms_usecase.dart';

class MockSmartHomeRepository extends Mock implements SmartHomeRepository {}

void main() {
  late GetRoomsUseCase useCase;
  late MockSmartHomeRepository mockSmartHomeRepository;

  setUp(() {
    mockSmartHomeRepository = MockSmartHomeRepository();
    useCase = GetRoomsUseCase(smartHomeRepository: mockSmartHomeRepository);
  });

  final List<RoomEntity> tRooms = [
    RoomEntity(
      name: 'test',
      deviceCount: 6,
      status: true,
      consumingDescription: 'test',
      icon: const IconData(1),
      devices: [],
    )
  ];

  test('should get list of rooms', () async {
    //arrange
    when(() => mockSmartHomeRepository.getRooms())
        .thenAnswer((invocation) async => Future.value(tRooms));
    //act
    final res = await useCase.getRooms();
    // assert

    expect(res, tRooms);
    verify(() => mockSmartHomeRepository.getRooms());
    verifyNoMoreInteractions(mockSmartHomeRepository);
  });
}
