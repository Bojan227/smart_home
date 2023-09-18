import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:smart_home/core/enums.dart';
import 'package:smart_home/domain/entities/room_entity.dart';
import 'package:smart_home/domain/usecases/get_rooms_usecase.dart';
import 'package:smart_home/domain/usecases/update_room_status_usecase.dart';

part 'rooms_event.dart';
part 'rooms_state.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  final GetRoomsUseCase getRoomsUseCase;
  final UpdateRoomStatusUseCase updateRoomStatusUseCase;

  RoomsBloc(
      {required this.getRoomsUseCase, required this.updateRoomStatusUseCase})
      : super(const RoomsState(
            roomsStatus: Status.initial,
            rooms: [],
            updateStatus: Status.initial)) {
    on<GetRooms>(_onGetRooms);
    on<UpdateRoomStatus>(_onUpdateRoomStatus);
    on<ReorderRooms>(_onReorderRooms);
  }

  Future<void> _onGetRooms(GetRooms event, Emitter emit) async {
    emit(state.copyWith(roomsStatus: Status.loading));

    try {
      final List<RoomEntity> rooms = await getRoomsUseCase.getRooms();

      emit(state.copyWith(roomsStatus: Status.success, rooms: rooms));
    } catch (_) {
      emit(state.copyWith(roomsStatus: Status.failure));
    }
  }

  Future<void> _onUpdateRoomStatus(UpdateRoomStatus event, Emitter emit) async {
    emit(state.copyWith(updateStatus: Status.loading));

    try {
      final RoomEntity room =
          await updateRoomStatusUseCase.updateRoomStatus(event.roomId);

      List<RoomEntity> copyRooms = List.from(state.rooms);
      int itemIndex =
          copyRooms.indexWhere((element) => element.id == event.roomId);

      copyRooms[itemIndex] = room;

      emit(state.copyWith(
        updateStatus: Status.success,
        rooms: copyRooms,
      ));
    } catch (_) {
      emit(state.copyWith(updateStatus: Status.failure));
    }
  }

  Future<void> _onReorderRooms(ReorderRooms event, Emitter emit) async {
    try {
      List<RoomEntity> copyRooms = List.from(state.rooms);
      final element = copyRooms.removeAt(event.oldIndex);
      copyRooms.insert(event.newIndex, element);

      emit(state.copyWith(
        rooms: copyRooms,
      ));
    } catch (_) {
      emit(state.copyWith(roomsStatus: Status.failure));
    }
  }
}
