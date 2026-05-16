import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/meal_plan/delete_meal_plan_usecase.dart';
import 'package:nutriq/core/domain/usecase/meal_plan/generate_shopping_list_usecase.dart';
import 'package:nutriq/core/domain/usecase/meal_plan/get_meal_plan_usecase.dart';
import 'package:nutriq/core/domain/usecase/meal_plan/save_meal_plan_usecase.dart';
import 'package:nutriq/core/providers/repository_providers.dart';

final getMealPlanUsecaseProvider = Provider((ref) {
  return GetMealPlanUsecase(ref.watch(mealPlanRepositoryProvider));
});

final saveMealPlanUsecaseProvider = Provider((ref) {
  return SaveMealPlanUsecase(ref.watch(mealPlanRepositoryProvider));
});

final deleteMealPlanUsecaseProvider = Provider((ref) {
  return DeleteMealPlanUsecase(ref.watch(mealPlanRepositoryProvider));
});

final generateShoppingListUsecaseProvider = Provider((ref) {
  return GenerateShoppingListUsecase(ref.watch(mealPlanRepositoryProvider));
});