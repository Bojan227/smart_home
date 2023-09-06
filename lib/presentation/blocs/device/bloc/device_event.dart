part of 'device_bloc.dart';

sealed class DeviceEvent extends Equatable {
  const DeviceEvent();

  @override
  List<Object> get props => [];
}

class UpdateDeviceStatus extends DeviceEvent {
  const UpdateDeviceStatus({required this.roomId, required this.deviceId});

  final int roomId;
  final int deviceId;

  @override
  List<Object> get props => [roomId, deviceId];
}
