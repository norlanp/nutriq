import 'package:freezed_annotation/freezed_annotation.dart';

part 'autopilot_entity.freezed.dart';

@freezed
abstract class AutopilotEntity with _$AutopilotEntity {
  const factory AutopilotEntity({
    required int id,
    required int userId,
    required int baselineCalorieBudget,
    required int adjustedCalorieBudget,
    required DateTime lastAdjustmentDate,
    required List<int> adjustmentHistoryKcal,
    required bool isEnabled,
  }) = _AutopilotEntity;

  const AutopilotEntity._();
}