import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';

part 'meal_plan_entity.freezed.dart';

@freezed
class MealPlanEntity with _$MealPlanEntity {
  const MealPlanEntity._();

  const factory MealPlanEntity({
    required int id,
    required int userId,
    required DateTime date,
    required IntakeTypeEntity mealSlot,
    String? recipeId,
    String? mealId,
    String? note,
  }) = _MealPlanEntity;
}