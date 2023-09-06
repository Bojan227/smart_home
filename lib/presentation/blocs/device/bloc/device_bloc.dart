import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_home/domain/entities/device_entity.dart';
import 'package:smart_home/domain/usecases/update_device_status_usecase.dart';

part 'device_event.dart';
part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final UpdateDeviceStatusUseCase useCase;

  DeviceBloc({required this.useCase}) : super(DeviceInitial()) {
    on<UpdateDeviceStatus>(_onUpdateDeviceStatus);
  }

  Future<void> _onUpdateDeviceStatus(
      UpdateDeviceStatus event, Emitter emit) async {
    emit(DeviceStatusInProgress());

    try {
      final DeviceEntity deviceEntity =
          await useCase.updateRoomStatus(event.roomId, event.deviceId);

      emit(DeviceStatusUpdated(device: deviceEntity));
    } catch (error) {
      emit(DeviceStatusFailed());
    }
  }
}
