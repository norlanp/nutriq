import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/repository/config_repository.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';

class NetCarbsUsecase {
  final ConfigRepository _configRepository;

  NetCarbsUsecase(this._configRepository);

  Future<bool> isNetCarbsEnabled() async {
    return await _configRepository.getNetCarbsEnabled();
  }

  double getNetCarbsForMeal(MealEntity meal, double amount) {
    return amount * (meal.nutriments.netCarbsPerUnit ?? 0);
  }

  double getNetCarbsForIntake(IntakeEntity intake) {
    return intake.totalNetCarbsGram;
  }

  double getNetCarbsForIntakeList(List<IntakeEntity> intakeList) {
    return intakeList
        .map((intake) => intake.totalNetCarbsGram)
        .fold(0.0, (sum, netCarbs) => sum + netCarbs);
  }
}
