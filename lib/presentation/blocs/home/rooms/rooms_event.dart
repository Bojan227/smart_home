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
