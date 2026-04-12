import 'package:nutriq/core/domain/entity/fasting_entity.dart';
import 'package:nutriq/core/domain/repository/fasting_repository.dart';

class GetActiveFastingUsecase {
  final FastingRepository _fastingRepository;

  GetActiveFastingUsecase(this._fastingRepository);

  Future<FastingEntity?> getActiveFast() => _fastingRepository.getActiveFast();
}
