part of 'food_grade_bloc.dart';

abstract class FoodGradeEvent extends Equatable {
  const FoodGradeEvent();

  @override
  List<Object?> get props => [];
}

class CalculateGrade extends FoodGradeEvent {
  final double calories;
  final double proteinG;
  final double fiberG;
  final double sugarG;
  final double sodiumMg;
  final double totalFatG;
  final double saturatedFatG;

  const CalculateGrade({
    required this.calories,
    required this.proteinG,
    required this.fiberG,
    required this.sugarG,
    required this.sodiumMg,
    required this.totalFatG,
    required this.saturatedFatG,
  });

  @override
  List<Object?> get props => [
        calories,
        proteinG,
        fiberG,
        sugarG,
        sodiumMg,
        totalFatG,
        saturatedFatG,
      ];
}

class FilterByMinGrade extends FoodGradeEvent {
  final FoodGrade minGrade;

  const FilterByMinGrade({required this.minGrade});

  @override
  List<Object?> get props => [minGrade];
}
