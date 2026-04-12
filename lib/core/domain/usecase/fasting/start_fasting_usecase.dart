import 'package:nutriq/core/domain/entity/fasting_entity.dart';
import 'package:nutriq/core/domain/repository/fasting_repository.dart';

class StartFastingUsecase {
  final FastingRepository _fastingRepository;

  StartFastingUsecase(this._fastingRepository);

  Future<void> startFast(FastingEntity entity) =>
      _fastingRepository.startFast(entity);
}
