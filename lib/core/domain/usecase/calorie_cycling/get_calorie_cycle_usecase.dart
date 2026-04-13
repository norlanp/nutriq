import 'package:nutriq/core/domain/entity/calorie_cycle_entity.dart';
import 'package:nutriq/core/domain/repository/config_repository.dart';

class GetCalorieCycleUsecase {
  final ConfigRepository _configRepository;

  GetCalorieCycleUsecase(this._configRepository);

  Future<CalorieCycleEntity> call() => _configRepository.getCalorieCycle();
}
