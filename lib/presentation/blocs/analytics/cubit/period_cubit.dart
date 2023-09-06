import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'period_state.dart';

class PeriodCubit extends Cubit<PeriodState> {
  PeriodCubit() : super(const PeriodState(currentPeriod: Period.week));

  void updatePeriod(Period period) {
    emit(PeriodState(currentPeriod: period));
  }
}
