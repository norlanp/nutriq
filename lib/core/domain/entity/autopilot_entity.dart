import 'package:equatable/equatable.dart';

class AutopilotEntity extends Equatable {
  final int id;
  final int userId;
  final int baselineCalorieBudget;
  final int adjustedCalorieBudget;
  final DateTime lastAdjustmentDate;
  final List<int> adjustmentHistoryKcal;
  final bool isEnabled;

  const AutopilotEntity({
    required this.id,
    required this.userId,
    required this.baselineCalorieBudget,
    required this.adjustedCalorieBudget,
    required this.lastAdjustmentDate,
    required this.adjustmentHistoryKcal,
    required this.isEnabled,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        baselineCalorieBudget,
        adjustedCalorieBudget,
        lastAdjustmentDate,
        adjustmentHistoryKcal,
        isEnabled,
      ];
}
