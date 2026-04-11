part of 'weight_bloc.dart';

abstract class WeightEvent extends Equatable {
  const WeightEvent();

  @override
  List<Object?> get props => [];
}

class LoadWeights extends WeightEvent {
  final DateTime? startDate;
  final DateTime? endDate;

  const LoadWeights({this.startDate, this.endDate});

  @override
  List<Object?> get props => [startDate, endDate];
}

class AddWeight extends WeightEvent {
  final WeightEntity weight;

  const AddWeight(this.weight);

  @override
  List<Object?> get props => [weight];
}

class DeleteWeight extends WeightEvent {
  final WeightEntity weight;

  const DeleteWeight(this.weight);

  @override
  List<Object?> get props => [weight];
}
