import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/weight_entity.dart';

class WeightNotifierState extends Equatable {
  final List<WeightEntity> weights;
  final WeightEntity? latestWeight;
  final bool isLoading;
  final String? errorMessage;

  const WeightNotifierState({
    this.weights = const [],
    this.latestWeight,
    this.isLoading = false,
    this.errorMessage,
  });

  bool get hasError => errorMessage != null;

  @override
  List<Object?> get props => [weights, latestWeight, isLoading, errorMessage];
}