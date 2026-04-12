import 'package:nutriq/core/domain/entity/meal_plan_entity.dart';
import 'package:nutriq/core/domain/repository/meal_plan_repository.dart';

class SaveMealPlanUsecase {
  final MealPlanRepository _mealPlanRepository;

  SaveMealPlanUsecase(this._mealPlanRepository);

  Future<void> save(MealPlanEntity entity) =>
      _mealPlanRepository.addPlan(entity);
}
