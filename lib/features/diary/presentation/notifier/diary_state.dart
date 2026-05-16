import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/tracked_day_entity.dart';

class DiaryState extends Equatable {
  final Map<String, TrackedDayEntity> trackedDayMap;
  final bool usesImperialUnits;

  const DiaryState({
    this.trackedDayMap = const {},
    this.usesImperialUnits = false,
  });

  @override
  List<Object?> get props => [trackedDayMap, usesImperialUnits];
}