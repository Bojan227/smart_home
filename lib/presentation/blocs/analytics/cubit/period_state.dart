part of 'period_cubit.dart';

enum Period { week, month, year }

class PeriodState extends Equatable {
  final Period currentPeriod;

  const PeriodState({required this.currentPeriod});

  @override
  List<Object> get props => [currentPeriod];
}
