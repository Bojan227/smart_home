import 'package:flutter_bloc/flutter_bloc.dart';

class SpeedCubit extends Cubit<int> {
  SpeedCubit() : super(1);

  void updateSpeed(int speed) {
    emit(speed + 1);
  }
}
