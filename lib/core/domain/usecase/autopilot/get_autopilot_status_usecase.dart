import 'package:nutriq/core/domain/entity/autopilot_entity.dart';
import 'package:nutriq/core/domain/repository/autopilot_repository.dart';

class GetAutopilotStatusUsecase {
  final AutopilotRepository _autopilotRepository;

  GetAutopilotStatusUsecase(this._autopilotRepository);

  Future<AutopilotEntity?> call(int userId) =>
      _autopilotRepository.getAutopilotSettings(userId);
}
