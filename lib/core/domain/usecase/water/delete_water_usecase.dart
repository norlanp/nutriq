import 'package:nutriq/core/domain/entity/water_entity.dart';
import 'package:nutriq/core/domain/repository/water_repository.dart';

class DeleteWaterUsecase {
  final WaterRepository _waterRepository;

  DeleteWaterUsecase(this._waterRepository);

  Future<void> deleteWater(WaterEntity entity) =>
      _waterRepository.deleteWater(entity);
}
