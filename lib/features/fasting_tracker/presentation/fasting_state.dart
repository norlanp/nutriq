part of 'fasting_bloc.dart';

abstract class FastingState extends Equatable {
  const FastingState();

  @override
  List<Object?> get props => [];
}

class FastingInitial extends FastingState {}

class FastingLoading extends FastingState {}

class FastingActive extends FastingState {
  final FastingEntity fast;
  final Duration elapsed;

  const FastingActive({required this.fast, required this.elapsed});

  @override
  List<Object?> get props => [fast, elapsed];
}

class FastingInactive extends FastingState {}

class FastingHistoryLoaded extends FastingState {
  final List<FastingEntity> fasts;

  const FastingHistoryLoaded({required this.fasts});

  @override
  List<Object?> get props => [fasts];
}

class FastingStreakLoaded extends FastingState {
  final int streak;

  const FastingStreakLoaded({required this.streak});

  @override
  List<Object?> get props => [streak];
}

class FastingError extends FastingState {
  final String message;

  const FastingError(this.message);

  @override
  List<Object?> get props => [message];
}
