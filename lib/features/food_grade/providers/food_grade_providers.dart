import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/food_grade/calculate_food_grade_usecase.dart';
import 'package:nutriq/core/domain/usecase/food_grade/filter_foods_by_grade_usecase.dart';

final calculateFoodGradeUsecaseProvider = Provider((ref) {
  return CalculateFoodGradeUsecase();
});

final filterFoodsByGradeUsecaseProvider = Provider((ref) {
  return FilterFoodsByGradeUsecase();
});