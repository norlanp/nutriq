import 'package:nutriq/core/domain/entity/meal_plan_entity.dart';
import 'package:nutriq/core/domain/repository/meal_plan_repository.dart';

class GetMealPlanUsecase {
  final MealPlanRepository _mealPlanRepository;

  GetMealPlanUsecase(this._mealPlanRepository);

  Future<List<MealPlanEntity>> getByDate(DateTime date) =>
      _mealPlanRepository.getByDate(date);

  Future<List<MealPlanEntity>> getByWeek(
          DateTime startDate, DateTime endDate) =>
      _mealPlanRepository.getByWeek(startDate, endDate);
}
