part of 'fasting_bloc.dart';

abstract class FastingEvent extends Equatable {
  const FastingEvent();

  @override
  List<Object?> get props => [];
}

class StartFast extends FastingEvent {
  final FastingEntity entity;

  const StartFast({required this.entity});

  @override
  List<Object?> get props => [entity];
}

class EndFast extends FastingEvent {
  final int id;
  final DateTime endTime;

  const EndFast({required this.id, required this.endTime});

  @override
  List<Object?> get props => [id, endTime];
}

class LoadActive extends FastingEvent {
  const LoadActive();
}

class LoadHistory extends FastingEvent {
  final DateTime startDate;
  final DateTime endDate;

  const LoadHistory({required this.startDate, required this.endDate});

  @override
  List<Object?> get props => [startDate, endDate];
}

class LoadStreak extends FastingEvent {
  const LoadStreak();
}

class TickTimer extends FastingEvent {
  const TickTimer();
}
