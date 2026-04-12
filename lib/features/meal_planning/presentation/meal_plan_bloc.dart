import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/meal_plan_entity.dart';
import 'package:nutriq/core/domain/repository/meal_plan_repository.dart';
import 'package:nutriq/core/domain/usecase/meal_plan/delete_meal_plan_usecase.dart';
import 'package:nutriq/core/domain/usecase/meal_plan/generate_shopping_list_usecase.dart';
import 'package:nutriq/core/domain/usecase/meal_plan/get_meal_plan_usecase.dart';
import 'package:nutriq/core/domain/usecase/meal_plan/save_meal_plan_usecase.dart';

part 'meal_plan_event.dart';
part 'meal_plan_state.dart';

class MealPlanBloc extends Bloc<MealPlanEvent, MealPlanState> {
  final GetMealPlanUsecase _getMealPlanUsecase;
  final SaveMealPlanUsecase _saveMealPlanUsecase;
  final DeleteMealPlanUsecase _deleteMealPlanUsecase;
  final GenerateShoppingListUsecase _generateShoppingListUsecase;

  MealPlanBloc(
    this._getMealPlanUsecase,
    this._saveMealPlanUsecase,
    this._deleteMealPlanUsecase,
    this._generateShoppingListUsecase,
  ) : super(MealPlanInitial()) {
    on<LoadWeek>(_onLoadWeek);
    on<AddMealToSlot>(_onAddMealToSlot);
    on<RemoveMealFromSlot>(_onRemoveMealFromSlot);
    on<GenerateShoppingList>(_onGenerateShoppingList);
  }

  Future<void> _onLoadWeek(
    LoadWeek event,
    Emitter<MealPlanState> emit,
  ) async {
    emit(MealPlanLoading());
    try {
      final plans = await _getMealPlanUsecase.getByWeek(
        event.startDate,
        event.endDate,
      );
      emit(MealPlanLoaded(plans: plans));
    } catch (e) {
      emit(MealPlanError(e.toString()));
    }
  }

  Future<void> _onAddMealToSlot(
    AddMealToSlot event,
    Emitter<MealPlanState> emit,
  ) async {
    try {
      await _saveMealPlanUsecase.save(event.entity);
      final currentState = state;
      if (currentState is MealPlanLoaded) {
        final updatedPlans = List<MealPlanEntity>.from(currentState.plans)
          ..add(event.entity);
        emit(MealPlanLoaded(plans: updatedPlans));
      } else {
        final now = DateTime.now();
        final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
        final endOfWeek = startOfWeek.add(const Duration(days: 6));
        final plans = await _getMealPlanUsecase.getByWeek(
          startOfWeek,
          endOfWeek,
        );
        emit(MealPlanLoaded(plans: plans));
      }
    } catch (e) {
      emit(MealPlanError(e.toString()));
    }
  }

  Future<void> _onRemoveMealFromSlot(
    RemoveMealFromSlot event,
    Emitter<MealPlanState> emit,
  ) async {
    try {
      await _deleteMealPlanUsecase.delete(event.id);
      final currentState = state;
      if (currentState is MealPlanLoaded) {
        final updatedPlans =
            currentState.plans.where((p) => p.id != event.id).toList();
        emit(MealPlanLoaded(plans: updatedPlans));
      }
    } catch (e) {
      emit(MealPlanError(e.toString()));
    }
  }

  Future<void> _onGenerateShoppingList(
    GenerateShoppingList event,
    Emitter<MealPlanState> emit,
  ) async {
    emit(MealPlanLoading());
    try {
      final items = await _generateShoppingListUsecase(
        event.startDate,
        event.endDate,
      );
      emit(ShoppingListLoaded(items: items));
    } catch (e) {
      emit(MealPlanError(e.toString()));
    }
  }
}
