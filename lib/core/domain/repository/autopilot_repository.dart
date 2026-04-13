import 'package:nutriq/core/domain/entity/autopilot_entity.dart';

abstract class AutopilotRepository {
  Future<AutopilotEntity?> getAutopilotSettings(int userId);

  Future<void> saveAutopilotSettings(AutopilotEntity entity);
}
