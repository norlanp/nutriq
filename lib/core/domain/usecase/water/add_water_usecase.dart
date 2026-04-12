import 'package:nutriq/core/domain/entity/water_entity.dart';
import 'package:nutriq/core/domain/repository/water_repository.dart';

class AddWaterUsecase {
  final WaterRepository _waterRepository;

  AddWaterUsecase(this._waterRepository);

  Future<void> addWater(WaterEntity entity) =>
      _waterRepository.addWater(entity);
}
