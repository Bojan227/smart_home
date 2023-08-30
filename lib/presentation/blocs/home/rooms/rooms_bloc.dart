import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:smart_home/domain/entities/room_entity.dart';
import 'package:smart_home/domain/usecases/get_rooms_usecase.dart';

part 'rooms_event.dart';
part 'rooms_state.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  final GetRoomsUseCase useCase;

  RoomsBloc({required this.useCase}) : super(RoomsInitial()) {
    on<GetRooms>(_onGetRooms);
  }

  Future<void> _onGetRooms(GetRooms event, Emitter emit) async {
    emit(RoomsLoading());

    try {
      final List<RoomEntity> rooms = await useCase.getRooms();

      emit(RoomsLoaded(rooms: rooms));
    } catch (_) {
      emit(RoomsFailed());
    }
  }
}
