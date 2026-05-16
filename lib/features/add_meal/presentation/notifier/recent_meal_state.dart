import 'package:equatable/equatable.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';

class RecentMealState extends Equatable {
  final List<MealEntity> recentMeals;
  final bool usesImperialUnits;
  final bool isLoading;
  final bool hasError;

  const RecentMealState({
    this.recentMeals = const [],
    this.usesImperialUnits = false,
    this.isLoading = false,
    this.hasError = false,
  });

  @override
  List<Object?> get props => [recentMeals, usesImperialUnits, isLoading, hasError];
}