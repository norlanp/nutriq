import 'package:nutriq/core/domain/entity/water_entity.dart';
import 'package:nutriq/core/domain/repository/water_repository.dart';

class GetWaterUsecase {
  final WaterRepository _waterRepository;

  GetWaterUsecase(this._waterRepository);

  Future<List<WaterEntity>> getWaterByDate(DateTime date) =>
      _waterRepository.getWaterByDate(date);

  Future<List<WaterEntity>> getWaterBetweenDates(
    DateTime startDate,
    DateTime endDate,
  ) =>
      _waterRepository.getWaterBetweenDates(startDate, endDate);
}
