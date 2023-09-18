part of '../rooms/rooms_bloc.dart';

@immutable
sealed class RoomsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetRooms extends RoomsEvent {
  GetRooms();

  @override
  List<Object?> get props => [];
}

class UpdateRoomStatus extends RoomsEvent {
  UpdateRoomStatus({required this.roomId});

  final int roomId;

  @override
  List<Object?> get props => [roomId];
}

class ReorderRooms extends RoomsEvent {
  ReorderRooms({required this.oldIndex, required this.newIndex});

  final int oldIndex;
  final int newIndex;

  @override
  List<Object?> get props => [oldIndex, newIndex];
}
