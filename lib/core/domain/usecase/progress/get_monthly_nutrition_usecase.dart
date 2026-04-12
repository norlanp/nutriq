import 'package:nutriq/core/data/repository/tracked_day_repository.dart';
import 'package:nutriq/core/domain/entity/tracked_day_entity.dart';

class GetMonthlyNutritionUsecase {
  final TrackedDayRepository _trackedDayRepository;

  GetMonthlyNutritionUsecase(this._trackedDayRepository);

  Future<List<TrackedDayEntity>> getMonthlyNutrition(
      int year, int month) async {
    final start = DateTime(year, month, 1);
    final end = DateTime(year, month + 1, 0, 23, 59, 59);
    return await _trackedDayRepository.getTrackedDayByRange(start, end);
  }
}
