import 'package:nutriq/core/domain/repository/tracked_day_repository.dart';
import 'package:nutriq/core/domain/entity/tracked_day_entity.dart';

class GetWeeklyNutritionUsecase {
  final TrackedDayRepository _trackedDayRepository;

  GetWeeklyNutritionUsecase(this._trackedDayRepository);

  Future<List<TrackedDayEntity>> getWeeklyNutrition(
      DateTime startOfWeek) async {
    final endOfWeek = startOfWeek.add(const Duration(days: 6));
    return await _trackedDayRepository.getTrackedDayByRange(
      _startOfDay(startOfWeek),
      _endOfDay(endOfWeek),
    );
  }

  DateTime _startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  DateTime _endOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59);
  }
}
