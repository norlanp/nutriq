import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/tracked_day_entity.dart';
import 'package:nutriq/core/domain/entity/weight_entity.dart';

enum ViewMode { weekly, monthly }

class ProgressChartsState extends Equatable {
  final List<TrackedDayEntity> trackedDays;
  final List<WeightEntity> weights;
  final DateTime startDate;
  final ViewMode viewMode;
  final bool isLoading;
  final String? errorMessage;

  const ProgressChartsState({
    this.trackedDays = const [],
    this.weights = const [],
    required this.startDate,
    this.viewMode = ViewMode.weekly,
    this.isLoading = false,
    this.errorMessage,
  });

  bool get isLoaded => trackedDays.isNotEmpty || weights.isNotEmpty;
  bool get hasError => errorMessage != null;

  @override
  List<Object?> get props => [trackedDays, weights, startDate, viewMode, isLoading, errorMessage];
}