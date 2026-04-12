import 'package:nutriq/core/domain/entity/user_activity_entity.dart';
import 'package:nutriq/core/domain/repository/user_activity_repository.dart';

class GetDailyBurnedCaloriesUsecase {
  final UserActivityRepository _userActivityRepository;

  GetDailyBurnedCaloriesUsecase(this._userActivityRepository);

  Future<double> getDailyBurnedCalories(DateTime date) async {
    final List<UserActivityEntity> activities =
        await _userActivityRepository.getAllUserActivityByDate(date);
    double total = 0;
    for (final activity in activities) {
      total += activity.burnedKcal;
    }
    return total;
  }
}
