import 'package:nutriq/core/domain/entity/autopilot_entity.dart';
import 'package:nutriq/core/domain/repository/autopilot_repository.dart';

class ToggleAutopilotUsecase {
  final AutopilotRepository _autopilotRepository;

  ToggleAutopilotUsecase(this._autopilotRepository);

  Future<void> call(int userId, bool enabled, int baselineCalories) async {
    final existing = await _autopilotRepository.getAutopilotSettings(userId);
    final entity = AutopilotEntity(
      id: existing?.id ?? 0,
      userId: userId,
      baselineCalorieBudget: baselineCalories,
      adjustedCalorieBudget:
          existing?.adjustedCalorieBudget ?? baselineCalories,
      lastAdjustmentDate: existing?.lastAdjustmentDate ?? DateTime.now(),
      adjustmentHistoryKcal: existing?.adjustmentHistoryKcal ?? [],
      isEnabled: enabled,
    );
    await _autopilotRepository.saveAutopilotSettings(entity);
  }
}
