import 'package:nutriq/core/domain/usecase/exercise/get_daily_burned_calories_usecase.dart';

class NetCaloriesUsecase {
  final GetDailyBurnedCaloriesUsecase _getDailyBurnedCaloriesUsecase;

  NetCaloriesUsecase(this._getDailyBurnedCaloriesUsecase);

  Future<double> getNetCalories(
      {required double consumedKcal, required DateTime date}) async {
    final burnedCalories =
        await _getDailyBurnedCaloriesUsecase.getDailyBurnedCalories(date);
    return consumedKcal - burnedCalories;
  }
}
