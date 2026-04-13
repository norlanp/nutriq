import 'package:nutriq/core/domain/entity/food_grade.dart';

class FoodGradeFilter {
  List<T> filterByMinGrade<T>(
    List<T> items,
    FoodGrade minGrade,
    FoodGrade Function(T) gradeExtractor,
  ) {
    final minIndex = minGrade.index;
    return items
        .where((item) => gradeExtractor(item).index <= minIndex)
        .toList();
  }
}
