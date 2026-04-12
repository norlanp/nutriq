import 'package:nutriq/core/domain/repository/meal_plan_repository.dart';

class GenerateShoppingListUsecase {
  final MealPlanRepository _mealPlanRepository;

  GenerateShoppingListUsecase(this._mealPlanRepository);

  Future<List<ShoppingListItem>> call(DateTime startDate, DateTime endDate) =>
      _mealPlanRepository.getShoppingList(startDate, endDate);
}
