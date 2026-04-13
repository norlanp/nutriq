import 'package:nutriq/core/domain/entity/food_grade.dart';
import 'package:nutriq/core/domain/service/food_grade_filter.dart';

class FilterFoodsByGradeUsecase {
  final FoodGradeFilter _filter = FoodGradeFilter();

  List<T> call<T>(
    List<T> items,
    FoodGrade minGrade,
    FoodGrade Function(T) gradeExtractor,
  ) {
    return _filter.filterByMinGrade(items, minGrade, gradeExtractor);
  }
}
