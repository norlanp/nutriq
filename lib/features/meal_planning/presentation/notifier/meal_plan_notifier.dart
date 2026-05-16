import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/meal_plan_entity.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/meal_planning/presentation/notifier/meal_plan_state.dart';

class MealPlanNotifier extends Notifier<MealPlanState> {
  @override
  MealPlanState build() => const MealPlanState();

  Future<void> loadWeek(DateTime startDate, DateTime endDate) async {
    state = const MealPlanState(isLoading: true);
    try {
      final plans = await ref.read(getMealPlanUsecaseProvider).getByWeek(startDate, endDate);
      state = MealPlanState(plans: plans);
    } catch (e) {
      state = MealPlanState(errorMessage: e.toString());
    }
  }

  Future<void> addMealToSlot(MealPlanEntity entity) async {
    try {
      await ref.read(saveMealPlanUsecaseProvider).save(entity);
      final currentState = state;
      if (currentState.isPlansLoaded) {
        final updatedPlans = List<MealPlanEntity>.from(currentState.plans)
          ..add(entity);
        state = MealPlanState(plans: updatedPlans);
      } else {
        final now = DateTime.now();
        final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
        final endOfWeek = startOfWeek.add(const Duration(days: 6));
        final plans = await ref.read(getMealPlanUsecaseProvider).getByWeek(startOfWeek, endOfWeek);
        state = MealPlanState(plans: plans);
      }
    } catch (e) {
      state = MealPlanState(errorMessage: e.toString());
    }
  }

  Future<void> removeMealFromSlot(int id) async {
    try {
      await ref.read(deleteMealPlanUsecaseProvider).delete(id);
      final currentState = state;
      if (currentState.isPlansLoaded) {
        final updatedPlans = currentState.plans.where((p) => p.id != id).toList();
        state = MealPlanState(plans: updatedPlans);
      }
    } catch (e) {
      state = MealPlanState(errorMessage: e.toString());
    }
  }

  Future<void> generateShoppingList(DateTime startDate, DateTime endDate) async {
    state = const MealPlanState(isLoading: true);
    try {
      final items = await ref.read(generateShoppingListUsecaseProvider)(startDate, endDate);
      state = MealPlanState(shoppingItems: items);
    } catch (e) {
      state = MealPlanState(errorMessage: e.toString());
    }
  }
}

final mealPlanNotifierProvider =
    NotifierProvider<MealPlanNotifier, MealPlanState>(MealPlanNotifier.new);