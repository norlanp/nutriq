import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/custom_tracker_entity.dart';
import 'package:nutriq/core/domain/entity/custom_tracker_entry_entity.dart';

class CustomTrackerState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<CustomTrackerEntity> trackers;
  final List<CustomTrackerEntryEntity> entries;

  const CustomTrackerState({
    this.isLoading = false,
    this.errorMessage,
    this.trackers = const [],
    this.entries = const [],
  });

  bool get hasError => errorMessage != null;

  @override
  List<Object?> get props => [isLoading, errorMessage, trackers, entries];
}