part of 'weight_bloc.dart';

abstract class WeightState extends Equatable {
  const WeightState();

  @override
  List<Object?> get props => [];
}

class WeightInitial extends WeightState {}

class WeightsLoading extends WeightState {}

class WeightsLoaded extends WeightState {
  final List<WeightEntity> weights;
  final WeightEntity? latestWeight;

  const WeightsLoaded({required this.weights, this.latestWeight});

  @override
  List<Object?> get props => [weights, latestWeight];
}

class WeightError extends WeightState {
  final String message;

  const WeightError(this.message);

  @override
  List<Object?> get props => [message];
}
