import 'package:nutriq/core/domain/entity/calorie_cycle_entity.dart';
import 'package:nutriq/core/domain/repository/config_repository.dart';

class SaveCalorieCycleUsecase {
  final ConfigRepository _configRepository;

  SaveCalorieCycleUsecase(this._configRepository);

  Future<void> call(CalorieCycleEntity entity) =>
      _configRepository.saveCalorieCycle(entity);
}
