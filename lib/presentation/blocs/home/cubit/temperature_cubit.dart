import 'package:bloc/bloc.dart';
import 'package:smart_home/core/constants/temp_constant.dart';

class TemperatureCubit extends Cubit<int> {
  TemperatureCubit() : super(0);

  final Map<String, int> temperature = tempConstant;

  void updateTemperature(int temp) {
    emit(temp);
  }

  void incrementTemperature() {
    if (state + 1 > temperature['max']! - 10) return;

    emit(state + 1);
  }

  void decrementTemperature() {
    if (state - 1 < temperature['min']! - 10) return;

    emit(state - 1);
  }
}
