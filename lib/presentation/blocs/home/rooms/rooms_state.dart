// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../rooms/rooms_bloc.dart';

class RoomsState extends Equatable {
  final Status roomsStatus;
  final List<RoomEntity> rooms;
  final Status updateStatus;

  const RoomsState(
      {required this.roomsStatus,
      required this.rooms,
      required this.updateStatus});

  @override
  List<Object?> get props => [roomsStatus, rooms, updateStatus];

  RoomsState copyWith({
    Status? roomsStatus,
    List<RoomEntity>? rooms,
    Status? updateStatus,
  }) {
    return RoomsState(
      roomsStatus: roomsStatus ?? this.roomsStatus,
      rooms: rooms ?? this.rooms,
      updateStatus: updateStatus ?? this.updateStatus,
    );
  }
}
