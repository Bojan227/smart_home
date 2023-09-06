part of 'device_bloc.dart';

sealed class DeviceState extends Equatable {
  const DeviceState();

  @override
  List<Object> get props => [];
}

final class DeviceInitial extends DeviceState {}

final class DeviceStatusInProgress extends DeviceState {}

final class DeviceStatusUpdated extends DeviceState {
  const DeviceStatusUpdated({required this.device});

  final DeviceEntity device;
}

final class DeviceStatusFailed extends DeviceState {}
