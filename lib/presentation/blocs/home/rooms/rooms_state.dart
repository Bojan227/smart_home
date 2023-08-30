part of '../rooms/rooms_bloc.dart';

@immutable
sealed class RoomsState {}

final class RoomsInitial extends RoomsState {}

final class RoomsLoading extends RoomsState {}

final class RoomsLoaded extends RoomsState {
  final List<RoomEntity> rooms;

  RoomsLoaded({required this.rooms});
}

final class RoomsFailed extends RoomsState {}
