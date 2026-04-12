import 'package:nutriq/core/domain/repository/meal_plan_repository.dart';

class DeleteMealPlanUsecase {
  final MealPlanRepository _mealPlanRepository;

  DeleteMealPlanUsecase(this._mealPlanRepository);

  Future<void> delete(int id) => _mealPlanRepository.deletePlan(id);
}
