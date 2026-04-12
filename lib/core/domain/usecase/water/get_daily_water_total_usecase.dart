import 'package:nutriq/core/domain/repository/water_repository.dart';

class GetDailyWaterTotalUsecase {
  final WaterRepository _waterRepository;

  GetDailyWaterTotalUsecase(this._waterRepository);

  Future<int> getDailyTotal(DateTime date) =>
      _waterRepository.getDailyWaterTotal(date);
}
