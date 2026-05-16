import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/physical_activity_entity.dart';

class ActivitiesState extends Equatable {
  final List<PhysicalActivityEntity> activities;
  final bool isLoading;
  final bool hasError;

  const ActivitiesState({
    this.activities = const [],
    this.isLoading = false,
    this.hasError = false,
  });

  ActivitiesState copyWith({
    List<PhysicalActivityEntity>? activities,
    bool? isLoading,
    bool? hasError,
  }) {
    return ActivitiesState(
      activities: activities ?? this.activities,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }

  @override
  List<Object?> get props => [activities, isLoading, hasError];
}