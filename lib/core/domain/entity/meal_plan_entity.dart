import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';

class MealPlanEntity extends Equatable {
  final int id;
  final int userId;
  final DateTime date;
  final IntakeTypeEntity mealSlot;
  final String? recipeId;
  final String? mealId;
  final String? note;

  const MealPlanEntity({
    required this.id,
    required this.userId,
    required this.date,
    required this.mealSlot,
    this.recipeId,
    this.mealId,
    this.note,
  });

  @override
  List<Object?> get props =>
      [id, userId, date, mealSlot, recipeId, mealId, note];
}
