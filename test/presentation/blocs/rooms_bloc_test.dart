import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_home/core/enums.dart';
import 'package:smart_home/domain/entities/room_entity.dart';
import 'package:smart_home/domain/usecases/get_rooms_usecase.dart';
import 'package:smart_home/domain/usecases/update_room_status_usecase.dart';
import 'package:smart_home/presentation/blocs/home/rooms/rooms_bloc.dart';

class MockGetRoomsUseCase extends Mock implements GetRoomsUseCase {}

class MockUpdateRoomStatusUseCase extends Mock
    implements UpdateRoomStatusUseCase {}

void main() {
  final GetRoomsUseCase getRoomsUseCase = MockGetRoomsUseCase();
  final UpdateRoomStatusUseCase updateRoomStatusUseCase =
      MockUpdateRoomStatusUseCase();

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

  blocTest<RoomsBloc, RoomsState>(
    'nothing when no event is added',
    build: () => RoomsBloc(
        getRoomsUseCase: getRoomsUseCase,
        updateRoomStatusUseCase: updateRoomStatusUseCase),
    expect: () => const <RoomsBloc>[],
  );

  blocTest(
    '[RoomStatus Loading, RoomsStatus success] when get rooms is emmited',
    setUp: () => when(() => getRoomsUseCase.getRooms())
        .thenAnswer((invocation) => Future.value(tRooms)),
    build: () => RoomsBloc(
        getRoomsUseCase: getRoomsUseCase,
        updateRoomStatusUseCase: updateRoomStatusUseCase),
    act: (bloc) => bloc.add(GetRooms()),
    expect: () => [
      const RoomsState(
          roomsStatus: Status.loading, rooms: [], updateStatus: Status.initial),
      RoomsState(
          roomsStatus: Status.success,
          rooms: tRooms,
          updateStatus: Status.initial)
    ],
  );
}
