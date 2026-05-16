import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/physical_activity_entity.dart';

class RecentActivitiesState extends Equatable {
  final List<PhysicalActivityEntity> recentActivities;
  final bool isLoading;
  final bool hasError;

  const RecentActivitiesState({
    this.recentActivities = const [],
    this.isLoading = false,
    this.hasError = false,
  });

  RecentActivitiesState copyWith({
    List<PhysicalActivityEntity>? recentActivities,
    bool? isLoading,
    bool? hasError,
  }) {
    return RecentActivitiesState(
      recentActivities: recentActivities ?? this.recentActivities,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }

  @override
  List<Object?> get props => [recentActivities, isLoading, hasError];
}